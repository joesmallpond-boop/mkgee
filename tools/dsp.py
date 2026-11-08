"""
Generates the GenExpr code for the MKGEE RIG device.

Everything lives in one gen~ codebox. State is only ever held in explicitly
declared History / Delay objects (no stateful built-ins like phasor/slide),
so the code can also be run offline by tools/sim.py for testing.

Signal chain (Mk.gee's rig, in order):
  IN     guitar input trim + pickup tone roll-off
  DROP   DigiTech Drop style pitch shift down (baritone)
  VIBE   Boss CE-2W  (CE-2 chorus / CE-1 vibrato)
  EQ     Empress ParaEq style low cut + 3 band parametric
  VERB   Rainger Reverb-X style fuzzed reverb      (pre or post 424)
  ECHO   Boss DD-20 style delay with tape wobble    (pre or post 424)
  424    Tascam Portastudio 424 MkI channel preamp (Trim > EQ > Fader)
  TAPE   cassette: wow, flutter, saturation, hiss, HF loss, dropouts
  OUT    dry/wet, width, output
"""

# ---------------------------------------------------------------------------
# Parameter table
# (name, default, min, max, short label, unitstyle, exponent, kind, enum)
# unitstyle: 0 int, 1 float, 2 ms, 3 Hz, 4 dB, 5 %, 7 semitones
# kind: 'dial' | 'toggle' | 'tab'
# ---------------------------------------------------------------------------
SECTIONS = [
    ("IN", "GUITAR IN", [
        ("gtr_gain", 0.0, -24.0, 24.0, "Input", 4, 1.0, "dial", None),
        ("gtr_tone", 6500.0, 1500.0, 20000.0, "Pickup", 3, 2.0, "dial", None),
    ]),
    ("DROP", "DROP  pitch", [
        ("drop_on", 1, 0, 1, "Drop", 0, 1, "toggle", None),
        ("drop_semi", -5, -24, 12, "Semis", 7, 1.0, "dial", None),
        ("drop_mix", 1.0, 0.0, 1.0, "Blend", 5, 1.0, "dial", None),
        ("drop_glide", 30.0, 1.0, 2000.0, "Glide", 2, 3.0, "dial", None),
        ("drop_grain", 55.0, 15.0, 100.0, "Grain", 2, 1.0, "dial", None),
    ]),
    ("VIBE", "CE-2W  vibe", [
        ("vibe_on", 1, 0, 1, "Vibe", 0, 1, "toggle", None),
        ("vibe_mode", 1, 0, 1, "Mode", 0, 1, "tab", ["CHO", "VIB"]),
        ("vibe_rate", 0.7, 0.05, 10.0, "Rate", 3, 2.5, "dial", None),
        ("vibe_depth", 0.25, 0.0, 1.0, "Depth", 5, 1.0, "dial", None),
        ("vibe_tone", 0.5, 0.0, 1.0, "BBD", 5, 1.0, "dial", None),
    ]),
    ("EQ", "PARA EQ", [
        ("eq_on", 1, 0, 1, "EQ", 0, 1, "toggle", None),
        ("eq_lofreq", 200.0, 40.0, 800.0, "LoFreq", 3, 2.0, "dial", None),
        ("eq_logain", -2.0, -15.0, 15.0, "LoGain", 4, 1.0, "dial", None),
        ("eq_midfreq", 1200.0, 200.0, 6000.0, "MidFreq", 3, 2.5, "dial", None),
        ("eq_midgain", 2.0, -15.0, 15.0, "MidGain", 4, 1.0, "dial", None),
        ("eq_hifreq", 6000.0, 1500.0, 16000.0, "HiFreq", 3, 2.0, "dial", None),
        ("eq_higain", -3.0, -15.0, 15.0, "HiGain", 4, 1.0, "dial", None),
        ("eq_lowcut", 70.0, 20.0, 400.0, "LowCut", 3, 2.0, "dial", None),
        ("eq_midq", 0.8, 0.2, 6.0, "MidQ", 1, 2.0, "dial", None),
    ]),
    ("VERB", "REVERB-X  fuzz verb", [
        ("verb_on", 1, 0, 1, "Verb", 0, 1, "toggle", None),
        ("verb_pos", 0, 0, 1, "VerbPos", 0, 1, "tab", ["PRE", "POST"]),
        ("verb_decay", 1.2, 0.1, 8.0, "Decay", 1, 2.5, "dial", None),
        ("verb_size", 0.4, 0.0, 1.0, "Size", 5, 1.0, "dial", None),
        ("verb_tone", 0.4, 0.0, 1.0, "Tone", 5, 1.0, "dial", None),
        ("verb_fuzz", 0.35, 0.0, 1.0, "Fuzz", 5, 1.0, "dial", None),
        ("verb_mix", 0.25, 0.0, 1.0, "VMix", 5, 1.0, "dial", None),
    ]),
    ("ECHO", "DD-20  echo", [
        ("echo_on", 0, 0, 1, "Echo", 0, 1, "toggle", None),
        ("echo_pos", 1, 0, 1, "EchoPos", 0, 1, "tab", ["PRE", "POST"]),
        ("echo_time", 380.0, 20.0, 2000.0, "Time", 2, 2.0, "dial", None),
        ("echo_fb", 0.3, 0.0, 1.05, "Repeats", 5, 1.0, "dial", None),
        ("echo_tone", 0.45, 0.0, 1.0, "ETone", 5, 1.0, "dial", None),
        ("echo_wob", 0.2, 0.0, 1.0, "Wobble", 5, 1.0, "dial", None),
        ("echo_pp", 0.0, 0.0, 1.0, "PingPong", 5, 1.0, "dial", None),
        ("echo_mix", 0.2, 0.0, 1.0, "EMix", 5, 1.0, "dial", None),
    ]),
    ("424", "TASCAM 424  preamp", [
        ("pre_on", 1, 0, 1, "424", 0, 1, "toggle", None),
        ("pre_trim", 22.0, 0.0, 48.0, "Trim", 4, 1.0, "dial", None),
        ("pre_fader", 6.0, -12.0, 24.0, "Fader", 4, 1.0, "dial", None),
        ("pre_bass", -2.0, -12.0, 12.0, "Bass", 4, 1.0, "dial", None),
        ("pre_treble", 1.0, -12.0, 12.0, "Treble", 4, 1.0, "dial", None),
        ("pre_mid", 2.5, -6.0, 9.0, "Voice", 4, 1.0, "dial", None),
        ("pre_level", 0.0, -24.0, 12.0, "Level", 4, 1.0, "dial", None),
    ]),
    ("TAPE", "CASSETTE", [
        ("tape_on", 1, 0, 1, "Tape", 0, 1, "toggle", None),
        ("tape_wow", 0.3, 0.0, 1.0, "Wow", 5, 1.0, "dial", None),
        ("tape_flutter", 0.25, 0.0, 1.0, "Flutter", 5, 1.0, "dial", None),
        ("tape_sat", 0.35, 0.0, 1.0, "Sat", 5, 1.0, "dial", None),
        ("tape_hiss", 0.15, 0.0, 1.0, "Hiss", 5, 1.0, "dial", None),
        ("tape_age", 0.4, 0.0, 1.0, "Age", 5, 1.0, "dial", None),
        ("tape_drop", 0.05, 0.0, 1.0, "Dropout", 5, 1.0, "dial", None),
    ]),
    ("OUT", "OUT", [
        ("out_mix", 1.0, 0.0, 1.0, "Dry/Wet", 5, 1.0, "dial", None),
        ("out_width", 1.0, 0.0, 2.0, "Width", 5, 1.0, "dial", None),
        ("out_gain", 0.0, -24.0, 12.0, "Output", 4, 1.0, "dial", None),
    ]),
]

