"""
Offline test harness: runs the generated GenExpr (restricted subset) in Python
so stability, levels and NaNs can be checked without Max.

usage: python3 sim.py [preset]   presets: default, extreme, bypass, post
"""
import math, random, re, sys, wave, struct
import numpy as np
import dsp

SR = 48000


class Delay:
    def __init__(self, n):
        self.buf = [0.0] * n
        self.n = n
        self.w = 0

    def read(self, t):
        pos = self.w - t
        i = math.floor(pos)
        f = pos - i
        a = self.buf[i % self.n]
        b = self.buf[(i + 1) % self.n]
        return a + (b - a) * f

    def write(self, x):
        self.buf[self.w] = x
        self.w = (self.w + 1) % self.n


def transpile(code):
    params, hists, delays, body = {}, {}, {}, []
    for line in code.splitlines():
        s = line.strip()
        if not s or s.startswith("//"):
            continue
        m = re.match(r"Param (\w+)\(([-\d.]+), min=([-\d.]+), max=([-\d.]+)\);", s)
        if m:
            params[m.group(1)] = (float(m.group(2)), float(m.group(3)), float(m.group(4)))
            continue
        m = re.match(r"History (\w+)\(([-\d.]+)\);", s)
        if m:
            hists[m.group(1)] = float(m.group(2))
            continue
        m = re.match(r"Delay (\w+)\((\d+)\);", s)
        if m:
            delays[m.group(1)] = int(m.group(2))
            continue
        assert s.endswith(";"), s
        body.append(s[:-1])
    return params, hists, delays, body


def make_runner(code):
    params, hists, delays, body = transpile(code)
    src = ["def run(IN1, IN2, P, D, N):"]
    src.append("    O1 = [0.0]*N; O2 = [0.0]*N")
    for p in params:
        src.append(f"    {p} = P['{p}']")
    for h, v in hists.items():
        src.append(f"    {h} = {v}")
    for d in delays:
        src.append(f"    {d} = D['{d}']")
    src.append(f"    samplerate = {SR}.0")
    src.append("    for n in range(N):")
    src.append("        in1 = IN1[n]; in2 = IN2[n]")
    for b in body:
        b = b.replace("noise()", "rnd()")
        src.append("        " + b)
    src.append("        O1[n] = out1; O2[n] = out2")
    src.append("    return O1, O2")
    env = dict(
        math=math, tan=math.tan, exp=math.exp, sin=math.sin, cos=math.cos,
        pow=math.pow, sqrt=math.sqrt, abs=abs, tanh=math.tanh, floor=math.floor,
        clamp=lambda x, a, b: a if x < a else (b if x > b else x),
        max=max, min=min, pi=math.pi, twopi=2 * math.pi,
        rnd=lambda: random.uniform(-1, 1),
    )
    exec("\n".join(src), env)
    return env["run"], params, delays


def guitar(seconds=4.0):
    """Karplus-Strong strummed chords, roughly -12 dBFS peaks."""
    n = int(seconds * SR)
    out = np.zeros(n)
    chords = [[82.4, 123.5, 164.8, 207.7, 246.9, 329.6], [110, 164.8, 220, 277.2, 329.6]]
    t0 = 0
    for c, chord in enumerate(chords * 2):
        for k, f in enumerate(chord):
            L = int(SR / f)
            buf = np.random.uniform(-1, 1, L)
            start = t0 + k * 400
            y = np.zeros(int(SR * 1.2))
            for i in range(len(y)):
                v = buf[i % L]
                buf[i % L] = 0.996 * 0.5 * (v + buf[(i + 1) % L])
                y[i] = v
            end = min(n, start + len(y))
            out[start:end] += y[: end - start]
        t0 += int(SR * 0.9)
    out = out / np.max(np.abs(out)) * 0.25
    return out


PRESETS = {
    "default": {},
    "bypass": {k: 0 for k in ["drop_on", "vibe_on", "eq_on", "verb_on", "echo_on", "pre_on", "tape_on"]},
    "post": {"verb_pos": 1, "echo_on": 1, "echo_pos": 0},
    "extreme": {"gtr_gain": 24, "drop_semi": -24, "vibe_depth": 1, "vibe_rate": 10, "eq_logain": 15,
                "eq_midgain": 15, "eq_midq": 6, "eq_higain": 15, "verb_decay": 8, "verb_size": 1, "verb_fuzz": 1,
                "verb_mix": 1, "verb_tone": 1, "echo_on": 1, "echo_fb": 1.05, "echo_time": 20, "echo_mix": 1,
                "echo_tone": 1, "echo_wob": 1, "echo_pp": 1, "pre_trim": 48, "pre_fader": 24, "pre_bass": 12,
                "pre_treble": 12, "pre_level": 12, "tape_wow": 1, "tape_flutter": 1, "tape_sat": 1, "tape_hiss": 1,
                "tape_drop": 1, "out_width": 2, "out_gain": 12},
}


def main():
    preset = sys.argv[1] if len(sys.argv) > 1 else "default"
    code = dsp.build()
    run, params, delays = make_runner(code)
    P = {k: v[0] for k, v in params.items()}
    P.update(PRESETS[preset])
    D = {k: Delay(v) for k, v in delays.items()}
    x = guitar()
    N = len(x) + SR * 2
    xin = np.concatenate([x, np.zeros(SR * 2)])
    o1, o2 = run(list(xin), list(xin), P, D, N)
    o = np.array([o1, o2])
    finite = np.all(np.isfinite(o))
    pk = np.max(np.abs(o))
    rms = np.sqrt(np.mean(o ** 2))
    tail = np.sqrt(np.mean(o[:, -SR // 2:] ** 2))
    print(f"{preset}: finite={finite} in_peak={np.max(np.abs(xin)):.3f} out_peak={pk:.3f} "
          f"out_rms={rms:.4f} ({20*np.log10(rms+1e-12):.1f} dB) tail_rms={tail:.5f} "
          f"LR_corr={np.corrcoef(o[0], o[1])[0,1]:.3f}")
    # spectrum summary
    sp = np.abs(np.fft.rfft(o[0][: SR * 3]))
    fr = np.fft.rfftfreq(SR * 3, 1 / SR)
    bands = [(20, 150), (150, 600), (600, 2500), (2500, 6000), (6000, 16000)]
    print("   band energy dB:", " ".join(
        f"{a}-{b}:{10*np.log10(np.sum(sp[(fr>=a)&(fr<b)]**2)+1e-9):.0f}" for a, b in bands))
    with wave.open(f"/tmp/sim_{preset}.wav", "wb") as w:
        w.setnchannels(2); w.setsampwidth(2); w.setframerate(SR)
        data = np.clip(o.T, -1, 1)
        w.writeframes((data * 32767).astype("<i2").tobytes())


if __name__ == "__main__":
    main()
