"""
Builds device/MKGEE RIG.amxd (Max for Live audio effect) from tools/dsp.py.

    python3 tools/build.py
"""
import json, os, struct, math
import dsp

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUT_DIR = os.path.join(ROOT, "device")
DEVICE_NAME = "MKGEE RIG"

CREAM = [0.93, 0.89, 0.78, 1.0]
ORANGE = [0.91, 0.45, 0.20, 1.0]
DIM = [0.55, 0.52, 0.46, 1.0]
PANEL = [0.125, 0.125, 0.135, 1.0]
PANEL_ALT = [0.165, 0.155, 0.150, 1.0]
BORDER = [0.30, 0.29, 0.27, 1.0]

COL_W = 50
DIAL_W, DIAL_H = 46, 48
GAP = 5
TOP = 2


class Patch:
    def __init__(self):
        self.boxes, self.lines, self.n = [], [], 0

    def add(self, **box):
        self.n += 1
        box["id"] = f"obj-{self.n}"
        self.boxes.append({"box": box})
        return box["id"]

    def connect(self, a, ao, b, bi):
        self.lines.append({"patchline": {"source": [a, ao], "destination": [b, bi]}})


def param_attrs(longname, short, ptype, lo, hi, init, unit=0, expo=1.0, enum=None):
    v = {
        "parameter_longname": longname,
        "parameter_shortname": short,
        "parameter_type": ptype,
        "parameter_mmin": lo,
        "parameter_mmax": hi,
        "parameter_initial_enable": 1,
        "parameter_initial": [init],
    }
    if ptype == 2:
        v["parameter_enum"] = enum
    else:
        v["parameter_unitstyle"] = unit
        if expo != 1.0:
            v["parameter_exponent"] = expo
    return {"valueof": v}


def gen_patcher(code):
    boxes = [
        {"box": {"id": "obj-1", "maxclass": "newobj", "text": "in 1", "numinlets": 0, "numoutlets": 1,
                 "outlettype": [""], "patching_rect": [20, 15, 30, 22]}},
        {"box": {"id": "obj-2", "maxclass": "newobj", "text": "in 2", "numinlets": 0, "numoutlets": 1,
                 "outlettype": [""], "patching_rect": [600, 15, 30, 22]}},
        {"box": {"id": "obj-3", "maxclass": "codebox", "code": code, "fontface": 0,
                 "fontname": "<Monospaced>", "fontsize": 12.0, "numinlets": 2, "numoutlets": 2,
                 "outlettype": ["", ""], "patching_rect": [20, 50, 610, 700]}},
        {"box": {"id": "obj-4", "maxclass": "newobj", "text": "out 1", "numinlets": 1, "numoutlets": 0,
                 "patching_rect": [20, 770, 37, 22]}},
        {"box": {"id": "obj-5", "maxclass": "newobj", "text": "out 2", "numinlets": 1, "numoutlets": 0,
                 "patching_rect": [600, 770, 37, 22]}},
    ]
    lines = [
        {"patchline": {"source": ["obj-1", 0], "destination": ["obj-3", 0]}},
        {"patchline": {"source": ["obj-2", 0], "destination": ["obj-3", 1]}},
        {"patchline": {"source": ["obj-3", 0], "destination": ["obj-4", 0]}},
        {"patchline": {"source": ["obj-3", 1], "destination": ["obj-5", 0]}},
    ]
    return {
        "fileversion": 1,
        "appversion": {"major": 8, "minor": 6, "revision": 0, "architecture": "x64", "modernui": 1},
        "classnamespace": "dsp.gen",
        "rect": [80.0, 80.0, 680.0, 820.0],
        "bglocked": 0, "openinpresentation": 0, "default_fontsize": 12.0, "default_fontface": 0,
        "default_fontname": "Arial", "gridonopen": 1, "gridsize": [15.0, 15.0], "gridsnaponopen": 1,
        "objectsnaponopen": 1, "statusbarvisible": 2, "toolbarvisible": 1,
        "boxes": boxes, "lines": lines,
    }