PARAMS = [p for _, _, ps in SECTIONS for p in ps]


class Gen:
    def __init__(self):
        self.decl = []
        self.body = []

    def hist(self, n, v=0.0):
        self.decl.append(f"History {n}({v});")

    def delay(self, n, size):
        self.decl.append(f"Delay {n}({size});")

    def L(self, s=""):
        self.body.append(s)

    # ----- smoothing -----------------------------------------------------
    def smooth(self, name, k="k_fast", init=None):
        default = next(p[1] for p in PARAMS if p[0] == name) if init is None else init
        self.hist(f"h_{name}", float(default))
        self.L(f"s_{name} = h_{name} + ({name} - h_{name}) * {k};")
        self.L(f"h_{name} = s_{name};")
        return f"s_{name}"

    # ----- one pole lowpass -------------------------------------------------
    def onepole(self, p, x, fc):
        self.hist(f"{p}_z")
        self.L(f"{p}_c = 1 - exp(-twopi * clamp({fc}, 5, sr * 0.45) / sr);")
        self.L(f"{p}_y = {p}_z + ({x} - {p}_z) * {p}_c;")
        self.L(f"{p}_z = {p}_y;")
        return f"{p}_y"

    # ----- Simper / Cytomic SVF -------------------------------------------
    def svf(self, p, x, fc, q="0.7071", mode="lp", db="0"):
        self.hist(f"{p}_s1")
        self.hist(f"{p}_s2")
        f = f"clamp({fc}, 10, sr * 0.45)"
        if mode in ("bell", "ls", "hs"):
            self.L(f"{p}_A = pow(10, ({db}) / 40);")
        if mode == "bell":
            self.L(f"{p}_g = tan(pi * {f} / sr);")
            self.L(f"{p}_k = 1 / (({q}) * {p}_A);")
        elif mode == "ls":
            self.L(f"{p}_g = tan(pi * {f} / sr) / sqrt({p}_A);")
            self.L(f"{p}_k = 1 / ({q});")
        elif mode == "hs":
            self.L(f"{p}_g = tan(pi * {f} / sr) * sqrt({p}_A);")
            self.L(f"{p}_k = 1 / ({q});")
        else:
            self.L(f"{p}_g = tan(pi * {f} / sr);")
            self.L(f"{p}_k = 1 / ({q});")
        self.L(f"{p}_a1 = 1 / (1 + {p}_g * ({p}_g + {p}_k));")
        self.L(f"{p}_a2 = {p}_g * {p}_a1;")
        self.L(f"{p}_a3 = {p}_g * {p}_a2;")
        self.L(f"{p}_v3 = {x} - {p}_s2;")
        self.L(f"{p}_v1 = {p}_a1 * {p}_s1 + {p}_a2 * {p}_v3;")
        self.L(f"{p}_v2 = {p}_s2 + {p}_a2 * {p}_s1 + {p}_a3 * {p}_v3;")
        self.L(f"{p}_n1 = 2 * {p}_v1 - {p}_s1;")
        self.L(f"{p}_n2 = 2 * {p}_v2 - {p}_s2;")
        self.L(f"{p}_s1 = {p}_n1;")
        self.L(f"{p}_s2 = {p}_n2;")
        if mode == "lp":
            out = f"{p}_v2"
        elif mode == "bp":
            out = f"{p}_v1"
        elif mode == "hp":
            self.L(f"{p}_o = {x} - {p}_k * {p}_v1 - {p}_v2;")
            out = f"{p}_o"
        elif mode == "bell":
            self.L(f"{p}_o = {x} + {p}_k * ({p}_A * {p}_A - 1) * {p}_v1;")
            out = f"{p}_o"
        elif mode == "ls":
            self.L(f"{p}_o = {x} + {p}_k * ({p}_A - 1) * {p}_v1 + ({p}_A * {p}_A - 1) * {p}_v2;")
            out = f"{p}_o"
        elif mode == "hs":
            self.L(f"{p}_o = {p}_A * {p}_A * {x} + {p}_k * (1 - {p}_A) * {p}_A * {p}_v1 + (1 - {p}_A * {p}_A) * {p}_v2;")
            out = f"{p}_o"
        return out


