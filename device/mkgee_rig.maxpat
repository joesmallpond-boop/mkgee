{
 "patcher": {
  "fileversion": 1,
  "appversion": {
   "major": 8,
   "minor": 6,
   "revision": 0,
   "architecture": "x64",
   "modernui": 1
  },
  "classnamespace": "box",
  "rect": [
   60.0,
   100.0,
   1400.0,
   640.0
  ],
  "openrect": [
   0.0,
   0.0,
   1278.0,
   169.0
  ],
  "bglocked": 0,
  "openinpresentation": 1,
  "default_fontsize": 10.0,
  "default_fontface": 0,
  "default_fontname": "Arial Bold",
  "gridonopen": 1,
  "gridsize": [
   8.0,
   8.0
  ],
  "gridsnaponopen": 1,
  "objectsnaponopen": 1,
  "statusbarvisible": 2,
  "toolbarvisible": 1,
  "boxes": [
   {
    "box": {
     "maxclass": "newobj",
     "text": "plugin~",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "signal"
     ],
     "patching_rect": [
      20,
      400,
      55,
      22
     ],
     "id": "obj-1"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "gen~ @title mkgee_rig",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "signal"
     ],
     "patching_rect": [
      20,
      460,
      300,
      22
     ],
     "patcher": {
      "fileversion": 1,
      "appversion": {
       "major": 8,
       "minor": 6,
       "revision": 0,
       "architecture": "x64",
       "modernui": 1
      },
      "classnamespace": "dsp.gen",
      "rect": [
       80.0,
       80.0,
       680.0,
       820.0
      ],
      "bglocked": 0,
      "openinpresentation": 0,
      "default_fontsize": 12.0,
      "default_fontface": 0,
      "default_fontname": "Arial",
      "gridonopen": 1,
      "gridsize": [
       15.0,
       15.0
      ],
      "gridsnaponopen": 1,
      "objectsnaponopen": 1,
      "statusbarvisible": 2,
      "toolbarvisible": 1,
      "boxes": [
       {
        "box": {
         "id": "obj-1",
         "maxclass": "newobj",
         "text": "in 1",
         "numinlets": 0,
         "numoutlets": 1,
         "outlettype": [
          ""
         ],
         "patching_rect": [
          20,
          15,
          30,
          22
         ]
        }
       },
       {
        "box": {
         "id": "obj-2",
         "maxclass": "newobj",
         "text": "in 2",
         "numinlets": 0,
         "numoutlets": 1,
         "outlettype": [
          ""
         ],
         "patching_rect": [
          600,
          15,
          30,
          22
         ]
        }
       },
       {
        "box": {
         "id": "obj-3",
         "maxclass": "codebox",
         "code": "Param gtr_gain(0.0, min=-24.0, max=24.0);\nParam gtr_tone(6500.0, min=1500.0, max=20000.0);\nParam drop_on(1.0, min=0.0, max=1.0);\nParam drop_semi(-5.0, min=-24.0, max=12.0);\nParam drop_mix(1.0, min=0.0, max=1.0);\nParam drop_glide(30.0, min=1.0, max=2000.0);\nParam drop_grain(55.0, min=15.0, max=100.0);\nParam vibe_on(1.0, min=0.0, max=1.0);\nParam vibe_mode(1.0, min=0.0, max=1.0);\nParam vibe_rate(0.7, min=0.05, max=10.0);\nParam vibe_depth(0.25, min=0.0, max=1.0);\nParam vibe_tone(0.5, min=0.0, max=1.0);\nParam eq_on(1.0, min=0.0, max=1.0);\nParam eq_lofreq(200.0, min=40.0, max=800.0);\nParam eq_logain(-2.0, min=-15.0, max=15.0);\nParam eq_midfreq(1200.0, min=200.0, max=6000.0);\nParam eq_midgain(2.0, min=-15.0, max=15.0);\nParam eq_hifreq(6000.0, min=1500.0, max=16000.0);\nParam eq_higain(-3.0, min=-15.0, max=15.0);\nParam eq_lowcut(70.0, min=20.0, max=400.0);\nParam eq_midq(0.8, min=0.2, max=6.0);\nParam verb_on(1.0, min=0.0, max=1.0);\nParam verb_pos(0.0, min=0.0, max=1.0);\nParam verb_decay(1.2, min=0.1, max=8.0);\nParam verb_size(0.4, min=0.0, max=1.0);\nParam verb_tone(0.4, min=0.0, max=1.0);\nParam verb_fuzz(0.35, min=0.0, max=1.0);\nParam verb_mix(0.25, min=0.0, max=1.0);\nParam echo_on(0.0, min=0.0, max=1.0);\nParam echo_pos(1.0, min=0.0, max=1.0);\nParam echo_time(380.0, min=20.0, max=2000.0);\nParam echo_fb(0.3, min=0.0, max=1.05);\nParam echo_tone(0.45, min=0.0, max=1.0);\nParam echo_wob(0.2, min=0.0, max=1.0);\nParam echo_pp(0.0, min=0.0, max=1.0);\nParam echo_mix(0.2, min=0.0, max=1.0);\nParam pre_on(1.0, min=0.0, max=1.0);\nParam pre_trim(22.0, min=0.0, max=48.0);\nParam pre_fader(6.0, min=-12.0, max=24.0);\nParam pre_bass(-2.0, min=-12.0, max=12.0);\nParam pre_treble(1.0, min=-12.0, max=12.0);\nParam pre_mid(2.5, min=-6.0, max=9.0);\nParam pre_level(0.0, min=-24.0, max=12.0);\nParam tape_on(1.0, min=0.0, max=1.0);\nParam tape_wow(0.3, min=0.0, max=1.0);\nParam tape_flutter(0.25, min=0.0, max=1.0);\nParam tape_sat(0.35, min=0.0, max=1.0);\nParam tape_hiss(0.15, min=0.0, max=1.0);\nParam tape_age(0.4, min=0.0, max=1.0);\nParam tape_drop(0.05, min=0.0, max=1.0);\nParam out_mix(1.0, min=0.0, max=1.0);\nParam out_width(1.0, min=0.0, max=2.0);\nParam out_gain(0.0, min=-24.0, max=12.0);\n\nHistory h_gtr_gain(0.0);\nHistory h_gtr_tone(6500.0);\nHistory tn_s1(0.0);\nHistory tn_s2(0.0);\nHistory h_drop_on(1.0);\nHistory h_drop_mix(1.0);\nHistory h_drop_grain(55.0);\nHistory h_dsemi(-5.0);\nHistory dr_ph(0.0);\nDelay dr_buf(24000);\nHistory h_vibe_on(1.0);\nHistory h_vibe_mode(1.0);\nHistory h_vibe_rate(0.7);\nHistory h_vibe_depth(0.25);\nHistory h_vibe_tone(0.5);\nHistory vb_ph(0.0);\nDelay vb_buf(4096);\nHistory vbf_s1(0.0);\nHistory vbf_s2(0.0);\nHistory h_eq_on(1.0);\nHistory h_eq_lowcut(70.0);\nHistory h_eq_lofreq(200.0);\nHistory h_eq_logain(-2.0);\nHistory h_eq_midfreq(1200.0);\nHistory h_eq_midgain(2.0);\nHistory h_eq_midq(0.8);\nHistory h_eq_hifreq(6000.0);\nHistory h_eq_higain(-3.0);\nHistory eqhp_s1(0.0);\nHistory eqhp_s2(0.0);\nHistory eqlo_s1(0.0);\nHistory eqlo_s2(0.0);\nHistory eqmd_s1(0.0);\nHistory eqmd_s2(0.0);\nHistory eqhi_s1(0.0);\nHistory eqhi_s2(0.0);\nHistory h_verb_on(1.0);\nHistory h_verb_pos(0.0);\nHistory h_verb_decay(1.2);\nHistory h_verb_size(0.4);\nHistory h_verb_tone(0.4);\nHistory h_verb_fuzz(0.35);\nHistory h_verb_mix(0.25);\nDelay rv_d0(20000);\nHistory rv_lp0(0.0);\nDelay rv_d1(20000);\nHistory rv_lp1(0.0);\nDelay rv_d2(20000);\nHistory rv_lp2(0.0);\nDelay rv_d3(20000);\nHistory rv_lp3(0.0);\nHistory rv_mph(0.0);\nHistory h_echo_on(0.0);\nHistory h_echo_pos(1.0);\nHistory h_echo_time(380.0);\nHistory h_echo_fb(0.3);\nHistory h_echo_tone(0.45);\nHistory h_echo_wob(0.2);\nHistory h_echo_pp(0.0);\nHistory h_echo_mix(0.2);\nDelay ec_dL(200000);\nDelay ec_dR(200000);\nHistory ec_ph(0.0);\nHistory ec_rn(0.0);\nHistory h_pre_on(1.0);\nHistory h_pre_trim(22.0);\nHistory h_pre_fader(6.0);\nHistory h_pre_bass(-2.0);\nHistory h_pre_treble(1.0);\nHistory h_pre_mid(2.5);\nHistory h_pre_level(0.0);\nHistory paLhpz_z(0.0);\nHistory paLlp1_s1(0.0);\nHistory paLlp1_s2(0.0);\nHistory paLdc_z(0.0);\nHistory paLbs_s1(0.0);\nHistory paLbs_s2(0.0);\nHistory paLmd_s1(0.0);\nHistory paLmd_s2(0.0);\nHistory paLtr_s1(0.0);\nHistory paLtr_s2(0.0);\nHistory paLlp2_s1(0.0);\nHistory paLlp2_s2(0.0);\nHistory paRhpz_z(0.0);\nHistory paRlp1_s1(0.0);\nHistory paRlp1_s2(0.0);\nHistory paRdc_z(0.0);\nHistory paRbs_s1(0.0);\nHistory paRbs_s2(0.0);\nHistory paRmd_s1(0.0);\nHistory paRmd_s2(0.0);\nHistory paRtr_s1(0.0);\nHistory paRtr_s2(0.0);\nHistory paRlp2_s1(0.0);\nHistory paRlp2_s2(0.0);\nHistory rvfz_s1(0.0);\nHistory rvfz_s2(0.0);\nDelay rv_ap0(3000);\nDelay rv_ap1(3000);\nDelay rv_ap2(3000);\nDelay rv_ap3(3000);\nHistory ecfL_s1(0.0);\nHistory ecfL_s2(0.0);\nHistory ecfR_s1(0.0);\nHistory ecfR_s2(0.0);\nHistory ecdcL_z(0.0);\nHistory ecdcR_z(0.0);\nHistory h_tape_on(1.0);\nHistory h_tape_wow(0.3);\nHistory h_tape_flutter(0.25);\nHistory h_tape_sat(0.35);\nHistory h_tape_hiss(0.15);\nHistory h_tape_age(0.4);\nHistory h_tape_drop(0.05);\nHistory tp_w1(0.0);\nHistory tp_w2(0.0);\nHistory tp_f1(0.0);\nHistory tp_rn(0.0);\nHistory tp_env(0.0);\nHistory tp_gz(1.0);\nDelay tp_dL(4096);\nHistory tpLbm_s1(0.0);\nHistory tpLbm_s2(0.0);\nHistory tpLlp_s1(0.0);\nHistory tpLlp_s2(0.0);\nHistory tpLnz_s1(0.0);\nHistory tpLnz_s2(0.0);\nDelay tp_dR(4096);\nHistory tpRbm_s1(0.0);\nHistory tpRbm_s2(0.0);\nHistory tpRlp_s1(0.0);\nHistory tpRlp_s2(0.0);\nHistory tpRnz_s1(0.0);\nHistory tpRnz_s2(0.0);\nHistory h_out_mix(1.0);\nHistory h_out_width(1.0);\nHistory h_out_gain(0.0);\n\n// ===== MKGEE RIG =====  generated by tools/dsp.py \u2014 edit there, not here\nsr = samplerate;\nk_fast = 1 - exp(-1 / (0.02 * sr));\nk_on = 1 - exp(-1 / (0.012 * sr));\nk_slow = 1 - exp(-1 / (0.25 * sr));\nk_vslow = 1 - exp(-1 / (1.5 * sr));\n\n// ---------------- GUITAR IN\ns_gtr_gain = h_gtr_gain + (gtr_gain - h_gtr_gain) * k_fast;\nh_gtr_gain = s_gtr_gain;\ns_gtr_tone = h_gtr_tone + (gtr_tone - h_gtr_tone) * k_fast;\nh_gtr_tone = s_gtr_tone;\nx_in = (in1 + in2) * 0.5 * pow(10, s_gtr_gain / 20);\ntn_g = tan(pi * clamp(s_gtr_tone, 10, sr * 0.45) / sr);\ntn_k = 1 / (0.6);\ntn_a1 = 1 / (1 + tn_g * (tn_g + tn_k));\ntn_a2 = tn_g * tn_a1;\ntn_a3 = tn_g * tn_a2;\ntn_v3 = x_in - tn_s2;\ntn_v1 = tn_a1 * tn_s1 + tn_a2 * tn_v3;\ntn_v2 = tn_s2 + tn_a2 * tn_s1 + tn_a3 * tn_v3;\ntn_n1 = 2 * tn_v1 - tn_s1;\ntn_n2 = 2 * tn_v2 - tn_s2;\ntn_s1 = tn_n1;\ntn_s2 = tn_n2;\nx = tn_v2;\n\n// ---------------- DROP (dual-tap granular pitch shifter)\ns_drop_on = h_drop_on + (drop_on - h_drop_on) * k_on;\nh_drop_on = s_drop_on;\ns_drop_mix = h_drop_mix + (drop_mix - h_drop_mix) * k_fast;\nh_drop_mix = s_drop_mix;\ns_drop_grain = h_drop_grain + (drop_grain - h_drop_grain) * k_slow;\nh_drop_grain = s_drop_grain;\ndr_kg = 1 - exp(-1 / (max(drop_glide, 1) * 0.001 * sr));\ndr_semi = h_dsemi + (drop_semi - h_dsemi) * dr_kg;\nh_dsemi = dr_semi;\ndr_ratio = pow(2, dr_semi / 12);\ndr_w = max(s_drop_grain * 0.001 * sr, 64);\ndr_p = dr_ph + (1 - dr_ratio) / dr_w;\ndr_p = dr_p - floor(dr_p);\ndr_ph = dr_p;\ndr_p2 = dr_p + 0.5;\ndr_p2 = dr_p2 - floor(dr_p2);\ndr_t1 = clamp(dr_p * dr_w + 1, 1, 23990);\ndr_t2 = clamp(dr_p2 * dr_w + 1, 1, 23990);\ndr_r1 = dr_buf.read(dr_t1);\ndr_r2 = dr_buf.read(dr_t2);\ndr_w1 = sin(pi * dr_p);\ndr_w2 = sin(pi * dr_p2);\ndr_wet = dr_r1 * dr_w1 * dr_w1 + dr_r2 * dr_w2 * dr_w2;\ndr_buf.write(x);\ndr_out = x * (1 - s_drop_mix) + dr_wet * s_drop_mix;\nx = x + (dr_out - x) * s_drop_on;\n\n// ---------------- CE-2W (BBD chorus / vibrato)\ns_vibe_on = h_vibe_on + (vibe_on - h_vibe_on) * k_on;\nh_vibe_on = s_vibe_on;\ns_vibe_mode = h_vibe_mode + (vibe_mode - h_vibe_mode) * k_on;\nh_vibe_mode = s_vibe_mode;\ns_vibe_rate = h_vibe_rate + (vibe_rate - h_vibe_rate) * k_fast;\nh_vibe_rate = s_vibe_rate;\ns_vibe_depth = h_vibe_depth + (vibe_depth - h_vibe_depth) * k_fast;\nh_vibe_depth = s_vibe_depth;\ns_vibe_tone = h_vibe_tone + (vibe_tone - h_vibe_tone) * k_fast;\nh_vibe_tone = s_vibe_tone;\nvb_p = vb_ph + s_vibe_rate / sr;\nvb_p = vb_p - floor(vb_p);\nvb_ph = vb_p;\nvb_tri = 1 - 4 * abs(vb_p - 0.5);\nvb_lfo = vb_tri * (1 - 0.35 * vb_tri * vb_tri) / 0.65;\nvb_center = (6.5 - 2.5 * s_vibe_mode) * 0.001 * sr;\nvb_swing = (1.6 + 1.8 * s_vibe_mode) * s_vibe_depth * 0.001 * sr;\nvb_t = clamp(vb_center + vb_lfo * vb_swing, 2, 4090);\nvb_pre = tanh(x * 1.6) / 1.6;\nvb_buf.write(vb_pre);\nvb_r = vb_buf.read(vb_t);\nvbf_g = tan(pi * clamp(3000 + s_vibe_tone * s_vibe_tone * 9000, 10, sr * 0.45) / sr);\nvbf_k = 1 / (0.6);\nvbf_a1 = 1 / (1 + vbf_g * (vbf_g + vbf_k));\nvbf_a2 = vbf_g * vbf_a1;\nvbf_a3 = vbf_g * vbf_a2;\nvbf_v3 = vb_r - vbf_s2;\nvbf_v1 = vbf_a1 * vbf_s1 + vbf_a2 * vbf_v3;\nvbf_v2 = vbf_s2 + vbf_a2 * vbf_s1 + vbf_a3 * vbf_v3;\nvbf_n1 = 2 * vbf_v1 - vbf_s1;\nvbf_n2 = 2 * vbf_v2 - vbf_s2;\nvbf_s1 = vbf_n1;\nvbf_s2 = vbf_n2;\nvb_wet = vbf_v2 + (noise() * 0.0004) * s_vibe_depth;\nvb_out = x * (1 - s_vibe_mode) * 0.75 + vb_wet * (0.75 + 0.25 * s_vibe_mode);\nx = x + (vb_out - x) * s_vibe_on;\n\n// ---------------- PARA EQ\ns_eq_on = h_eq_on + (eq_on - h_eq_on) * k_on;\nh_eq_on = s_eq_on;\ns_eq_lowcut = h_eq_lowcut + (eq_lowcut - h_eq_lowcut) * k_fast;\nh_eq_lowcut = s_eq_lowcut;\ns_eq_lofreq = h_eq_lofreq + (eq_lofreq - h_eq_lofreq) * k_fast;\nh_eq_lofreq = s_eq_lofreq;\ns_eq_logain = h_eq_logain + (eq_logain - h_eq_logain) * k_fast;\nh_eq_logain = s_eq_logain;\ns_eq_midfreq = h_eq_midfreq + (eq_midfreq - h_eq_midfreq) * k_fast;\nh_eq_midfreq = s_eq_midfreq;\ns_eq_midgain = h_eq_midgain + (eq_midgain - h_eq_midgain) * k_fast;\nh_eq_midgain = s_eq_midgain;\ns_eq_midq = h_eq_midq + (eq_midq - h_eq_midq) * k_fast;\nh_eq_midq = s_eq_midq;\ns_eq_hifreq = h_eq_hifreq + (eq_hifreq - h_eq_hifreq) * k_fast;\nh_eq_hifreq = s_eq_hifreq;\ns_eq_higain = h_eq_higain + (eq_higain - h_eq_higain) * k_fast;\nh_eq_higain = s_eq_higain;\neqhp_g = tan(pi * clamp(s_eq_lowcut, 10, sr * 0.45) / sr);\neqhp_k = 1 / (0.7071);\neqhp_a1 = 1 / (1 + eqhp_g * (eqhp_g + eqhp_k));\neqhp_a2 = eqhp_g * eqhp_a1;\neqhp_a3 = eqhp_g * eqhp_a2;\neqhp_v3 = x - eqhp_s2;\neqhp_v1 = eqhp_a1 * eqhp_s1 + eqhp_a2 * eqhp_v3;\neqhp_v2 = eqhp_s2 + eqhp_a2 * eqhp_s1 + eqhp_a3 * eqhp_v3;\neqhp_n1 = 2 * eqhp_v1 - eqhp_s1;\neqhp_n2 = 2 * eqhp_v2 - eqhp_s2;\neqhp_s1 = eqhp_n1;\neqhp_s2 = eqhp_n2;\neqhp_o = x - eqhp_k * eqhp_v1 - eqhp_v2;\neqlo_A = pow(10, (s_eq_logain) / 40);\neqlo_g = tan(pi * clamp(s_eq_lofreq, 10, sr * 0.45) / sr) / sqrt(eqlo_A);\neqlo_k = 1 / (0.7071);\neqlo_a1 = 1 / (1 + eqlo_g * (eqlo_g + eqlo_k));\neqlo_a2 = eqlo_g * eqlo_a1;\neqlo_a3 = eqlo_g * eqlo_a2;\neqlo_v3 = eqhp_o - eqlo_s2;\neqlo_v1 = eqlo_a1 * eqlo_s1 + eqlo_a2 * eqlo_v3;\neqlo_v2 = eqlo_s2 + eqlo_a2 * eqlo_s1 + eqlo_a3 * eqlo_v3;\neqlo_n1 = 2 * eqlo_v1 - eqlo_s1;\neqlo_n2 = 2 * eqlo_v2 - eqlo_s2;\neqlo_s1 = eqlo_n1;\neqlo_s2 = eqlo_n2;\neqlo_o = eqhp_o + eqlo_k * (eqlo_A - 1) * eqlo_v1 + (eqlo_A * eqlo_A - 1) * eqlo_v2;\neqmd_A = pow(10, (s_eq_midgain) / 40);\neqmd_g = tan(pi * clamp(s_eq_midfreq, 10, sr * 0.45) / sr);\neqmd_k = 1 / ((s_eq_midq) * eqmd_A);\neqmd_a1 = 1 / (1 + eqmd_g * (eqmd_g + eqmd_k));\neqmd_a2 = eqmd_g * eqmd_a1;\neqmd_a3 = eqmd_g * eqmd_a2;\neqmd_v3 = eqlo_o - eqmd_s2;\neqmd_v1 = eqmd_a1 * eqmd_s1 + eqmd_a2 * eqmd_v3;\neqmd_v2 = eqmd_s2 + eqmd_a2 * eqmd_s1 + eqmd_a3 * eqmd_v3;\neqmd_n1 = 2 * eqmd_v1 - eqmd_s1;\neqmd_n2 = 2 * eqmd_v2 - eqmd_s2;\neqmd_s1 = eqmd_n1;\neqmd_s2 = eqmd_n2;\neqmd_o = eqlo_o + eqmd_k * (eqmd_A * eqmd_A - 1) * eqmd_v1;\neqhi_A = pow(10, (s_eq_higain) / 40);\neqhi_g = tan(pi * clamp(s_eq_hifreq, 10, sr * 0.45) / sr) * sqrt(eqhi_A);\neqhi_k = 1 / (0.7071);\neqhi_a1 = 1 / (1 + eqhi_g * (eqhi_g + eqhi_k));\neqhi_a2 = eqhi_g * eqhi_a1;\neqhi_a3 = eqhi_g * eqhi_a2;\neqhi_v3 = eqmd_o - eqhi_s2;\neqhi_v1 = eqhi_a1 * eqhi_s1 + eqhi_a2 * eqhi_v3;\neqhi_v2 = eqhi_s2 + eqhi_a2 * eqhi_s1 + eqhi_a3 * eqhi_v3;\neqhi_n1 = 2 * eqhi_v1 - eqhi_s1;\neqhi_n2 = 2 * eqhi_v2 - eqhi_s2;\neqhi_s1 = eqhi_n1;\neqhi_s2 = eqhi_n2;\neqhi_o = eqhi_A * eqhi_A * eqmd_o + eqhi_k * (1 - eqhi_A) * eqhi_A * eqhi_v1 + (1 - eqhi_A * eqhi_A) * eqhi_v2;\nx = x + (eqhi_o - x) * s_eq_on;\nsL = x;\nsR = x;\n\n// ---------------- REVERB-X  (4-line FDN, wet taps read first)\ns_verb_on = h_verb_on + (verb_on - h_verb_on) * k_on;\nh_verb_on = s_verb_on;\ns_verb_pos = h_verb_pos + (verb_pos - h_verb_pos) * k_on;\nh_verb_pos = s_verb_pos;\ns_verb_decay = h_verb_decay + (verb_decay - h_verb_decay) * k_fast;\nh_verb_decay = s_verb_decay;\ns_verb_size = h_verb_size + (verb_size - h_verb_size) * k_vslow;\nh_verb_size = s_verb_size;\ns_verb_tone = h_verb_tone + (verb_tone - h_verb_tone) * k_fast;\nh_verb_tone = s_verb_tone;\ns_verb_fuzz = h_verb_fuzz + (verb_fuzz - h_verb_fuzz) * k_fast;\nh_verb_fuzz = s_verb_fuzz;\ns_verb_mix = h_verb_mix + (verb_mix - h_verb_mix) * k_fast;\nh_verb_mix = s_verb_mix;\nrv_sz = 0.35 + s_verb_size * 1.25;\nrv_len0 = 31.7 * rv_sz * 0.001 * sr;\nrv_len1 = 37.3 * rv_sz * 0.001 * sr;\nrv_len2 = 41.9 * rv_sz * 0.001 * sr;\nrv_len3 = 47.3 * rv_sz * 0.001 * sr;\nrv_m = rv_mph + 0.73 / sr;\nrv_m = rv_m - floor(rv_m);\nrv_mph = rv_m;\nrv_mod = sin(twopi * rv_m) * 0.0009 * sr;\nrv_r0 = rv_d0.read(clamp(rv_len0 + rv_mod, 2, 19990));\nrv_r1 = rv_d1.read(clamp(rv_len1, 2, 19990));\nrv_r2 = rv_d2.read(clamp(rv_len2 - rv_mod, 2, 19990));\nrv_r3 = rv_d3.read(clamp(rv_len3, 2, 19990));\nrv_wL = (rv_r0 + rv_r2) * 0.5;\nrv_wR = (rv_r1 + rv_r3) * 0.5;\n\n// ---------------- DD-20 echo (wet taps read first)\ns_echo_on = h_echo_on + (echo_on - h_echo_on) * k_on;\nh_echo_on = s_echo_on;\ns_echo_pos = h_echo_pos + (echo_pos - h_echo_pos) * k_on;\nh_echo_pos = s_echo_pos;\ns_echo_time = h_echo_time + (echo_time - h_echo_time) * k_slow;\nh_echo_time = s_echo_time;\ns_echo_fb = h_echo_fb + (echo_fb - h_echo_fb) * k_fast;\nh_echo_fb = s_echo_fb;\ns_echo_tone = h_echo_tone + (echo_tone - h_echo_tone) * k_fast;\nh_echo_tone = s_echo_tone;\ns_echo_wob = h_echo_wob + (echo_wob - h_echo_wob) * k_fast;\nh_echo_wob = s_echo_wob;\ns_echo_pp = h_echo_pp + (echo_pp - h_echo_pp) * k_fast;\nh_echo_pp = s_echo_pp;\ns_echo_mix = h_echo_mix + (echo_mix - h_echo_mix) * k_fast;\nh_echo_mix = s_echo_mix;\nec_p = ec_ph + 0.9 / sr;\nec_p = ec_p - floor(ec_p);\nec_ph = ec_p;\nec_rnd = ec_rn + (noise() - ec_rn) * (twopi * 3 / sr);\nec_rn = ec_rnd;\nec_wob = (sin(twopi * ec_p) * 0.7 + ec_rnd * 6) * s_echo_wob * 0.0025 * sr;\nec_t = clamp(s_echo_time * 0.001 * sr + ec_wob, 4, 199000);\nec_rL = ec_dL.read(ec_t);\nec_rR = ec_dR.read(ec_t);\n\n// ---------------- routing: [verb pre] [echo pre] 424 [verb post] [echo post]\nrv_dry = 1 - 0.45 * s_verb_mix;\nrv_on = s_verb_on;\nrv_pre = rv_on * (1 - s_verb_pos);\nrv_post = rv_on * s_verb_pos;\nec_pre = s_echo_on * (1 - s_echo_pos);\nec_post = s_echo_on * s_echo_pos;\nrv_inL_a = sL;\nrv_inR_a = sR;\nsL = sL + ((sL * rv_dry + rv_wL * s_verb_mix) - sL) * rv_pre;\nsR = sR + ((sR * rv_dry + rv_wR * s_verb_mix) - sR) * rv_pre;\nec_inL_a = sL;\nec_inR_a = sR;\nsL = sL + ec_rL * s_echo_mix * ec_pre;\nsR = sR + ec_rR * s_echo_mix * ec_pre;\n\n// ---------------- TASCAM 424 MkI channel: Trim > op-amp > EQ > Fader > op-amp\ns_pre_on = h_pre_on + (pre_on - h_pre_on) * k_on;\nh_pre_on = s_pre_on;\ns_pre_trim = h_pre_trim + (pre_trim - h_pre_trim) * k_fast;\nh_pre_trim = s_pre_trim;\ns_pre_fader = h_pre_fader + (pre_fader - h_pre_fader) * k_fast;\nh_pre_fader = s_pre_fader;\ns_pre_bass = h_pre_bass + (pre_bass - h_pre_bass) * k_fast;\nh_pre_bass = s_pre_bass;\ns_pre_treble = h_pre_treble + (pre_treble - h_pre_treble) * k_fast;\nh_pre_treble = s_pre_treble;\ns_pre_mid = h_pre_mid + (pre_mid - h_pre_mid) * k_fast;\nh_pre_mid = s_pre_mid;\ns_pre_level = h_pre_level + (pre_level - h_pre_level) * k_fast;\nh_pre_level = s_pre_level;\npa_g1 = pow(10, s_pre_trim / 20);\npa_g2 = pow(10, s_pre_fader / 20);\npa_bw = clamp(17000 - s_pre_trim * 230, 5500, 17000);\npa_lev = pow(10, s_pre_level / 20);\npaLhpz_c = 1 - exp(-twopi * clamp(55, 5, sr * 0.45) / sr);\npaLhpz_y = paLhpz_z + (sL - paLhpz_z) * paLhpz_c;\npaLhpz_z = paLhpz_y;\npaL_x = (sL - paLhpz_y) * pa_g1;\npaL_u = paL_x + 0.18;\npaL_c1 = paL_u / pow(1 + pow(abs(paL_u), 2.5), 0.4) - 0.18 / pow(1 + pow(0.18, 2.5), 0.4);\npaLlp1_g = tan(pi * clamp(pa_bw, 10, sr * 0.45) / sr);\npaLlp1_k = 1 / (0.6);\npaLlp1_a1 = 1 / (1 + paLlp1_g * (paLlp1_g + paLlp1_k));\npaLlp1_a2 = paLlp1_g * paLlp1_a1;\npaLlp1_a3 = paLlp1_g * paLlp1_a2;\npaLlp1_v3 = paL_c1 - paLlp1_s2;\npaLlp1_v1 = paLlp1_a1 * paLlp1_s1 + paLlp1_a2 * paLlp1_v3;\npaLlp1_v2 = paLlp1_s2 + paLlp1_a2 * paLlp1_s1 + paLlp1_a3 * paLlp1_v3;\npaLlp1_n1 = 2 * paLlp1_v1 - paLlp1_s1;\npaLlp1_n2 = 2 * paLlp1_v2 - paLlp1_s2;\npaLlp1_s1 = paLlp1_n1;\npaLlp1_s2 = paLlp1_n2;\npaLdc_c = 1 - exp(-twopi * clamp(12, 5, sr * 0.45) / sr);\npaLdc_y = paLdc_z + (paLlp1_v2 - paLdc_z) * paLdc_c;\npaLdc_z = paLdc_y;\npaL_y = paLlp1_v2 - paLdc_y;\npaLbs_A = pow(10, (s_pre_bass) / 40);\npaLbs_g = tan(pi * clamp(100, 10, sr * 0.45) / sr) / sqrt(paLbs_A);\npaLbs_k = 1 / (0.7071);\npaLbs_a1 = 1 / (1 + paLbs_g * (paLbs_g + paLbs_k));\npaLbs_a2 = paLbs_g * paLbs_a1;\npaLbs_a3 = paLbs_g * paLbs_a2;\npaLbs_v3 = paL_y - paLbs_s2;\npaLbs_v1 = paLbs_a1 * paLbs_s1 + paLbs_a2 * paLbs_v3;\npaLbs_v2 = paLbs_s2 + paLbs_a2 * paLbs_s1 + paLbs_a3 * paLbs_v3;\npaLbs_n1 = 2 * paLbs_v1 - paLbs_s1;\npaLbs_n2 = 2 * paLbs_v2 - paLbs_s2;\npaLbs_s1 = paLbs_n1;\npaLbs_s2 = paLbs_n2;\npaLbs_o = paL_y + paLbs_k * (paLbs_A - 1) * paLbs_v1 + (paLbs_A * paLbs_A - 1) * paLbs_v2;\npaLmd_A = pow(10, (s_pre_mid) / 40);\npaLmd_g = tan(pi * clamp(900, 10, sr * 0.45) / sr);\npaLmd_k = 1 / ((0.6) * paLmd_A);\npaLmd_a1 = 1 / (1 + paLmd_g * (paLmd_g + paLmd_k));\npaLmd_a2 = paLmd_g * paLmd_a1;\npaLmd_a3 = paLmd_g * paLmd_a2;\npaLmd_v3 = paLbs_o - paLmd_s2;\npaLmd_v1 = paLmd_a1 * paLmd_s1 + paLmd_a2 * paLmd_v3;\npaLmd_v2 = paLmd_s2 + paLmd_a2 * paLmd_s1 + paLmd_a3 * paLmd_v3;\npaLmd_n1 = 2 * paLmd_v1 - paLmd_s1;\npaLmd_n2 = 2 * paLmd_v2 - paLmd_s2;\npaLmd_s1 = paLmd_n1;\npaLmd_s2 = paLmd_n2;\npaLmd_o = paLbs_o + paLmd_k * (paLmd_A * paLmd_A - 1) * paLmd_v1;\npaLtr_A = pow(10, (s_pre_treble) / 40);\npaLtr_g = tan(pi * clamp(10000, 10, sr * 0.45) / sr) * sqrt(paLtr_A);\npaLtr_k = 1 / (0.7071);\npaLtr_a1 = 1 / (1 + paLtr_g * (paLtr_g + paLtr_k));\npaLtr_a2 = paLtr_g * paLtr_a1;\npaLtr_a3 = paLtr_g * paLtr_a2;\npaLtr_v3 = paLmd_o - paLtr_s2;\npaLtr_v1 = paLtr_a1 * paLtr_s1 + paLtr_a2 * paLtr_v3;\npaLtr_v2 = paLtr_s2 + paLtr_a2 * paLtr_s1 + paLtr_a3 * paLtr_v3;\npaLtr_n1 = 2 * paLtr_v1 - paLtr_s1;\npaLtr_n2 = 2 * paLtr_v2 - paLtr_s2;\npaLtr_s1 = paLtr_n1;\npaLtr_s2 = paLtr_n2;\npaLtr_o = paLtr_A * paLtr_A * paLmd_o + paLtr_k * (1 - paLtr_A) * paLtr_A * paLtr_v1 + (1 - paLtr_A * paLtr_A) * paLtr_v2;\npaL_v = paLtr_o * pa_g2 + 0.06;\npaL_c2 = paL_v / pow(1 + pow(abs(paL_v), 4), 0.25) - 0.06 / pow(1 + pow(0.06, 4), 0.25);\npaLlp2_g = tan(pi * clamp(15000, 10, sr * 0.45) / sr);\npaLlp2_k = 1 / (0.7071);\npaLlp2_a1 = 1 / (1 + paLlp2_g * (paLlp2_g + paLlp2_k));\npaLlp2_a2 = paLlp2_g * paLlp2_a1;\npaLlp2_a3 = paLlp2_g * paLlp2_a2;\npaLlp2_v3 = paL_c2 - paLlp2_s2;\npaLlp2_v1 = paLlp2_a1 * paLlp2_s1 + paLlp2_a2 * paLlp2_v3;\npaLlp2_v2 = paLlp2_s2 + paLlp2_a2 * paLlp2_s1 + paLlp2_a3 * paLlp2_v3;\npaLlp2_n1 = 2 * paLlp2_v1 - paLlp2_s1;\npaLlp2_n2 = 2 * paLlp2_v2 - paLlp2_s2;\npaLlp2_s1 = paLlp2_n1;\npaLlp2_s2 = paLlp2_n2;\npaL_o = paLlp2_v2 * pa_lev * 0.15;\nsL = sL + (paL_o - sL) * s_pre_on;\npaRhpz_c = 1 - exp(-twopi * clamp(55, 5, sr * 0.45) / sr);\npaRhpz_y = paRhpz_z + (sR - paRhpz_z) * paRhpz_c;\npaRhpz_z = paRhpz_y;\npaR_x = (sR - paRhpz_y) * pa_g1;\npaR_u = paR_x + 0.18;\npaR_c1 = paR_u / pow(1 + pow(abs(paR_u), 2.5), 0.4) - 0.18 / pow(1 + pow(0.18, 2.5), 0.4);\npaRlp1_g = tan(pi * clamp(pa_bw, 10, sr * 0.45) / sr);\npaRlp1_k = 1 / (0.6);\npaRlp1_a1 = 1 / (1 + paRlp1_g * (paRlp1_g + paRlp1_k));\npaRlp1_a2 = paRlp1_g * paRlp1_a1;\npaRlp1_a3 = paRlp1_g * paRlp1_a2;\npaRlp1_v3 = paR_c1 - paRlp1_s2;\npaRlp1_v1 = paRlp1_a1 * paRlp1_s1 + paRlp1_a2 * paRlp1_v3;\npaRlp1_v2 = paRlp1_s2 + paRlp1_a2 * paRlp1_s1 + paRlp1_a3 * paRlp1_v3;\npaRlp1_n1 = 2 * paRlp1_v1 - paRlp1_s1;\npaRlp1_n2 = 2 * paRlp1_v2 - paRlp1_s2;\npaRlp1_s1 = paRlp1_n1;\npaRlp1_s2 = paRlp1_n2;\npaRdc_c = 1 - exp(-twopi * clamp(12, 5, sr * 0.45) / sr);\npaRdc_y = paRdc_z + (paRlp1_v2 - paRdc_z) * paRdc_c;\npaRdc_z = paRdc_y;\npaR_y = paRlp1_v2 - paRdc_y;\npaRbs_A = pow(10, (s_pre_bass) / 40);\npaRbs_g = tan(pi * clamp(100, 10, sr * 0.45) / sr) / sqrt(paRbs_A);\npaRbs_k = 1 / (0.7071);\npaRbs_a1 = 1 / (1 + paRbs_g * (paRbs_g + paRbs_k));\npaRbs_a2 = paRbs_g * paRbs_a1;\npaRbs_a3 = paRbs_g * paRbs_a2;\npaRbs_v3 = paR_y - paRbs_s2;\npaRbs_v1 = paRbs_a1 * paRbs_s1 + paRbs_a2 * paRbs_v3;\npaRbs_v2 = paRbs_s2 + paRbs_a2 * paRbs_s1 + paRbs_a3 * paRbs_v3;\npaRbs_n1 = 2 * paRbs_v1 - paRbs_s1;\npaRbs_n2 = 2 * paRbs_v2 - paRbs_s2;\npaRbs_s1 = paRbs_n1;\npaRbs_s2 = paRbs_n2;\npaRbs_o = paR_y + paRbs_k * (paRbs_A - 1) * paRbs_v1 + (paRbs_A * paRbs_A - 1) * paRbs_v2;\npaRmd_A = pow(10, (s_pre_mid) / 40);\npaRmd_g = tan(pi * clamp(900, 10, sr * 0.45) / sr);\npaRmd_k = 1 / ((0.6) * paRmd_A);\npaRmd_a1 = 1 / (1 + paRmd_g * (paRmd_g + paRmd_k));\npaRmd_a2 = paRmd_g * paRmd_a1;\npaRmd_a3 = paRmd_g * paRmd_a2;\npaRmd_v3 = paRbs_o - paRmd_s2;\npaRmd_v1 = paRmd_a1 * paRmd_s1 + paRmd_a2 * paRmd_v3;\npaRmd_v2 = paRmd_s2 + paRmd_a2 * paRmd_s1 + paRmd_a3 * paRmd_v3;\npaRmd_n1 = 2 * paRmd_v1 - paRmd_s1;\npaRmd_n2 = 2 * paRmd_v2 - paRmd_s2;\npaRmd_s1 = paRmd_n1;\npaRmd_s2 = paRmd_n2;\npaRmd_o = paRbs_o + paRmd_k * (paRmd_A * paRmd_A - 1) * paRmd_v1;\npaRtr_A = pow(10, (s_pre_treble) / 40);\npaRtr_g = tan(pi * clamp(10000, 10, sr * 0.45) / sr) * sqrt(paRtr_A);\npaRtr_k = 1 / (0.7071);\npaRtr_a1 = 1 / (1 + paRtr_g * (paRtr_g + paRtr_k));\npaRtr_a2 = paRtr_g * paRtr_a1;\npaRtr_a3 = paRtr_g * paRtr_a2;\npaRtr_v3 = paRmd_o - paRtr_s2;\npaRtr_v1 = paRtr_a1 * paRtr_s1 + paRtr_a2 * paRtr_v3;\npaRtr_v2 = paRtr_s2 + paRtr_a2 * paRtr_s1 + paRtr_a3 * paRtr_v3;\npaRtr_n1 = 2 * paRtr_v1 - paRtr_s1;\npaRtr_n2 = 2 * paRtr_v2 - paRtr_s2;\npaRtr_s1 = paRtr_n1;\npaRtr_s2 = paRtr_n2;\npaRtr_o = paRtr_A * paRtr_A * paRmd_o + paRtr_k * (1 - paRtr_A) * paRtr_A * paRtr_v1 + (1 - paRtr_A * paRtr_A) * paRtr_v2;\npaR_v = paRtr_o * pa_g2 + 0.06;\npaR_c2 = paR_v / pow(1 + pow(abs(paR_v), 4), 0.25) - 0.06 / pow(1 + pow(0.06, 4), 0.25);\npaRlp2_g = tan(pi * clamp(15000, 10, sr * 0.45) / sr);\npaRlp2_k = 1 / (0.7071);\npaRlp2_a1 = 1 / (1 + paRlp2_g * (paRlp2_g + paRlp2_k));\npaRlp2_a2 = paRlp2_g * paRlp2_a1;\npaRlp2_a3 = paRlp2_g * paRlp2_a2;\npaRlp2_v3 = paR_c2 - paRlp2_s2;\npaRlp2_v1 = paRlp2_a1 * paRlp2_s1 + paRlp2_a2 * paRlp2_v3;\npaRlp2_v2 = paRlp2_s2 + paRlp2_a2 * paRlp2_s1 + paRlp2_a3 * paRlp2_v3;\npaRlp2_n1 = 2 * paRlp2_v1 - paRlp2_s1;\npaRlp2_n2 = 2 * paRlp2_v2 - paRlp2_s2;\npaRlp2_s1 = paRlp2_n1;\npaRlp2_s2 = paRlp2_n2;\npaR_o = paRlp2_v2 * pa_lev * 0.15;\nsR = sR + (paR_o - sR) * s_pre_on;\n\n// ---------------- post-424 verb / echo\nrv_inL_b = sL;\nrv_inR_b = sR;\nsL = sL + ((sL * rv_dry + rv_wL * s_verb_mix) - sL) * rv_post;\nsR = sR + ((sR * rv_dry + rv_wR * s_verb_mix) - sR) * rv_post;\nec_inL_b = sL;\nec_inR_b = sR;\nsL = sL + ec_rL * s_echo_mix * ec_post;\nsR = sR + ec_rR * s_echo_mix * ec_post;\n\n// ---------------- REVERB-X write: fuzz > diffusers > FDN\nrv_in = ((rv_inL_a + rv_inR_a) * (1 - s_verb_pos) + (rv_inL_b + rv_inR_b) * s_verb_pos) * 0.5 * rv_on;\nrv_drv = 1 + s_verb_fuzz * s_verb_fuzz * 80;\nrv_fz = rv_in + (tanh(rv_in * rv_drv) * 0.3 - rv_in) * s_verb_fuzz;\nrvfz_g = tan(pi * clamp(9000 - s_verb_fuzz * 5500, 10, sr * 0.45) / sr);\nrvfz_k = 1 / (0.7071);\nrvfz_a1 = 1 / (1 + rvfz_g * (rvfz_g + rvfz_k));\nrvfz_a2 = rvfz_g * rvfz_a1;\nrvfz_a3 = rvfz_g * rvfz_a2;\nrvfz_v3 = rv_fz - rvfz_s2;\nrvfz_v1 = rvfz_a1 * rvfz_s1 + rvfz_a2 * rvfz_v3;\nrvfz_v2 = rvfz_s2 + rvfz_a2 * rvfz_s1 + rvfz_a3 * rvfz_v3;\nrvfz_n1 = 2 * rvfz_v1 - rvfz_s1;\nrvfz_n2 = 2 * rvfz_v2 - rvfz_s2;\nrvfz_s1 = rvfz_n1;\nrvfz_s2 = rvfz_n2;\nrv_a = rvfz_v2;\nrv_apr0 = rv_ap0.read(clamp(4.77 * 0.001 * sr * (0.6 + rv_sz * 0.4), 1, 2990));\nrv_apw0 = rv_a + 0.62 * rv_apr0;\nrv_a = rv_apr0 - 0.62 * rv_apw0;\nrv_ap0.write(rv_apw0);\nrv_apr1 = rv_ap1.read(clamp(3.59 * 0.001 * sr * (0.6 + rv_sz * 0.4), 1, 2990));\nrv_apw1 = rv_a + 0.62 * rv_apr1;\nrv_a = rv_apr1 - 0.62 * rv_apw1;\nrv_ap1.write(rv_apw1);\nrv_apr2 = rv_ap2.read(clamp(2.73 * 0.001 * sr * (0.6 + rv_sz * 0.4), 1, 2990));\nrv_apw2 = rv_a + 0.62 * rv_apr2;\nrv_a = rv_apr2 - 0.62 * rv_apw2;\nrv_ap2.write(rv_apw2);\nrv_apr3 = rv_ap3.read(clamp(1.91 * 0.001 * sr * (0.6 + rv_sz * 0.4), 1, 2990));\nrv_apw3 = rv_a + 0.62 * rv_apr3;\nrv_a = rv_apr3 - 0.62 * rv_apw3;\nrv_ap3.write(rv_apw3);\nrv_damp = 1500 + s_verb_tone * s_verb_tone * 14000;\nrv_dc = 1 - exp(-twopi * clamp(rv_damp, 100, sr * 0.45) / sr);\nrv_T = max(s_verb_decay, 0.05) * sr;\nrv_g0 = pow(0.001, rv_len0 / rv_T);\nrv_f0 = rv_lp0 + (rv_r0 * rv_g0 - rv_lp0) * rv_dc;\nrv_lp0 = rv_f0;\nrv_g1 = pow(0.001, rv_len1 / rv_T);\nrv_f1 = rv_lp1 + (rv_r1 * rv_g1 - rv_lp1) * rv_dc;\nrv_lp1 = rv_f1;\nrv_g2 = pow(0.001, rv_len2 / rv_T);\nrv_f2 = rv_lp2 + (rv_r2 * rv_g2 - rv_lp2) * rv_dc;\nrv_lp2 = rv_f2;\nrv_g3 = pow(0.001, rv_len3 / rv_T);\nrv_f3 = rv_lp3 + (rv_r3 * rv_g3 - rv_lp3) * rv_dc;\nrv_lp3 = rv_f3;\nrv_h0 = (rv_f0 + rv_f1 + rv_f2 + rv_f3) * 0.5;\nrv_h1 = (rv_f0 - rv_f1 + rv_f2 - rv_f3) * 0.5;\nrv_h2 = (rv_f0 + rv_f1 - rv_f2 - rv_f3) * 0.5;\nrv_h3 = (rv_f0 - rv_f1 - rv_f2 + rv_f3) * 0.5;\nrv_d0.write(rv_a * 0.5 + rv_h0);\nrv_d1.write(-rv_a * 0.5 + rv_h1);\nrv_d2.write(rv_a * 0.5 + rv_h2);\nrv_d3.write(-rv_a * 0.5 + rv_h3);\n\n// ---------------- DD-20 write: tone + soft clip in the loop, ping-pong\nec_inL = (ec_inL_a * (1 - s_echo_pos) + ec_inL_b * s_echo_pos) * s_echo_on;\nec_inR = (ec_inR_a * (1 - s_echo_pos) + ec_inR_b * s_echo_pos) * s_echo_on;\nec_tf = 900 + s_echo_tone * s_echo_tone * 11000;\necfL_g = tan(pi * clamp(ec_tf, 10, sr * 0.45) / sr);\necfL_k = 1 / (0.6);\necfL_a1 = 1 / (1 + ecfL_g * (ecfL_g + ecfL_k));\necfL_a2 = ecfL_g * ecfL_a1;\necfL_a3 = ecfL_g * ecfL_a2;\necfL_v3 = ec_rL - ecfL_s2;\necfL_v1 = ecfL_a1 * ecfL_s1 + ecfL_a2 * ecfL_v3;\necfL_v2 = ecfL_s2 + ecfL_a2 * ecfL_s1 + ecfL_a3 * ecfL_v3;\necfL_n1 = 2 * ecfL_v1 - ecfL_s1;\necfL_n2 = 2 * ecfL_v2 - ecfL_s2;\necfL_s1 = ecfL_n1;\necfL_s2 = ecfL_n2;\necfR_g = tan(pi * clamp(ec_tf, 10, sr * 0.45) / sr);\necfR_k = 1 / (0.6);\necfR_a1 = 1 / (1 + ecfR_g * (ecfR_g + ecfR_k));\necfR_a2 = ecfR_g * ecfR_a1;\necfR_a3 = ecfR_g * ecfR_a2;\necfR_v3 = ec_rR - ecfR_s2;\necfR_v1 = ecfR_a1 * ecfR_s1 + ecfR_a2 * ecfR_v3;\necfR_v2 = ecfR_s2 + ecfR_a2 * ecfR_s1 + ecfR_a3 * ecfR_v3;\necfR_n1 = 2 * ecfR_v1 - ecfR_s1;\necfR_n2 = 2 * ecfR_v2 - ecfR_s2;\necfR_s1 = ecfR_n1;\necfR_s2 = ecfR_n2;\necdcL_c = 1 - exp(-twopi * clamp(60, 5, sr * 0.45) / sr);\necdcL_y = ecdcL_z + (ecfL_v2 - ecdcL_z) * ecdcL_c;\necdcL_z = ecdcL_y;\necdcR_c = 1 - exp(-twopi * clamp(60, 5, sr * 0.45) / sr);\necdcR_y = ecdcR_z + (ecfR_v2 - ecdcR_z) * ecdcR_c;\necdcR_z = ecdcR_y;\nec_fbL = tanh((ecfL_v2 - ecdcL_y) * 1.3) / 1.3;\nec_fbR = tanh((ecfR_v2 - ecdcR_y) * 1.3) / 1.3;\nec_mono = (ec_inL + ec_inR) * 0.5;\nec_dL.write(ec_inL + (ec_mono - ec_inL) * s_echo_pp + s_echo_fb * (ec_fbL * (1 - s_echo_pp) + ec_fbR * s_echo_pp));\nec_dR.write((ec_inR + (ec_mono - ec_inR) * s_echo_pp) * (1 - s_echo_pp) + s_echo_fb * (ec_fbR * (1 - s_echo_pp) + ec_fbL * s_echo_pp));\n\n// ---------------- CASSETTE\ns_tape_on = h_tape_on + (tape_on - h_tape_on) * k_on;\nh_tape_on = s_tape_on;\ns_tape_wow = h_tape_wow + (tape_wow - h_tape_wow) * k_fast;\nh_tape_wow = s_tape_wow;\ns_tape_flutter = h_tape_flutter + (tape_flutter - h_tape_flutter) * k_fast;\nh_tape_flutter = s_tape_flutter;\ns_tape_sat = h_tape_sat + (tape_sat - h_tape_sat) * k_fast;\nh_tape_sat = s_tape_sat;\ns_tape_hiss = h_tape_hiss + (tape_hiss - h_tape_hiss) * k_fast;\nh_tape_hiss = s_tape_hiss;\ns_tape_age = h_tape_age + (tape_age - h_tape_age) * k_fast;\nh_tape_age = s_tape_age;\ns_tape_drop = h_tape_drop + (tape_drop - h_tape_drop) * k_fast;\nh_tape_drop = s_tape_drop;\ntp_a = tp_w1 + 0.53 / sr;\ntp_a = tp_a - floor(tp_a);\ntp_w1 = tp_a;\ntp_b = tp_w2 + 0.31 / sr;\ntp_b = tp_b - floor(tp_b);\ntp_w2 = tp_b;\ntp_c = tp_f1 + 7.3 / sr;\ntp_c = tp_c - floor(tp_c);\ntp_f1 = tp_c;\ntp_rnd = tp_rn + (noise() - tp_rn) * (twopi * 1.2 / sr);\ntp_rn = tp_rnd;\ntp_wowv = sin(twopi * tp_a) * 0.6 + sin(twopi * tp_b) * 0.4 + tp_rnd * 8;\ntp_flv = sin(twopi * tp_c) + noise() * 0.15;\ntp_t = clamp((6 + tp_wowv * s_tape_wow * 3.5 + tp_flv * s_tape_flutter * 0.12) * 0.001 * sr, 2, 4090);\ntp_trig = (noise() * 0.5 + 0.5) < (s_tape_drop * 1.5 / sr);\ntp_depth = 0.35 + (noise() * 0.5 + 0.5) * 0.65;\ntp_e = max(tp_env * (1 - 8 / sr), tp_trig * tp_depth);\ntp_env = tp_e;\ntp_gt = 1 - tp_e * min(s_tape_drop * 4, 1) * 0.85;\ntp_g = tp_gz + (tp_gt - tp_gz) * (1 - exp(-1 / (0.004 * sr)));\ntp_gz = tp_g;\ntp_drive = pow(10, (s_tape_sat * 18) / 20);\ntp_hf = 16000 - s_tape_age * 10500;\ntp_dL.write(sL);\ntpL_r = tp_dL.read(tp_t);\ntpL_u = tpL_r * tp_drive;\ntpL_s = (tanh(tpL_u + 0.08 * tpL_u * tpL_u / (1 + abs(tpL_u))) ) / (0.75 + 0.25 * tp_drive);\ntpL_s = tpL_r + (tpL_s - tpL_r) * min(s_tape_sat * 3, 1);\ntpLbm_A = pow(10, (1 + s_tape_age * 3) / 40);\ntpLbm_g = tan(pi * clamp(85, 10, sr * 0.45) / sr);\ntpLbm_k = 1 / ((1.1) * tpLbm_A);\ntpLbm_a1 = 1 / (1 + tpLbm_g * (tpLbm_g + tpLbm_k));\ntpLbm_a2 = tpLbm_g * tpLbm_a1;\ntpLbm_a3 = tpLbm_g * tpLbm_a2;\ntpLbm_v3 = tpL_s - tpLbm_s2;\ntpLbm_v1 = tpLbm_a1 * tpLbm_s1 + tpLbm_a2 * tpLbm_v3;\ntpLbm_v2 = tpLbm_s2 + tpLbm_a2 * tpLbm_s1 + tpLbm_a3 * tpLbm_v3;\ntpLbm_n1 = 2 * tpLbm_v1 - tpLbm_s1;\ntpLbm_n2 = 2 * tpLbm_v2 - tpLbm_s2;\ntpLbm_s1 = tpLbm_n1;\ntpLbm_s2 = tpLbm_n2;\ntpLbm_o = tpL_s + tpLbm_k * (tpLbm_A * tpLbm_A - 1) * tpLbm_v1;\ntpLlp_g = tan(pi * clamp(tp_hf, 10, sr * 0.45) / sr);\ntpLlp_k = 1 / (0.75);\ntpLlp_a1 = 1 / (1 + tpLlp_g * (tpLlp_g + tpLlp_k));\ntpLlp_a2 = tpLlp_g * tpLlp_a1;\ntpLlp_a3 = tpLlp_g * tpLlp_a2;\ntpLlp_v3 = tpLbm_o - tpLlp_s2;\ntpLlp_v1 = tpLlp_a1 * tpLlp_s1 + tpLlp_a2 * tpLlp_v3;\ntpLlp_v2 = tpLlp_s2 + tpLlp_a2 * tpLlp_s1 + tpLlp_a3 * tpLlp_v3;\ntpLlp_n1 = 2 * tpLlp_v1 - tpLlp_s1;\ntpLlp_n2 = 2 * tpLlp_v2 - tpLlp_s2;\ntpLlp_s1 = tpLlp_n1;\ntpLlp_s2 = tpLlp_n2;\ntpLnz_g = tan(pi * clamp(5500, 10, sr * 0.45) / sr);\ntpLnz_k = 1 / (0.5);\ntpLnz_a1 = 1 / (1 + tpLnz_g * (tpLnz_g + tpLnz_k));\ntpLnz_a2 = tpLnz_g * tpLnz_a1;\ntpLnz_a3 = tpLnz_g * tpLnz_a2;\ntpLnz_v3 = noise() - tpLnz_s2;\ntpLnz_v1 = tpLnz_a1 * tpLnz_s1 + tpLnz_a2 * tpLnz_v3;\ntpLnz_v2 = tpLnz_s2 + tpLnz_a2 * tpLnz_s1 + tpLnz_a3 * tpLnz_v3;\ntpLnz_n1 = 2 * tpLnz_v1 - tpLnz_s1;\ntpLnz_n2 = 2 * tpLnz_v2 - tpLnz_s2;\ntpLnz_s1 = tpLnz_n1;\ntpLnz_s2 = tpLnz_n2;\ntpL_o = tpLlp_v2 * tp_g + tpLnz_v1 * s_tape_hiss * s_tape_hiss * 0.02;\nsL = sL + (tpL_o - sL) * s_tape_on;\ntp_dR.write(sR);\ntpR_r = tp_dR.read(tp_t);\ntpR_u = tpR_r * tp_drive;\ntpR_s = (tanh(tpR_u + 0.08 * tpR_u * tpR_u / (1 + abs(tpR_u))) ) / (0.75 + 0.25 * tp_drive);\ntpR_s = tpR_r + (tpR_s - tpR_r) * min(s_tape_sat * 3, 1);\ntpRbm_A = pow(10, (1 + s_tape_age * 3) / 40);\ntpRbm_g = tan(pi * clamp(85, 10, sr * 0.45) / sr);\ntpRbm_k = 1 / ((1.1) * tpRbm_A);\ntpRbm_a1 = 1 / (1 + tpRbm_g * (tpRbm_g + tpRbm_k));\ntpRbm_a2 = tpRbm_g * tpRbm_a1;\ntpRbm_a3 = tpRbm_g * tpRbm_a2;\ntpRbm_v3 = tpR_s - tpRbm_s2;\ntpRbm_v1 = tpRbm_a1 * tpRbm_s1 + tpRbm_a2 * tpRbm_v3;\ntpRbm_v2 = tpRbm_s2 + tpRbm_a2 * tpRbm_s1 + tpRbm_a3 * tpRbm_v3;\ntpRbm_n1 = 2 * tpRbm_v1 - tpRbm_s1;\ntpRbm_n2 = 2 * tpRbm_v2 - tpRbm_s2;\ntpRbm_s1 = tpRbm_n1;\ntpRbm_s2 = tpRbm_n2;\ntpRbm_o = tpR_s + tpRbm_k * (tpRbm_A * tpRbm_A - 1) * tpRbm_v1;\ntpRlp_g = tan(pi * clamp(tp_hf, 10, sr * 0.45) / sr);\ntpRlp_k = 1 / (0.75);\ntpRlp_a1 = 1 / (1 + tpRlp_g * (tpRlp_g + tpRlp_k));\ntpRlp_a2 = tpRlp_g * tpRlp_a1;\ntpRlp_a3 = tpRlp_g * tpRlp_a2;\ntpRlp_v3 = tpRbm_o - tpRlp_s2;\ntpRlp_v1 = tpRlp_a1 * tpRlp_s1 + tpRlp_a2 * tpRlp_v3;\ntpRlp_v2 = tpRlp_s2 + tpRlp_a2 * tpRlp_s1 + tpRlp_a3 * tpRlp_v3;\ntpRlp_n1 = 2 * tpRlp_v1 - tpRlp_s1;\ntpRlp_n2 = 2 * tpRlp_v2 - tpRlp_s2;\ntpRlp_s1 = tpRlp_n1;\ntpRlp_s2 = tpRlp_n2;\ntpRnz_g = tan(pi * clamp(5500, 10, sr * 0.45) / sr);\ntpRnz_k = 1 / (0.5);\ntpRnz_a1 = 1 / (1 + tpRnz_g * (tpRnz_g + tpRnz_k));\ntpRnz_a2 = tpRnz_g * tpRnz_a1;\ntpRnz_a3 = tpRnz_g * tpRnz_a2;\ntpRnz_v3 = noise() - tpRnz_s2;\ntpRnz_v1 = tpRnz_a1 * tpRnz_s1 + tpRnz_a2 * tpRnz_v3;\ntpRnz_v2 = tpRnz_s2 + tpRnz_a2 * tpRnz_s1 + tpRnz_a3 * tpRnz_v3;\ntpRnz_n1 = 2 * tpRnz_v1 - tpRnz_s1;\ntpRnz_n2 = 2 * tpRnz_v2 - tpRnz_s2;\ntpRnz_s1 = tpRnz_n1;\ntpRnz_s2 = tpRnz_n2;\ntpR_o = tpRlp_v2 * tp_g + tpRnz_v1 * s_tape_hiss * s_tape_hiss * 0.02;\nsR = sR + (tpR_o - sR) * s_tape_on;\n\n// ---------------- OUT\ns_out_mix = h_out_mix + (out_mix - h_out_mix) * k_fast;\nh_out_mix = s_out_mix;\ns_out_width = h_out_width + (out_width - h_out_width) * k_fast;\nh_out_width = s_out_width;\ns_out_gain = h_out_gain + (out_gain - h_out_gain) * k_fast;\nh_out_gain = s_out_gain;\no_m = (sL + sR) * 0.5;\no_s = (sL - sR) * 0.5 * s_out_width;\no_g = pow(10, s_out_gain / 20);\no_L = (in1 + ((o_m + o_s) - in1) * s_out_mix) * o_g;\no_R = (in2 + ((o_m - o_s) - in2) * s_out_mix) * o_g;\nout1 = clamp(o_L, -4, 4);\nout2 = clamp(o_R, -4, 4);\n",
         "fontface": 0,
         "fontname": "<Monospaced>",
         "fontsize": 12.0,
         "numinlets": 2,
         "numoutlets": 2,
         "outlettype": [
          "",
          ""
         ],
         "patching_rect": [
          20,
          50,
          610,
          700
         ]
        }
       },
       {
        "box": {
         "id": "obj-4",
         "maxclass": "newobj",
         "text": "out 1",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          20,
          770,
          37,
          22
         ]
        }
       },
       {
        "box": {
         "id": "obj-5",
         "maxclass": "newobj",
         "text": "out 2",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          600,
          770,
          37,
          22
         ]
        }
       }
      ],
      "lines": [
       {
        "patchline": {
         "source": [
          "obj-1",
          0
         ],
         "destination": [
          "obj-3",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-2",
          0
         ],
         "destination": [
          "obj-3",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-3",
          0
         ],
         "destination": [
          "obj-4",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-3",
          1
         ],
         "destination": [
          "obj-5",
          0
         ]
        }
       }
      ]
     },
     "id": "obj-2"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "plugout~",
     "numinlets": 2,
     "numoutlets": 0,
     "patching_rect": [
      20,
      520,
      62,
      22
     ],
     "id": "obj-3"
    }
   },
   {
    "box": {
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "background": 1,
     "presentation": 1,
     "patching_rect": [
      400,
      20,
      74,
      166
     ],
     "presentation_rect": [
      0,
      2,
      74,
      166
     ],
     "bgcolor": [
      0.125,
      0.125,
      0.135,
      1.0
     ],
     "border": 1,
     "bordercolor": [
      0.3,
      0.29,
      0.27,
      1.0
     ],
     "rounded": 6,
     "ignoreclick": 1,
     "id": "obj-4"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "GUITAR IN",
     "numinlets": 1,
     "numoutlets": 0,
     "presentation": 1,
     "patching_rect": [
      400,
      200,
      68,
      18
     ],
     "presentation_rect": [
      4,
      5,
      68,
      16
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "fontsize": 9.5,
     "fontface": 1,
     "fontname": "Arial Bold",
     "id": "obj-5"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "gtr_gain",
     "presentation": 1,
     "presentation_rect": [
      14.0,
      26,
      46,
      48
     ],
     "patching_rect": [
      20,
      120,
      44,
      48
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "activedialcolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "activeneedlecolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "IN Input",
       "parameter_shortname": "Input",
       "parameter_type": 0,
       "parameter_mmin": -24.0,
       "parameter_mmax": 24.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        0.0
       ],
       "parameter_unitstyle": 4
      }
     },
     "id": "obj-6"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "gtr_tone",
     "presentation": 1,
     "presentation_rect": [
      14.0,
      86,
      46,
      48
     ],
     "patching_rect": [
      115,
      120,
      44,
      48
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "activedialcolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "activeneedlecolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "IN Pickup",
       "parameter_shortname": "Pickup",
       "parameter_type": 0,
       "parameter_mmin": 1500.0,
       "parameter_mmax": 20000.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        6500.0
       ],
       "parameter_unitstyle": 3,
       "parameter_exponent": 2.0
      }
     },
     "id": "obj-7"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend gtr_gain",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      20,
      300,
      90,
      22
     ],
     "id": "obj-8"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend gtr_tone",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      115,
      300,
      90,
      22
     ],
     "id": "obj-9"
    }
   },
   {
    "box": {
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "background": 1,
     "presentation": 1,
     "patching_rect": [
      479,
      20,
      108,
      166
     ],
     "presentation_rect": [
      79,
      2,
      108,
      166
     ],
     "bgcolor": [
      0.165,
      0.155,
      0.15,
      1.0
     ],
     "border": 1,
     "bordercolor": [
      0.3,
      0.29,
      0.27,
      1.0
     ],
     "rounded": 6,
     "ignoreclick": 1,
     "id": "obj-10"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "DROP  pitch",
     "numinlets": 1,
     "numoutlets": 0,
     "presentation": 1,
     "patching_rect": [
      479,
      200,
      102,
      18
     ],
     "presentation_rect": [
      83,
      5,
      102,
      16
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "fontsize": 9.5,
     "fontface": 1,
     "fontname": "Arial Bold",
     "id": "obj-11"
    }
   },
   {
    "box": {
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "parameter_enable": 1,
     "mode": 1,
     "text": "OFF",
     "texton": "ON",
     "varname": "drop_on",
     "presentation": 1,
     "presentation_rect": [
      84,
      22,
      32,
      15
     ],
     "patching_rect": [
      210,
      120,
      40,
      15
     ],
     "activebgoncolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "textoncolor": [
      0.1,
      0.1,
      0.1,
      1.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "DROP On",
       "parameter_shortname": "Drop",
       "parameter_type": 2,
       "parameter_mmin": 0,
       "parameter_mmax": 1,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        1
       ],
       "parameter_enum": [
        "off",
        "on"
       ]
      }
     },
     "id": "obj-12"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "drop_semi",
     "presentation": 1,
     "presentation_rect": [
      85.0,
      42,
      46,
      48
     ],
     "patching_rect": [
      305,
      120,
      44,
      48
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "activedialcolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "activeneedlecolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "DROP Semis",
       "parameter_shortname": "Semis",
       "parameter_type": 1,
       "parameter_mmin": -24,
       "parameter_mmax": 12,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        -5
       ],
       "parameter_unitstyle": 7
      }
     },
     "id": "obj-13"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "drop_mix",
     "presentation": 1,
     "presentation_rect": [
      85.0,
      102,
      46,
      48
     ],
     "patching_rect": [
      400,
      120,
      44,
      48
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "activedialcolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "activeneedlecolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "DROP Blend",
       "parameter_shortname": "Blend",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        1.0
       ],
       "parameter_unitstyle": 5
      }
     },
     "id": "obj-14"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "drop_glide",
     "presentation": 1,
     "presentation_rect": [
      135.0,
      42,
      46,
      48
     ],
     "patching_rect": [
      495,
      120,
      44,
      48
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "activedialcolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "activeneedlecolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "DROP Glide",
       "parameter_shortname": "Glide",
       "parameter_type": 0,
       "parameter_mmin": 1.0,
       "parameter_mmax": 2000.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        30.0
       ],
       "parameter_unitstyle": 2,
       "parameter_exponent": 3.0
      }
     },
     "id": "obj-15"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "drop_grain",
     "presentation": 1,
     "presentation_rect": [
      135.0,
      102,
      46,
      48
     ],
     "patching_rect": [
      590,
      120,
      44,
      48
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "activedialcolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "activeneedlecolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "DROP Grain",
       "parameter_shortname": "Grain",
       "parameter_type": 0,
       "parameter_mmin": 15.0,
       "parameter_mmax": 100.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        55.0
       ],
       "parameter_unitstyle": 2
      }
     },
     "id": "obj-16"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend drop_on",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      210,
      300,
      90,
      22
     ],
     "id": "obj-17"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend drop_semi",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      305,
      300,
      90,
      22
     ],
     "id": "obj-18"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend drop_mix",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      400,
      300,
      90,
      22
     ],
     "id": "obj-19"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend drop_glide",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      495,
      300,
      90,
      22
     ],
     "id": "obj-20"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend drop_grain",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      590,
      300,
      90,
      22
     ],
     "id": "obj-21"
    }
   },
   {
    "box": {
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "background": 1,
     "presentation": 1,
     "patching_rect": [
      592,
      20,
      108,
      166
     ],
     "presentation_rect": [
      192,
      2,
      108,
      166
     ],
     "bgcolor": [
      0.125,
      0.125,
      0.135,
      1.0
     ],
     "border": 1,
     "bordercolor": [
      0.3,
      0.29,
      0.27,
      1.0
     ],
     "rounded": 6,
     "ignoreclick": 1,
     "id": "obj-22"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "CE-2W  vibe",
     "numinlets": 1,
     "numoutlets": 0,
     "presentation": 1,
     "patching_rect": [
      592,
      200,
      102,
      18
     ],
     "presentation_rect": [
      196,
      5,
      102,
      16
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "fontsize": 9.5,
     "fontface": 1,
     "fontname": "Arial Bold",
     "id": "obj-23"
    }
   },
   {
    "box": {
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "parameter_enable": 1,
     "mode": 1,
     "text": "OFF",
     "texton": "ON",
     "varname": "vibe_on",
     "presentation": 1,
     "presentation_rect": [
      197,
      22,
      32,
      15
     ],
     "patching_rect": [
      685,
      120,
      40,
      15
     ],
     "activebgoncolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "textoncolor": [
      0.1,
      0.1,
      0.1,
      1.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "VIBE On",
       "parameter_shortname": "Vibe",
       "parameter_type": 2,
       "parameter_mmin": 0,
       "parameter_mmax": 1,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        1
       ],
       "parameter_enum": [
        "off",
        "on"
       ]
      }
     },
     "id": "obj-24"
    }
   },
   {
    "box": {
     "maxclass": "live.tab",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "vibe_mode",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "presentation": 1,
     "presentation_rect": [
      233,
      22,
      62,
      15
     ],
     "patching_rect": [
      780,
      120,
      60,
      15
     ],
     "activebgoncolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "fontsize": 8.0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "VIBE Mode",
       "parameter_shortname": "Mode",
       "parameter_type": 2,
       "parameter_mmin": 0,
       "parameter_mmax": 1,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        1
       ],
       "parameter_enum": [
        "CHO",
        "VIB"
       ]
      }
     },
     "id": "obj-25"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "vibe_rate",
     "presentation": 1,
     "presentation_rect": [
      198.0,
      42,
      46,
      48
     ],
     "patching_rect": [
      875,
      120,
      44,
      48
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "activedialcolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "activeneedlecolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "VIBE Rate",
       "parameter_shortname": "Rate",
       "parameter_type": 0,
       "parameter_mmin": 0.05,
       "parameter_mmax": 10.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        0.7
       ],
       "parameter_unitstyle": 3,
       "parameter_exponent": 2.5
      }
     },
     "id": "obj-26"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "vibe_depth",
     "presentation": 1,
     "presentation_rect": [
      198.0,
      102,
      46,
      48
     ],
     "patching_rect": [
      970,
      120,
      44,
      48
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "activedialcolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "activeneedlecolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "VIBE Depth",
       "parameter_shortname": "Depth",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        0.25
       ],
       "parameter_unitstyle": 5
      }
     },
     "id": "obj-27"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "vibe_tone",
     "presentation": 1,
     "presentation_rect": [
      248.0,
      42,
      46,
      48
     ],
     "patching_rect": [
      1065,
      120,
      44,
      48
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "activedialcolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "activeneedlecolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "VIBE BBD",
       "parameter_shortname": "BBD",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        0.5
       ],
       "parameter_unitstyle": 5
      }
     },
     "id": "obj-28"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend vibe_on",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      685,
      300,
      90,
      22
     ],
     "id": "obj-29"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend vibe_mode",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      780,
      300,
      90,
      22
     ],
     "id": "obj-30"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend vibe_rate",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      875,
      300,
      90,
      22
     ],
     "id": "obj-31"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend vibe_depth",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      970,
      300,
      90,
      22
     ],
     "id": "obj-32"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend vibe_tone",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1065,
      300,
      90,
      22
     ],
     "id": "obj-33"
    }
   },
   {
    "box": {
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "background": 1,
     "presentation": 1,
     "patching_rect": [
      705,
      20,
      208,
      166
     ],
     "presentation_rect": [
      305,
      2,
      208,
      166
     ],
     "bgcolor": [
      0.165,
      0.155,
      0.15,
      1.0
     ],
     "border": 1,
     "bordercolor": [
      0.3,
      0.29,
      0.27,
      1.0
     ],
     "rounded": 6,
     "ignoreclick": 1,
     "id": "obj-34"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "PARA EQ",
     "numinlets": 1,
     "numoutlets": 0,
     "presentation": 1,
     "patching_rect": [
      705,
      200,
      202,
      18
     ],
     "presentation_rect": [
      309,
      5,
      202,
      16
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "fontsize": 9.5,
     "fontface": 1,
     "fontname": "Arial Bold",
     "id": "obj-35"
    }
   },
   {
    "box": {
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "parameter_enable": 1,
     "mode": 1,
     "text": "OFF",
     "texton": "ON",
     "varname": "eq_on",
     "presentation": 1,
     "presentation_rect": [
      310,
      22,
      32,
      15
     ],
     "patching_rect": [
      1160,
      120,
      40,
      15
     ],
     "activebgoncolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "textoncolor": [
      0.1,
      0.1,
      0.1,
      1.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "EQ On",
       "parameter_shortname": "EQ",
       "parameter_type": 2,
       "parameter_mmin": 0,
       "parameter_mmax": 1,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        1
       ],
       "parameter_enum": [
        "off",
        "on"
       ]
      }
     },
     "id": "obj-36"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "eq_lofreq",
     "presentation": 1,
     "presentation_rect": [
      311.0,
      42,
      46,
      48
     ],
     "patching_rect": [
      1255,
      120,
      44,
      48
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "activedialcolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "activeneedlecolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "EQ LoFreq",
       "parameter_shortname": "LoFreq",
       "parameter_type": 0,
       "parameter_mmin": 40.0,
       "parameter_mmax": 800.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        200.0
       ],
       "parameter_unitstyle": 3,
       "parameter_exponent": 2.0
      }
     },
     "id": "obj-37"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "eq_logain",
     "presentation": 1,
     "presentation_rect": [
      311.0,
      102,
      46,
      48
     ],
     "patching_rect": [
      1350,
      120,
      44,
      48
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "activedialcolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "activeneedlecolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "EQ LoGain",
       "parameter_shortname": "LoGain",
       "parameter_type": 0,
       "parameter_mmin": -15.0,
       "parameter_mmax": 15.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        -2.0
       ],
       "parameter_unitstyle": 4
      }
     },
     "id": "obj-38"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "eq_midfreq",
     "presentation": 1,
     "presentation_rect": [
      361.0,
      42,
      46,
      48
     ],
     "patching_rect": [
      1445,
      120,
      44,
      48
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "activedialcolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "activeneedlecolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "EQ MidFreq",
       "parameter_shortname": "MidFreq",
       "parameter_type": 0,
       "parameter_mmin": 200.0,
       "parameter_mmax": 6000.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        1200.0
       ],
       "parameter_unitstyle": 3,
       "parameter_exponent": 2.5
      }
     },
     "id": "obj-39"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "eq_midgain",
     "presentation": 1,
     "presentation_rect": [
      361.0,
      102,
      46,
      48
     ],
     "patching_rect": [
      1540,
      120,
      44,
      48
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "activedialcolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "activeneedlecolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "EQ MidGain",
       "parameter_shortname": "MidGain",
       "parameter_type": 0,
       "parameter_mmin": -15.0,
       "parameter_mmax": 15.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        2.0
       ],
       "parameter_unitstyle": 4
      }
     },
     "id": "obj-40"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "eq_hifreq",
     "presentation": 1,
     "presentation_rect": [
      411.0,
      42,
      46,
      48
     ],
     "patching_rect": [
      1635,
      120,
      44,
      48
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "activedialcolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "activeneedlecolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "EQ HiFreq",
       "parameter_shortname": "HiFreq",
       "parameter_type": 0,
       "parameter_mmin": 1500.0,
       "parameter_mmax": 16000.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        6000.0
       ],
       "parameter_unitstyle": 3,
       "parameter_exponent": 2.0
      }
     },
     "id": "obj-41"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "eq_higain",
     "presentation": 1,
     "presentation_rect": [
      411.0,
      102,
      46,
      48
     ],
     "patching_rect": [
      1730,
      120,
      44,
      48
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "activedialcolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "activeneedlecolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "EQ HiGain",
       "parameter_shortname": "HiGain",
       "parameter_type": 0,
       "parameter_mmin": -15.0,
       "parameter_mmax": 15.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        -3.0
       ],
       "parameter_unitstyle": 4
      }
     },
     "id": "obj-42"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "eq_lowcut",
     "presentation": 1,
     "presentation_rect": [
      461.0,
      42,
      46,
      48
     ],
     "patching_rect": [
      1825,
      120,
      44,
      48
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "activedialcolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "activeneedlecolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "EQ LowCut",
       "parameter_shortname": "LowCut",
       "parameter_type": 0,
       "parameter_mmin": 20.0,
       "parameter_mmax": 400.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        70.0
       ],
       "parameter_unitstyle": 3,
       "parameter_exponent": 2.0
      }
     },
     "id": "obj-43"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "eq_midq",
     "presentation": 1,
     "presentation_rect": [
      461.0,
      102,
      46,
      48
     ],
     "patching_rect": [
      1920,
      120,
      44,
      48
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "activedialcolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "activeneedlecolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "EQ MidQ",
       "parameter_shortname": "MidQ",
       "parameter_type": 0,
       "parameter_mmin": 0.2,
       "parameter_mmax": 6.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        0.8
       ],
       "parameter_unitstyle": 1,
       "parameter_exponent": 2.0
      }
     },
     "id": "obj-44"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend eq_on",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1160,
      300,
      90,
      22
     ],
     "id": "obj-45"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend eq_lofreq",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1255,
      300,
      90,
      22
     ],
     "id": "obj-46"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend eq_logain",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1350,
      300,
      90,
      22
     ],
     "id": "obj-47"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend eq_midfreq",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1445,
      300,
      90,
      22
     ],
     "id": "obj-48"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend eq_midgain",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1540,
      300,
      90,
      22
     ],
     "id": "obj-49"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend eq_hifreq",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1635,
      300,
      90,
      22
     ],
     "id": "obj-50"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend eq_higain",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1730,
      300,
      90,
      22
     ],
     "id": "obj-51"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend eq_lowcut",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1825,
      300,
      90,
      22
     ],
     "id": "obj-52"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend eq_midq",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1920,
      300,
      90,
      22
     ],
     "id": "obj-53"
    }
   },
   {
    "box": {
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "background": 1,
     "presentation": 1,
     "patching_rect": [
      918,
      20,
      158,
      166
     ],
     "presentation_rect": [
      518,
      2,
      158,
      166
     ],
     "bgcolor": [
      0.125,
      0.125,
      0.135,
      1.0
     ],
     "border": 1,
     "bordercolor": [
      0.3,
      0.29,
      0.27,
      1.0
     ],
     "rounded": 6,
     "ignoreclick": 1,
     "id": "obj-54"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "REVERB-X  fuzz verb",
     "numinlets": 1,
     "numoutlets": 0,
     "presentation": 1,
     "patching_rect": [
      918,
      200,
      152,
      18
     ],
     "presentation_rect": [
      522,
      5,
      152,
      16
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "fontsize": 9.5,
     "fontface": 1,
     "fontname": "Arial Bold",
     "id": "obj-55"
    }
   },
   {
    "box": {
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "parameter_enable": 1,
     "mode": 1,
     "text": "OFF",
     "texton": "ON",
     "varname": "verb_on",
     "presentation": 1,
     "presentation_rect": [
      523,
      22,
      32,
      15
     ],
     "patching_rect": [
      2015,
      120,
      40,
      15
     ],
     "activebgoncolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "textoncolor": [
      0.1,
      0.1,
      0.1,
      1.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "VERB On",
       "parameter_shortname": "Verb",
       "parameter_type": 2,
       "parameter_mmin": 0,
       "parameter_mmax": 1,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        1
       ],
       "parameter_enum": [
        "off",
        "on"
       ]
      }
     },
     "id": "obj-56"
    }
   },
   {
    "box": {
     "maxclass": "live.tab",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "verb_pos",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "presentation": 1,
     "presentation_rect": [
      559,
      22,
      112,
      15
     ],
     "patching_rect": [
      2110,
      120,
      60,
      15
     ],
     "activebgoncolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "fontsize": 8.0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "VERB VerbPos",
       "parameter_shortname": "VerbPos",
       "parameter_type": 2,
       "parameter_mmin": 0,
       "parameter_mmax": 1,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        0
       ],
       "parameter_enum": [
        "PRE",
        "POST"
       ]
      }
     },
     "id": "obj-57"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "verb_decay",
     "presentation": 1,
     "presentation_rect": [
      524.0,
      42,
      46,
      48
     ],
     "patching_rect": [
      2205,
      120,
      44,
      48
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "activedialcolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "activeneedlecolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "VERB Decay",
       "parameter_shortname": "Decay",
       "parameter_type": 0,
       "parameter_mmin": 0.1,
       "parameter_mmax": 8.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        1.2
       ],
       "parameter_unitstyle": 1,
       "parameter_exponent": 2.5
      }
     },
     "id": "obj-58"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "verb_size",
     "presentation": 1,
     "presentation_rect": [
      524.0,
      102,
      46,
      48
     ],
     "patching_rect": [
      2300,
      120,
      44,
      48
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "activedialcolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "activeneedlecolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "VERB Size",
       "parameter_shortname": "Size",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        0.4
       ],
       "parameter_unitstyle": 5
      }
     },
     "id": "obj-59"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "verb_tone",
     "presentation": 1,
     "presentation_rect": [
      574.0,
      42,
      46,
      48
     ],
     "patching_rect": [
      2395,
      120,
      44,
      48
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "activedialcolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "activeneedlecolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "VERB Tone",
       "parameter_shortname": "Tone",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        0.4
       ],
       "parameter_unitstyle": 5
      }
     },
     "id": "obj-60"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "verb_fuzz",
     "presentation": 1,
     "presentation_rect": [
      574.0,
      102,
      46,
      48
     ],
     "patching_rect": [
      2490,
      120,
      44,
      48
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "activedialcolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "activeneedlecolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "VERB Fuzz",
       "parameter_shortname": "Fuzz",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        0.35
       ],
       "parameter_unitstyle": 5
      }
     },
     "id": "obj-61"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "verb_mix",
     "presentation": 1,
     "presentation_rect": [
      624.0,
      42,
      46,
      48
     ],
     "patching_rect": [
      2585,
      120,
      44,
      48
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "activedialcolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "activeneedlecolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "VERB VMix",
       "parameter_shortname": "VMix",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        0.25
       ],
       "parameter_unitstyle": 5
      }
     },
     "id": "obj-62"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend verb_on",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2015,
      300,
      90,
      22
     ],
     "id": "obj-63"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend verb_pos",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2110,
      300,
      90,
      22
     ],
     "id": "obj-64"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend verb_decay",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2205,
      300,
      90,
      22
     ],
     "id": "obj-65"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend verb_size",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2300,
      300,
      90,
      22
     ],
     "id": "obj-66"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend verb_tone",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2395,
      300,
      90,
      22
     ],
     "id": "obj-67"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend verb_fuzz",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2490,
      300,
      90,
      22
     ],
     "id": "obj-68"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend verb_mix",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2585,
      300,
      90,
      22
     ],
     "id": "obj-69"
    }
   },
   {
    "box": {
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "background": 1,
     "presentation": 1,
     "patching_rect": [
      1081,
      20,
      158,
      166
     ],
     "presentation_rect": [
      681,
      2,
      158,
      166
     ],
     "bgcolor": [
      0.165,
      0.155,
      0.15,
      1.0
     ],
     "border": 1,
     "bordercolor": [
      0.3,
      0.29,
      0.27,
      1.0
     ],
     "rounded": 6,
     "ignoreclick": 1,
     "id": "obj-70"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "DD-20  echo",
     "numinlets": 1,
     "numoutlets": 0,
     "presentation": 1,
     "patching_rect": [
      1081,
      200,
      152,
      18
     ],
     "presentation_rect": [
      685,
      5,
      152,
      16
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "fontsize": 9.5,
     "fontface": 1,
     "fontname": "Arial Bold",
     "id": "obj-71"
    }
   },
   {
    "box": {
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "parameter_enable": 1,
     "mode": 1,
     "text": "OFF",
     "texton": "ON",
     "varname": "echo_on",
     "presentation": 1,
     "presentation_rect": [
      686,
      22,
      32,
      15
     ],
     "patching_rect": [
      2680,
      120,
      40,
      15
     ],
     "activebgoncolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "textoncolor": [
      0.1,
      0.1,
      0.1,
      1.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "ECHO On",
       "parameter_shortname": "Echo",
       "parameter_type": 2,
       "parameter_mmin": 0,
       "parameter_mmax": 1,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        0
       ],
       "parameter_enum": [
        "off",
        "on"
       ]
      }
     },
     "id": "obj-72"
    }
   },
   {
    "box": {
     "maxclass": "live.tab",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "echo_pos",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "presentation": 1,
     "presentation_rect": [
      722,
      22,
      112,
      15
     ],
     "patching_rect": [
      2775,
      120,
      60,
      15
     ],
     "activebgoncolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "fontsize": 8.0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "ECHO EchoPos",
       "parameter_shortname": "EchoPos",
       "parameter_type": 2,
       "parameter_mmin": 0,
       "parameter_mmax": 1,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        1
       ],
       "parameter_enum": [
        "PRE",
        "POST"
       ]
      }
     },
     "id": "obj-73"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "echo_time",
     "presentation": 1,
     "presentation_rect": [
      687.0,
      42,
      46,
      48
     ],
     "patching_rect": [
      2870,
      120,
      44,
      48
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "activedialcolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "activeneedlecolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "ECHO Time",
       "parameter_shortname": "Time",
       "parameter_type": 0,
       "parameter_mmin": 20.0,
       "parameter_mmax": 2000.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        380.0
       ],
       "parameter_unitstyle": 2,
       "parameter_exponent": 2.0
      }
     },
     "id": "obj-74"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "echo_fb",
     "presentation": 1,
     "presentation_rect": [
      687.0,
      102,
      46,
      48
     ],
     "patching_rect": [
      2965,
      120,
      44,
      48
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "activedialcolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "activeneedlecolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "ECHO Repeats",
       "parameter_shortname": "Repeats",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.05,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        0.3
       ],
       "parameter_unitstyle": 5
      }
     },
     "id": "obj-75"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "echo_tone",
     "presentation": 1,
     "presentation_rect": [
      737.0,
      42,
      46,
      48
     ],
     "patching_rect": [
      3060,
      120,
      44,
      48
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "activedialcolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "activeneedlecolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "ECHO ETone",
       "parameter_shortname": "ETone",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        0.45
       ],
       "parameter_unitstyle": 5
      }
     },
     "id": "obj-76"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "echo_wob",
     "presentation": 1,
     "presentation_rect": [
      737.0,
      102,
      46,
      48
     ],
     "patching_rect": [
      3155,
      120,
      44,
      48
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "activedialcolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "activeneedlecolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "ECHO Wobble",
       "parameter_shortname": "Wobble",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        0.2
       ],
       "parameter_unitstyle": 5
      }
     },
     "id": "obj-77"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "echo_pp",
     "presentation": 1,
     "presentation_rect": [
      787.0,
      42,
      46,
      48
     ],
     "patching_rect": [
      3250,
      120,
      44,
      48
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "activedialcolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "activeneedlecolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "ECHO PingPong",
       "parameter_shortname": "PingPong",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        0.0
       ],
       "parameter_unitstyle": 5
      }
     },
     "id": "obj-78"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "echo_mix",
     "presentation": 1,
     "presentation_rect": [
      787.0,
      102,
      46,
      48
     ],
     "patching_rect": [
      3345,
      120,
      44,
      48
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "activedialcolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "activeneedlecolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "ECHO EMix",
       "parameter_shortname": "EMix",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        0.2
       ],
       "parameter_unitstyle": 5
      }
     },
     "id": "obj-79"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend echo_on",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2680,
      300,
      90,
      22
     ],
     "id": "obj-80"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend echo_pos",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2775,
      300,
      90,
      22
     ],
     "id": "obj-81"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend echo_time",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2870,
      300,
      90,
      22
     ],
     "id": "obj-82"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend echo_fb",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2965,
      300,
      90,
      22
     ],
     "id": "obj-83"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend echo_tone",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      3060,
      300,
      90,
      22
     ],
     "id": "obj-84"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend echo_wob",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      3155,
      300,
      90,
      22
     ],
     "id": "obj-85"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend echo_pp",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      3250,
      300,
      90,
      22
     ],
     "id": "obj-86"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend echo_mix",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      3345,
      300,
      90,
      22
     ],
     "id": "obj-87"
    }
   },
   {
    "box": {
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "background": 1,
     "presentation": 1,
     "patching_rect": [
      1244,
      20,
      158,
      166
     ],
     "presentation_rect": [
      844,
      2,
      158,
      166
     ],
     "bgcolor": [
      0.125,
      0.125,
      0.135,
      1.0
     ],
     "border": 1,
     "bordercolor": [
      0.3,
      0.29,
      0.27,
      1.0
     ],
     "rounded": 6,
     "ignoreclick": 1,
     "id": "obj-88"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "TASCAM 424  preamp",
     "numinlets": 1,
     "numoutlets": 0,
     "presentation": 1,
     "patching_rect": [
      1244,
      200,
      152,
      18
     ],
     "presentation_rect": [
      848,
      5,
      152,
      16
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "fontsize": 9.5,
     "fontface": 1,
     "fontname": "Arial Bold",
     "id": "obj-89"
    }
   },
   {
    "box": {
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "parameter_enable": 1,
     "mode": 1,
     "text": "OFF",
     "texton": "ON",
     "varname": "pre_on",
     "presentation": 1,
     "presentation_rect": [
      849,
      22,
      32,
      15
     ],
     "patching_rect": [
      3440,
      120,
      40,
      15
     ],
     "activebgoncolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "textoncolor": [
      0.1,
      0.1,
      0.1,
      1.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "424 On",
       "parameter_shortname": "424",
       "parameter_type": 2,
       "parameter_mmin": 0,
       "parameter_mmax": 1,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        1
       ],
       "parameter_enum": [
        "off",
        "on"
       ]
      }
     },
     "id": "obj-90"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "pre_trim",
     "presentation": 1,
     "presentation_rect": [
      850.0,
      42,
      46,
      48
     ],
     "patching_rect": [
      3535,
      120,
      44,
      48
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "activedialcolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "activeneedlecolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "424 Trim",
       "parameter_shortname": "Trim",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 48.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        22.0
       ],
       "parameter_unitstyle": 4
      }
     },
     "id": "obj-91"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "pre_fader",
     "presentation": 1,
     "presentation_rect": [
      850.0,
      102,
      46,
      48
     ],
     "patching_rect": [
      3630,
      120,
      44,
      48
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "activedialcolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "activeneedlecolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "424 Fader",
       "parameter_shortname": "Fader",
       "parameter_type": 0,
       "parameter_mmin": -12.0,
       "parameter_mmax": 24.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        6.0
       ],
       "parameter_unitstyle": 4
      }
     },
     "id": "obj-92"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "pre_bass",
     "presentation": 1,
     "presentation_rect": [
      900.0,
      42,
      46,
      48
     ],
     "patching_rect": [
      3725,
      120,
      44,
      48
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "activedialcolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "activeneedlecolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "424 Bass",
       "parameter_shortname": "Bass",
       "parameter_type": 0,
       "parameter_mmin": -12.0,
       "parameter_mmax": 12.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        -2.0
       ],
       "parameter_unitstyle": 4
      }
     },
     "id": "obj-93"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "pre_treble",
     "presentation": 1,
     "presentation_rect": [
      900.0,
      102,
      46,
      48
     ],
     "patching_rect": [
      3820,
      120,
      44,
      48
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "activedialcolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "activeneedlecolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "424 Treble",
       "parameter_shortname": "Treble",
       "parameter_type": 0,
       "parameter_mmin": -12.0,
       "parameter_mmax": 12.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        1.0
       ],
       "parameter_unitstyle": 4
      }
     },
     "id": "obj-94"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "pre_mid",
     "presentation": 1,
     "presentation_rect": [
      950.0,
      42,
      46,
      48
     ],
     "patching_rect": [
      3915,
      120,
      44,
      48
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "activedialcolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "activeneedlecolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "424 Voice",
       "parameter_shortname": "Voice",
       "parameter_type": 0,
       "parameter_mmin": -6.0,
       "parameter_mmax": 9.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        2.5
       ],
       "parameter_unitstyle": 4
      }
     },
     "id": "obj-95"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "pre_level",
     "presentation": 1,
     "presentation_rect": [
      950.0,
      102,
      46,
      48
     ],
     "patching_rect": [
      4010,
      120,
      44,
      48
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "activedialcolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "activeneedlecolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "424 Level",
       "parameter_shortname": "Level",
       "parameter_type": 0,
       "parameter_mmin": -24.0,
       "parameter_mmax": 12.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        0.0
       ],
       "parameter_unitstyle": 4
      }
     },
     "id": "obj-96"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend pre_on",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      3440,
      300,
      90,
      22
     ],
     "id": "obj-97"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend pre_trim",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      3535,
      300,
      90,
      22
     ],
     "id": "obj-98"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend pre_fader",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      3630,
      300,
      90,
      22
     ],
     "id": "obj-99"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend pre_bass",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      3725,
      300,
      90,
      22
     ],
     "id": "obj-100"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend pre_treble",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      3820,
      300,
      90,
      22
     ],
     "id": "obj-101"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend pre_mid",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      3915,
      300,
      90,
      22
     ],
     "id": "obj-102"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend pre_level",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      4010,
      300,
      90,
      22
     ],
     "id": "obj-103"
    }
   },
   {
    "box": {
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "background": 1,
     "presentation": 1,
     "patching_rect": [
      1407,
      20,
      158,
      166
     ],
     "presentation_rect": [
      1007,
      2,
      158,
      166
     ],
     "bgcolor": [
      0.165,
      0.155,
      0.15,
      1.0
     ],
     "border": 1,
     "bordercolor": [
      0.3,
      0.29,
      0.27,
      1.0
     ],
     "rounded": 6,
     "ignoreclick": 1,
     "id": "obj-104"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "CASSETTE",
     "numinlets": 1,
     "numoutlets": 0,
     "presentation": 1,
     "patching_rect": [
      1407,
      200,
      152,
      18
     ],
     "presentation_rect": [
      1011,
      5,
      152,
      16
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "fontsize": 9.5,
     "fontface": 1,
     "fontname": "Arial Bold",
     "id": "obj-105"
    }
   },
   {
    "box": {
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "parameter_enable": 1,
     "mode": 1,
     "text": "OFF",
     "texton": "ON",
     "varname": "tape_on",
     "presentation": 1,
     "presentation_rect": [
      1012,
      22,
      32,
      15
     ],
     "patching_rect": [
      4105,
      120,
      40,
      15
     ],
     "activebgoncolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "textoncolor": [
      0.1,
      0.1,
      0.1,
      1.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "TAPE On",
       "parameter_shortname": "Tape",
       "parameter_type": 2,
       "parameter_mmin": 0,
       "parameter_mmax": 1,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        1
       ],
       "parameter_enum": [
        "off",
        "on"
       ]
      }
     },
     "id": "obj-106"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "tape_wow",
     "presentation": 1,
     "presentation_rect": [
      1013.0,
      42,
      46,
      48
     ],
     "patching_rect": [
      4200,
      120,
      44,
      48
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "activedialcolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "activeneedlecolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "TAPE Wow",
       "parameter_shortname": "Wow",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        0.3
       ],
       "parameter_unitstyle": 5
      }
     },
     "id": "obj-107"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "tape_flutter",
     "presentation": 1,
     "presentation_rect": [
      1013.0,
      102,
      46,
      48
     ],
     "patching_rect": [
      4295,
      120,
      44,
      48
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "activedialcolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "activeneedlecolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "TAPE Flutter",
       "parameter_shortname": "Flutter",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        0.25
       ],
       "parameter_unitstyle": 5
      }
     },
     "id": "obj-108"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "tape_sat",
     "presentation": 1,
     "presentation_rect": [
      1063.0,
      42,
      46,
      48
     ],
     "patching_rect": [
      4390,
      120,
      44,
      48
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "activedialcolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "activeneedlecolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "TAPE Sat",
       "parameter_shortname": "Sat",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        0.35
       ],
       "parameter_unitstyle": 5
      }
     },
     "id": "obj-109"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "tape_hiss",
     "presentation": 1,
     "presentation_rect": [
      1063.0,
      102,
      46,
      48
     ],
     "patching_rect": [
      4485,
      120,
      44,
      48
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "activedialcolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "activeneedlecolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "TAPE Hiss",
       "parameter_shortname": "Hiss",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        0.15
       ],
       "parameter_unitstyle": 5
      }
     },
     "id": "obj-110"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "tape_age",
     "presentation": 1,
     "presentation_rect": [
      1113.0,
      42,
      46,
      48
     ],
     "patching_rect": [
      4580,
      120,
      44,
      48
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "activedialcolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "activeneedlecolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "TAPE Age",
       "parameter_shortname": "Age",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        0.4
       ],
       "parameter_unitstyle": 5
      }
     },
     "id": "obj-111"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "tape_drop",
     "presentation": 1,
     "presentation_rect": [
      1113.0,
      102,
      46,
      48
     ],
     "patching_rect": [
      4675,
      120,
      44,
      48
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "activedialcolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "activeneedlecolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "TAPE Dropout",
       "parameter_shortname": "Dropout",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        0.05
       ],
       "parameter_unitstyle": 5
      }
     },
     "id": "obj-112"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend tape_on",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      4105,
      300,
      90,
      22
     ],
     "id": "obj-113"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend tape_wow",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      4200,
      300,
      90,
      22
     ],
     "id": "obj-114"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend tape_flutter",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      4295,
      300,
      90,
      22
     ],
     "id": "obj-115"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend tape_sat",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      4390,
      300,
      90,
      22
     ],
     "id": "obj-116"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend tape_hiss",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      4485,
      300,
      90,
      22
     ],
     "id": "obj-117"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend tape_age",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      4580,
      300,
      90,
      22
     ],
     "id": "obj-118"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend tape_drop",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      4675,
      300,
      90,
      22
     ],
     "id": "obj-119"
    }
   },
   {
    "box": {
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "background": 1,
     "presentation": 1,
     "patching_rect": [
      1570,
      20,
      108,
      166
     ],
     "presentation_rect": [
      1170,
      2,
      108,
      166
     ],
     "bgcolor": [
      0.125,
      0.125,
      0.135,
      1.0
     ],
     "border": 1,
     "bordercolor": [
      0.3,
      0.29,
      0.27,
      1.0
     ],
     "rounded": 6,
     "ignoreclick": 1,
     "id": "obj-120"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "OUT",
     "numinlets": 1,
     "numoutlets": 0,
     "presentation": 1,
     "patching_rect": [
      1570,
      200,
      102,
      18
     ],
     "presentation_rect": [
      1174,
      5,
      102,
      16
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "fontsize": 9.5,
     "fontface": 1,
     "fontname": "Arial Bold",
     "id": "obj-121"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "out_mix",
     "presentation": 1,
     "presentation_rect": [
      1176.0,
      26,
      46,
      48
     ],
     "patching_rect": [
      4770,
      120,
      44,
      48
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "activedialcolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "activeneedlecolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "OUT Dry/Wet",
       "parameter_shortname": "Dry/Wet",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        1.0
       ],
       "parameter_unitstyle": 5
      }
     },
     "id": "obj-122"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "out_width",
     "presentation": 1,
     "presentation_rect": [
      1176.0,
      86,
      46,
      48
     ],
     "patching_rect": [
      4865,
      120,
      44,
      48
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "activedialcolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "activeneedlecolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "OUT Width",
       "parameter_shortname": "Width",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 2.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        1.0
       ],
       "parameter_unitstyle": 5
      }
     },
     "id": "obj-123"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "out_gain",
     "presentation": 1,
     "presentation_rect": [
      1226.0,
      26,
      46,
      48
     ],
     "patching_rect": [
      4960,
      120,
      44,
      48
     ],
     "textcolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "activedialcolor": [
      0.91,
      0.45,
      0.2,
      1.0
     ],
     "activeneedlecolor": [
      0.93,
      0.89,
      0.78,
      1.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "OUT Output",
       "parameter_shortname": "Output",
       "parameter_type": 0,
       "parameter_mmin": -24.0,
       "parameter_mmax": 12.0,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        0.0
       ],
       "parameter_unitstyle": 4
      }
     },
     "id": "obj-124"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend out_mix",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      4770,
      300,
      90,
      22
     ],
     "id": "obj-125"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend out_width",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      4865,
      300,
      90,
      22
     ],
     "id": "obj-126"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend out_gain",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      4960,
      300,
      90,
      22
     ],
     "id": "obj-127"
    }
   }
  ],
  "lines": [
   {
    "patchline": {
     "source": [
      "obj-1",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-1",
      1
     ],
     "destination": [
      "obj-2",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-2",
      0
     ],
     "destination": [
      "obj-3",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-2",
      1
     ],
     "destination": [
      "obj-3",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-6",
      0
     ],
     "destination": [
      "obj-8",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-8",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-7",
      0
     ],
     "destination": [
      "obj-9",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-9",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-12",
      0
     ],
     "destination": [
      "obj-17",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-17",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-13",
      0
     ],
     "destination": [
      "obj-18",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-18",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-14",
      0
     ],
     "destination": [
      "obj-19",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-19",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-15",
      0
     ],
     "destination": [
      "obj-20",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-20",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-16",
      0
     ],
     "destination": [
      "obj-21",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-21",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-24",
      0
     ],
     "destination": [
      "obj-29",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-29",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-25",
      0
     ],
     "destination": [
      "obj-30",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-30",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-26",
      0
     ],
     "destination": [
      "obj-31",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-31",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-27",
      0
     ],
     "destination": [
      "obj-32",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-32",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-28",
      0
     ],
     "destination": [
      "obj-33",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-33",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-36",
      0
     ],
     "destination": [
      "obj-45",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-45",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-37",
      0
     ],
     "destination": [
      "obj-46",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-46",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-38",
      0
     ],
     "destination": [
      "obj-47",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-47",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-39",
      0
     ],
     "destination": [
      "obj-48",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-48",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-40",
      0
     ],
     "destination": [
      "obj-49",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-49",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-41",
      0
     ],
     "destination": [
      "obj-50",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-50",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-42",
      0
     ],
     "destination": [
      "obj-51",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-51",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-43",
      0
     ],
     "destination": [
      "obj-52",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-52",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-44",
      0
     ],
     "destination": [
      "obj-53",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-53",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-56",
      0
     ],
     "destination": [
      "obj-63",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-63",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-57",
      0
     ],
     "destination": [
      "obj-64",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-64",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-58",
      0
     ],
     "destination": [
      "obj-65",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-65",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-59",
      0
     ],
     "destination": [
      "obj-66",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-66",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-60",
      0
     ],
     "destination": [
      "obj-67",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-67",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-61",
      0
     ],
     "destination": [
      "obj-68",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-68",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-62",
      0
     ],
     "destination": [
      "obj-69",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-69",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-72",
      0
     ],
     "destination": [
      "obj-80",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-80",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-73",
      0
     ],
     "destination": [
      "obj-81",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-81",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-74",
      0
     ],
     "destination": [
      "obj-82",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-82",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-75",
      0
     ],
     "destination": [
      "obj-83",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-83",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-76",
      0
     ],
     "destination": [
      "obj-84",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-84",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-77",
      0
     ],
     "destination": [
      "obj-85",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-85",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-78",
      0
     ],
     "destination": [
      "obj-86",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-86",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-79",
      0
     ],
     "destination": [
      "obj-87",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-87",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-90",
      0
     ],
     "destination": [
      "obj-97",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-97",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-91",
      0
     ],
     "destination": [
      "obj-98",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-98",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-92",
      0
     ],
     "destination": [
      "obj-99",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-99",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-93",
      0
     ],
     "destination": [
      "obj-100",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-100",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-94",
      0
     ],
     "destination": [
      "obj-101",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-101",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-95",
      0
     ],
     "destination": [
      "obj-102",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-102",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-96",
      0
     ],
     "destination": [
      "obj-103",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-103",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-106",
      0
     ],
     "destination": [
      "obj-113",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-113",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-107",
      0
     ],
     "destination": [
      "obj-114",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-114",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-108",
      0
     ],
     "destination": [
      "obj-115",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-115",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-109",
      0
     ],
     "destination": [
      "obj-116",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-116",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-110",
      0
     ],
     "destination": [
      "obj-117",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-117",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-111",
      0
     ],
     "destination": [
      "obj-118",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-118",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-112",
      0
     ],
     "destination": [
      "obj-119",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-119",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-122",
      0
     ],
     "destination": [
      "obj-125",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-125",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-123",
      0
     ],
     "destination": [
      "obj-126",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-126",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-124",
      0
     ],
     "destination": [
      "obj-127",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-127",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   }
  ],
  "dependency_cache": [],
  "latency": 0,
  "is_mpe": 0,
  "external_mpe_tuning_enabled": 0,
  "minimum_live_version": "",
  "minimum_max_version": "",
  "platform_compatibility": 0,
  "autosave": 0,
  "devicewidth": 1278.0,
  "description": "Mk.gee-style guitar rig: Drop > CE-2W > ParaEq > Reverb-X / DD-20 > Tascam 424 > cassette"
 }
}