def build():
    code = dsp.build()
    with open(os.path.join(ROOT, "gen", "mkgee_rig.genexpr"), "w") as f:
        f.write(code)

    P = Patch()
    plug = P.add(maxclass="newobj", text="plugin~", numinlets=2, numoutlets=2,
                 outlettype=["signal", "signal"], patching_rect=[20, 400, 55, 22])
    gen = P.add(maxclass="newobj", text="gen~ @title mkgee_rig", numinlets=2, numoutlets=2,
                outlettype=["signal", "signal"], patching_rect=[20, 460, 300, 22],
                patcher=gen_patcher(code))
    pout = P.add(maxclass="newobj", text="plugout~", numinlets=2, numoutlets=0,
                 patching_rect=[20, 520, 62, 22])
    P.connect(plug, 0, gen, 0)
    P.connect(plug, 1, gen, 1)
    P.connect(gen, 0, pout, 0)
    P.connect(gen, 1, pout, 1)

    x = 0
    px = 20  # patching-view x cursor for prepends
    alt = False
    for key, title, params in dsp.SECTIONS:
        dials = [p for p in params if p[7] == "dial"]
        toggles = [p for p in params if p[7] == "toggle"]
        tabs = [p for p in params if p[7] == "tab"]
        cols = max(1, math.ceil(len(dials) / 2))
        w = max(cols * COL_W + 8, 74)
        h = 166
        P.add(maxclass="panel", numinlets=1, numoutlets=0, background=1, presentation=1,
              patching_rect=[x + 400, 20, w, h], presentation_rect=[x, TOP, w, h],
              bgcolor=PANEL_ALT if alt else PANEL, border=1, bordercolor=BORDER, rounded=6,
              ignoreclick=1)
        alt = not alt
        P.add(maxclass="comment", text=title, numinlets=1, numoutlets=0, presentation=1,
              patching_rect=[x + 400, 200, w - 6, 18], presentation_rect=[x + 4, TOP + 3, w - 6, 16],
              textcolor=CREAM, fontsize=9.5, fontface=1, fontname="Arial Bold")

        ctrl_y = TOP + 20
        cx = x + 5
        objs = []
        for (n, d, lo, hi, short, unit, expo, kind, enum) in toggles:
            o = P.add(maxclass="live.text", numinlets=1, numoutlets=2, outlettype=["", ""],
                      parameter_enable=1, mode=1, text="OFF", texton="ON", varname=n,
                      presentation=1, presentation_rect=[cx, ctrl_y, 32, 15],
                      patching_rect=[px, 40, 40, 15],
                      activebgoncolor=ORANGE, textoncolor=[0.1, 0.1, 0.1, 1.0],
                      saved_attribute_attributes=param_attrs(f"{key} On",
                                                             short, 2, 0, 1, int(d), enum=["off", "on"]))
            objs.append((o, n))
            cx += 36
        for (n, d, lo, hi, short, unit, expo, kind, enum) in tabs:
            tw = max(w - (cx - x) - 5, 40)
            o = P.add(maxclass="live.tab", numinlets=1, numoutlets=3, outlettype=["", "", "float"],
                      parameter_enable=1, varname=n, num_lines_patching=1, num_lines_presentation=1,
                      presentation=1, presentation_rect=[cx, ctrl_y, tw, 15],
                      patching_rect=[px, 40, 60, 15], activebgoncolor=ORANGE,
                      fontsize=8.0,
                      saved_attribute_attributes=param_attrs(f"{key} {short}", short, 2, 0, len(enum) - 1,
                                                             int(d), enum=enum))
            objs.append((o, n))
            cx += tw + 4

        dial_top = TOP + 40 if (toggles or tabs) else TOP + 24
        grid_w = cols * COL_W
        ox = x + (w - grid_w) / 2 + (COL_W - DIAL_W) / 2
        for i, (n, d, lo, hi, short, unit, expo, kind, enum) in enumerate(dials):
            r, c = i % 2, i // 2
            if len(dials) == 1:
                r = 0
            ptype = 1 if (unit == 7 or unit == 0) else 0
            o = P.add(maxclass="live.dial", numinlets=1, numoutlets=2, outlettype=["", "float"],
                      parameter_enable=1, varname=n,
                      presentation=1,
                      presentation_rect=[ox + c * COL_W, dial_top + r * 60, DIAL_W, DIAL_H],
                      patching_rect=[px, 40, 44, 48],
                      textcolor=CREAM, activedialcolor=ORANGE, activeneedlecolor=CREAM,
                      saved_attribute_attributes=param_attrs(f"{key} {short}", short, ptype, lo, hi,
                                                             d, unit=unit, expo=expo))
            objs.append((o, n))

        for (o, n) in objs:
            # move the UI object in patching view and give it a prepend into gen~
            for b in P.boxes:
                if b["box"]["id"] == o:
                    b["box"]["patching_rect"][0] = px
                    b["box"]["patching_rect"][1] = 120
            pp = P.add(maxclass="newobj", text=f"prepend {n}", numinlets=1, numoutlets=1,
                       outlettype=[""], patching_rect=[px, 300, 90, 22])
            P.connect(o, 0, pp, 0)
            P.connect(pp, 0, gen, 0)
            px += 95

        x += w + GAP

    device_w = x - GAP

    patcher = {
        "patcher": {
            "fileversion": 1,
            "appversion": {"major": 8, "minor": 6, "revision": 0, "architecture": "x64", "modernui": 1},
            "classnamespace": "box",
            "rect": [60.0, 100.0, 1400.0, 640.0],
            "openrect": [0.0, 0.0, float(device_w), 169.0],
            "bglocked": 0, "openinpresentation": 1,
            "default_fontsize": 10.0, "default_fontface": 0, "default_fontname": "Arial Bold",
            "gridonopen": 1, "gridsize": [8.0, 8.0], "gridsnaponopen": 1, "objectsnaponopen": 1,
            "statusbarvisible": 2, "toolbarvisible": 1,
            "boxes": P.boxes, "lines": P.lines,
            "dependency_cache": [], "latency": 0, "is_mpe": 0,
            "external_mpe_tuning_enabled": 0, "minimum_live_version": "", "minimum_max_version": "",
            "platform_compatibility": 0, "autosave": 0,
            "devicewidth": float(device_w),
            "description": "Mk.gee-style guitar rig: Drop > CE-2W > ParaEq > Reverb-X / DD-20 > Tascam 424 > cassette",
        }
    }
    js = json.dumps(patcher, indent=1).encode("utf-8") + b"\n\x00"
    header = b"ampf" + struct.pack("<I", 4) + b"aaaa" + b"meta" + struct.pack("<I", 4) + struct.pack("<I", 0)
    header += b"ptch" + struct.pack("<I", len(js))
    os.makedirs(OUT_DIR, exist_ok=True)
    path = os.path.join(OUT_DIR, f"{DEVICE_NAME}.amxd")
    with open(path, "wb") as f:
        f.write(header + js)
    # plain .maxpat too (open in Max to inspect/edit, same contents)
    with open(os.path.join(OUT_DIR, "mkgee_rig.maxpat"), "w") as f:
        json.dump(patcher, f, indent=1)
    print(f"wrote {path}  width={device_w}px  params={len(dsp.PARAMS)}  bytes={len(header)+len(js)}")
    return patcher


if __name__ == "__main__":
    build()