def build():
    g = Gen()
    L = g.L

    L("// ===== MKGEE RIG =====  generated by tools/dsp.py — edit there, not here")
    L("sr = samplerate;")
    L("k_fast = 1 - exp(-1 / (0.02 * sr));")
    L("k_on = 1 - exp(-1 / (0.012 * sr));")
    L("k_slow = 1 - exp(-1 / (0.25 * sr));")
    L("k_vslow = 1 - exp(-1 / (1.5 * sr));")
    L()

    # ---------------------------------------------------------------- IN
    L("// ---------------- GUITAR IN")
    gin = g.smooth("gtr_gain")
    tone = g.smooth("gtr_tone")
    L(f"x_in = (in1 + in2) * 0.5 * pow(10, {gin} / 20);")
    x = g.svf("tn", "x_in", tone, "0.6", "lp")
    L(f"x = {x};")
    L()

    # ---------------------------------------------------------------- DROP
    L("// ---------------- DROP (dual-tap granular pitch shifter)")
    don = g.smooth("drop_on", "k_on")
    dmix = g.smooth("drop_mix")
    grain = g.smooth("drop_grain", "k_slow")
    # glide: per-sample coefficient from glide time
    g.hist("h_dsemi", -5.0)
    L("dr_kg = 1 - exp(-1 / (max(drop_glide, 1) * 0.001 * sr));")
    L("dr_semi = h_dsemi + (drop_semi - h_dsemi) * dr_kg;")
    L("h_dsemi = dr_semi;")
    L("dr_ratio = pow(2, dr_semi / 12);")
    L(f"dr_w = max({grain} * 0.001 * sr, 64);")
    g.hist("dr_ph")
    g.delay("dr_buf", 24000)
    L("dr_p = dr_ph + (1 - dr_ratio) / dr_w;")
    L("dr_p = dr_p - floor(dr_p);")
    L("dr_ph = dr_p;")
    L("dr_p2 = dr_p + 0.5;")
    L("dr_p2 = dr_p2 - floor(dr_p2);")
    L("dr_t1 = clamp(dr_p * dr_w + 1, 1, 23990);")
    L("dr_t2 = clamp(dr_p2 * dr_w + 1, 1, 23990);")
    L("dr_r1 = dr_buf.read(dr_t1);")
    L("dr_r2 = dr_buf.read(dr_t2);")
    L("dr_w1 = sin(pi * dr_p);")
    L("dr_w2 = sin(pi * dr_p2);")
    L("dr_wet = dr_r1 * dr_w1 * dr_w1 + dr_r2 * dr_w2 * dr_w2;")
    L("dr_buf.write(x);")
    L(f"dr_out = x * (1 - {dmix}) + dr_wet * {dmix};")
    L(f"x = x + (dr_out - x) * {don};")
    L()

    # ---------------------------------------------------------------- VIBE
    L("// ---------------- CE-2W (BBD chorus / vibrato)")
    von = g.smooth("vibe_on", "k_on")
    vmode = g.smooth("vibe_mode", "k_on")
    vrate = g.smooth("vibe_rate")
    vdep = g.smooth("vibe_depth")
    vtone = g.smooth("vibe_tone")
    g.hist("vb_ph")
    g.delay("vb_buf", 4096)
    L(f"vb_p = vb_ph + {vrate} / sr;")
    L("vb_p = vb_p - floor(vb_p);")
    L("vb_ph = vb_p;")
    L("vb_tri = 1 - 4 * abs(vb_p - 0.5);")            # -1..1 triangle
    L("vb_lfo = vb_tri * (1 - 0.35 * vb_tri * vb_tri) / 0.65;")  # rounded (CE-1 style)
    L(f"vb_center = (6.5 - 2.5 * {vmode}) * 0.001 * sr;")
    L(f"vb_swing = (1.6 + 1.8 * {vmode}) * {vdep} * 0.001 * sr;")
    L("vb_t = clamp(vb_center + vb_lfo * vb_swing, 2, 4090);")
    L("vb_pre = tanh(x * 1.6) / 1.6;")       # BBD input stage soft limiting
    L("vb_buf.write(vb_pre);")
    L("vb_r = vb_buf.read(vb_t);")
    vb_lp = g.svf("vbf", "vb_r", f"3000 + {vtone} * {vtone} * 9000", "0.6", "lp")
    L(f"vb_wet = {vb_lp} + (noise() * 0.0004) * {vdep};")
    # chorus: dry + wet; vibrato: wet only
    L(f"vb_out = x * (1 - {vmode}) * 0.75 + vb_wet * (0.75 + 0.25 * {vmode});")
    L(f"x = x + (vb_out - x) * {von};")
    L()

    # ---------------------------------------------------------------- EQ
    L("// ---------------- PARA EQ")
    eon = g.smooth("eq_on", "k_on")
    lc = g.smooth("eq_lowcut")
    lf = g.smooth("eq_lofreq")
    lg = g.smooth("eq_logain")
    mf = g.smooth("eq_midfreq")
    mg = g.smooth("eq_midgain")
    mq = g.smooth("eq_midq")
    hf = g.smooth("eq_hifreq")
    hg = g.smooth("eq_higain")
    e1 = g.svf("eqhp", "x", lc, "0.7071", "hp")
    e2 = g.svf("eqlo", e1, lf, "0.7071", "ls", lg)
    e3 = g.svf("eqmd", e2, mf, mq, "bell", mg)
    e4 = g.svf("eqhi", e3, hf, "0.7071", "hs", hg)
    L(f"x = x + ({e4} - x) * {eon};")
    L("sL = x;")
    L("sR = x;")
    L()

    # ------------------------------------------------- VERB + ECHO reads
    L("// ---------------- REVERB-X  (4-line FDN, wet taps read first)")
    ron = g.smooth("verb_on", "k_on")
    rpos = g.smooth("verb_pos", "k_on")
    rdec = g.smooth("verb_decay")
    rsize = g.smooth("verb_size", "k_vslow")
    rtone = g.smooth("verb_tone")
    rfuzz = g.smooth("verb_fuzz")
    rmix = g.smooth("verb_mix")
    L(f"rv_sz = 0.35 + {rsize} * 1.25;")
    base = [31.7, 37.3, 41.9, 47.3]
    for i, ms in enumerate(base):
        g.delay(f"rv_d{i}", 20000)
        g.hist(f"rv_lp{i}")
        L(f"rv_len{i} = {ms} * rv_sz * 0.001 * sr;")
    g.hist("rv_mph")
    L("rv_m = rv_mph + 0.73 / sr;")
    L("rv_m = rv_m - floor(rv_m);")
    L("rv_mph = rv_m;")
    L("rv_mod = sin(twopi * rv_m) * 0.0009 * sr;")
    L("rv_r0 = rv_d0.read(clamp(rv_len0 + rv_mod, 2, 19990));")
    L("rv_r1 = rv_d1.read(clamp(rv_len1, 2, 19990));")
    L("rv_r2 = rv_d2.read(clamp(rv_len2 - rv_mod, 2, 19990));")
    L("rv_r3 = rv_d3.read(clamp(rv_len3, 2, 19990));")
    L("rv_wL = (rv_r0 + rv_r2) * 0.5;")
    L("rv_wR = (rv_r1 + rv_r3) * 0.5;")
    L()
    L("// ---------------- DD-20 echo (wet taps read first)")
    eon2 = g.smooth("echo_on", "k_on")
    epos = g.smooth("echo_pos", "k_on")
    etime = g.smooth("echo_time", "k_slow")
    efb = g.smooth("echo_fb")
    etone = g.smooth("echo_tone")
    ewob = g.smooth("echo_wob")
    epp = g.smooth("echo_pp")
    emix = g.smooth("echo_mix")
    g.delay("ec_dL", 200000)
    g.delay("ec_dR", 200000)
    g.hist("ec_ph")
    g.hist("ec_rn")
    L("ec_p = ec_ph + 0.9 / sr;")
    L("ec_p = ec_p - floor(ec_p);")
    L("ec_ph = ec_p;")
    L("ec_rnd = ec_rn + (noise() - ec_rn) * (twopi * 3 / sr);")
    L("ec_rn = ec_rnd;")
    L(f"ec_wob = (sin(twopi * ec_p) * 0.7 + ec_rnd * 6) * {ewob} * 0.0025 * sr;")
    L(f"ec_t = clamp({etime} * 0.001 * sr + ec_wob, 4, 199000);")
    L("ec_rL = ec_dL.read(ec_t);")
    L("ec_rR = ec_dR.read(ec_t);")
    L()

    # ---------------------------------------------------------------- chain
    L("// ---------------- routing: [verb pre] [echo pre] 424 [verb post] [echo post]")
    L(f"rv_dry = 1 - 0.45 * {rmix};")
    L(f"rv_on = {ron};")
    L(f"rv_pre = rv_on * (1 - {rpos});")
    L(f"rv_post = rv_on * {rpos};")
    L(f"ec_pre = {eon2} * (1 - {epos});")
    L(f"ec_post = {eon2} * {epos};")
    L("rv_inL_a = sL;")
    L("rv_inR_a = sR;")
    L(f"sL = sL + ((sL * rv_dry + rv_wL * {rmix}) - sL) * rv_pre;")
    L(f"sR = sR + ((sR * rv_dry + rv_wR * {rmix}) - sR) * rv_pre;")
    L("ec_inL_a = sL;")
    L("ec_inR_a = sR;")
    L(f"sL = sL + ec_rL * {emix} * ec_pre;")
    L(f"sR = sR + ec_rR * {emix} * ec_pre;")
    L()

    # ---------------------------------------------------------------- 424
    L("// ---------------- TASCAM 424 MkI channel: Trim > op-amp > EQ > Fader > op-amp")
    pon = g.smooth("pre_on", "k_on")
    ptrim = g.smooth("pre_trim")
    pfad = g.smooth("pre_fader")
    pbass = g.smooth("pre_bass")
    ptreb = g.smooth("pre_treble")
    pmid = g.smooth("pre_mid")
    plev = g.smooth("pre_level")
    L(f"pa_g1 = pow(10, {ptrim} / 20);")
    L(f"pa_g2 = pow(10, {pfad} / 20);")
    L(f"pa_bw = clamp(17000 - {ptrim} * 230, 5500, 17000);")   # gooey: darker as trim rises
    L(f"pa_lev = pow(10, {plev} / 20);")
    for ch in ("L", "R"):
        s = f"s{ch}"
        hp = g.onepole(f"pa{ch}hpz", s, "55")
        L(f"pa{ch}_x = ({s} - {hp}) * pa_g1;")
        # stage 1: asymmetric op-amp style clip (soft knee n=2.5)
        L(f"pa{ch}_u = pa{ch}_x + 0.18;")
        L(f"pa{ch}_c1 = pa{ch}_u / pow(1 + pow(abs(pa{ch}_u), 2.5), 0.4) - 0.18 / pow(1 + pow(0.18, 2.5), 0.4);")
        lp1 = g.svf(f"pa{ch}lp1", f"pa{ch}_c1", "pa_bw", "0.6", "lp")
        dc = g.onepole(f"pa{ch}dc", lp1, "12")
        L(f"pa{ch}_y = {lp1} - {dc};")
        b = g.svf(f"pa{ch}bs", f"pa{ch}_y", "100", "0.7071", "ls", pbass)
        m = g.svf(f"pa{ch}md", b, "900", "0.6", "bell", pmid)
        t = g.svf(f"pa{ch}tr", m, "10000", "0.7071", "hs", ptreb)
        # stage 2: fader into summing amp — harder knee (n=4), slight asymmetry
        L(f"pa{ch}_v = {t} * pa_g2 + 0.06;")
        L(f"pa{ch}_c2 = pa{ch}_v / pow(1 + pow(abs(pa{ch}_v), 4), 0.25) - 0.06 / pow(1 + pow(0.06, 4), 0.25);")
        lp2 = g.svf(f"pa{ch}lp2", f"pa{ch}_c2", "15000", "0.7071", "lp")
        L(f"pa{ch}_o = {lp2} * pa_lev * 0.15;")   # ~-16 dB makeup so 424 sits near unity
        L(f"{s} = {s} + (pa{ch}_o - {s}) * {pon};")
    L()

    # ---------------------------------------------------------------- post FX
    L("// ---------------- post-424 verb / echo")
    L("rv_inL_b = sL;")
    L("rv_inR_b = sR;")
    L(f"sL = sL + ((sL * rv_dry + rv_wL * {rmix}) - sL) * rv_post;")
    L(f"sR = sR + ((sR * rv_dry + rv_wR * {rmix}) - sR) * rv_post;")
    L("ec_inL_b = sL;")
    L("ec_inR_b = sR;")
    L(f"sL = sL + ec_rL * {emix} * ec_post;")
    L(f"sR = sR + ec_rR * {emix} * ec_post;")
    L()

    # --------------------------------------------------- write verb lines
    L("// ---------------- REVERB-X write: fuzz > diffusers > FDN")
    L(f"rv_in = ((rv_inL_a + rv_inR_a) * (1 - {rpos}) + (rv_inL_b + rv_inR_b) * {rpos}) * 0.5 * rv_on;")
    L(f"rv_drv = 1 + {rfuzz} * {rfuzz} * 80;")
    L(f"rv_fz = rv_in + (tanh(rv_in * rv_drv) * 0.3 - rv_in) * {rfuzz};")
    fzl = g.svf("rvfz", "rv_fz", f"9000 - {rfuzz} * 5500", "0.7071", "lp")
    L(f"rv_a = {fzl};")
    for i, ms in enumerate([4.77, 3.59, 2.73, 1.91]):
        g.delay(f"rv_ap{i}", 3000)
        L(f"rv_apr{i} = rv_ap{i}.read(clamp({ms} * 0.001 * sr * (0.6 + rv_sz * 0.4), 1, 2990));")
        L(f"rv_apw{i} = rv_a + 0.62 * rv_apr{i};")
        L(f"rv_a = rv_apr{i} - 0.62 * rv_apw{i};")
        L(f"rv_ap{i}.write(rv_apw{i});")
    L(f"rv_damp = 1500 + {rtone} * {rtone} * 14000;")
    L("rv_dc = 1 - exp(-twopi * clamp(rv_damp, 100, sr * 0.45) / sr);")
    L(f"rv_T = max({rdec}, 0.05) * sr;")
    for i in range(4):
        L(f"rv_g{i} = pow(0.001, rv_len{i} / rv_T);")
        L(f"rv_f{i} = rv_lp{i} + (rv_r{i} * rv_g{i} - rv_lp{i}) * rv_dc;")
        L(f"rv_lp{i} = rv_f{i};")
    L("rv_h0 = (rv_f0 + rv_f1 + rv_f2 + rv_f3) * 0.5;")
    L("rv_h1 = (rv_f0 - rv_f1 + rv_f2 - rv_f3) * 0.5;")
    L("rv_h2 = (rv_f0 + rv_f1 - rv_f2 - rv_f3) * 0.5;")
    L("rv_h3 = (rv_f0 - rv_f1 - rv_f2 + rv_f3) * 0.5;")
    for i, sgn in enumerate(["", "-", "", "-"]):
        L(f"rv_d{i}.write({sgn}rv_a * 0.5 + rv_h{i});")
    L()

    # --------------------------------------------------- write echo lines
    L("// ---------------- DD-20 write: tone + soft clip in the loop, ping-pong")
    L(f"ec_inL = (ec_inL_a * (1 - {epos}) + ec_inL_b * {epos}) * {eon2};")
    L(f"ec_inR = (ec_inR_a * (1 - {epos}) + ec_inR_b * {epos}) * {eon2};")
    L(f"ec_tf = 900 + {etone} * {etone} * 11000;")
    fL = g.svf("ecfL", "ec_rL", "ec_tf", "0.6", "lp")
    fR = g.svf("ecfR", "ec_rR", "ec_tf", "0.6", "lp")
    hL = g.onepole("ecdcL", fL, "60")
    hR = g.onepole("ecdcR", fR, "60")
    L(f"ec_fbL = tanh(({fL} - {hL}) * 1.3) / 1.3;")
    L(f"ec_fbR = tanh(({fR} - {hR}) * 1.3) / 1.3;")
    L("ec_mono = (ec_inL + ec_inR) * 0.5;")
    L(f"ec_dL.write(ec_inL + (ec_mono - ec_inL) * {epp} + {efb} * (ec_fbL * (1 - {epp}) + ec_fbR * {epp}));")
    L(f"ec_dR.write((ec_inR + (ec_mono - ec_inR) * {epp}) * (1 - {epp}) + {efb} * (ec_fbR * (1 - {epp}) + ec_fbL * {epp}));")
    L()

    # ---------------------------------------------------------------- TAPE
    L("// ---------------- CASSETTE")
    ton = g.smooth("tape_on", "k_on")
    wow = g.smooth("tape_wow")
    flt = g.smooth("tape_flutter")
    sat = g.smooth("tape_sat")
    hiss = g.smooth("tape_hiss")
    age = g.smooth("tape_age")
    tdrop = g.smooth("tape_drop")
    g.hist("tp_w1")
    g.hist("tp_w2")
    g.hist("tp_f1")
    g.hist("tp_rn")
    L("tp_a = tp_w1 + 0.53 / sr;")
    L("tp_a = tp_a - floor(tp_a);")
    L("tp_w1 = tp_a;")
    L("tp_b = tp_w2 + 0.31 / sr;")
    L("tp_b = tp_b - floor(tp_b);")
    L("tp_w2 = tp_b;")
    L("tp_c = tp_f1 + 7.3 / sr;")
    L("tp_c = tp_c - floor(tp_c);")
    L("tp_f1 = tp_c;")
    L("tp_rnd = tp_rn + (noise() - tp_rn) * (twopi * 1.2 / sr);")
    L("tp_rn = tp_rnd;")
    L("tp_wowv = sin(twopi * tp_a) * 0.6 + sin(twopi * tp_b) * 0.4 + tp_rnd * 8;")
    L("tp_flv = sin(twopi * tp_c) + noise() * 0.15;")
    L(f"tp_t = clamp((6 + tp_wowv * {wow} * 3.5 + tp_flv * {flt} * 0.12) * 0.001 * sr, 2, 4090);")
    # dropouts (shared transport)
    g.hist("tp_env")
    g.hist("tp_gz", 1.0)
    L(f"tp_trig = (noise() * 0.5 + 0.5) < ({tdrop} * 1.5 / sr);")
    L("tp_depth = 0.35 + (noise() * 0.5 + 0.5) * 0.65;")
    L("tp_e = max(tp_env * (1 - 8 / sr), tp_trig * tp_depth);")
    L("tp_env = tp_e;")
    L(f"tp_gt = 1 - tp_e * min({tdrop} * 4, 1) * 0.85;")
    L("tp_g = tp_gz + (tp_gt - tp_gz) * (1 - exp(-1 / (0.004 * sr)));")
    L("tp_gz = tp_g;")
    L(f"tp_drive = pow(10, ({sat} * 18) / 20);")
    L(f"tp_hf = 16000 - {age} * 10500;")
    for ch in ("L", "R"):
        s = f"s{ch}"
        g.delay(f"tp_d{ch}", 4096)
        L(f"tp_d{ch}.write({s});")
        L(f"tp{ch}_r = tp_d{ch}.read(tp_t);")
        L(f"tp{ch}_u = tp{ch}_r * tp_drive;")
        L(f"tp{ch}_s = (tanh(tp{ch}_u + 0.08 * tp{ch}_u * tp{ch}_u / (1 + abs(tp{ch}_u))) ) / (0.75 + 0.25 * tp_drive);")
        L(f"tp{ch}_s = tp{ch}_r + (tp{ch}_s - tp{ch}_r) * min({sat} * 3, 1);")
        bump = g.svf(f"tp{ch}bm", f"tp{ch}_s", "85", "1.1", "bell", f"1 + {age} * 3")
        lp = g.svf(f"tp{ch}lp", bump, "tp_hf", "0.75", "lp")
        nz = g.svf(f"tp{ch}nz", "noise()", "5500", "0.5", "bp")
        L(f"tp{ch}_o = {lp} * tp_g + {nz} * {hiss} * {hiss} * 0.02;")
        L(f"{s} = {s} + (tp{ch}_o - {s}) * {ton};")
    L()

    # ---------------------------------------------------------------- OUT
    L("// ---------------- OUT")
    omix = g.smooth("out_mix")
    owid = g.smooth("out_width")
    ogain = g.smooth("out_gain")
    L("o_m = (sL + sR) * 0.5;")
    L(f"o_s = (sL - sR) * 0.5 * {owid};")
    L(f"o_g = pow(10, {ogain} / 20);")
    L(f"o_L = (in1 + ((o_m + o_s) - in1) * {omix}) * o_g;")
    L(f"o_R = (in2 + ((o_m - o_s) - in2) * {omix}) * o_g;")
    # safety: kill NaN/denormal-ish blowups by hard ceiling
    L("out1 = clamp(o_L, -4, 4);")
    L("out2 = clamp(o_R, -4, 4);")

    params = []
    for (n, d, lo, hi, *_rest) in PARAMS:
        params.append(f"Param {n}({float(d)}, min={float(lo)}, max={float(hi)});")
    code = "\n".join(params + [""] + g.decl + [""] + g.body) + "\n"
    return code


if __name__ == "__main__":
    print(build())
