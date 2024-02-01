let { tap, hold, td, combo, macro, ..} = import "../../../fak/keycode.ncl" in

# convenience aliases
# taps
let kc = tap.reg.kc in
let ks = tap.reg.ks in
let md = tap.reg.mod in
# holds
# let kch = hold.reg.kc in
# let ksh = hold.reg.ks in
let mdh = hold.reg.mod in
# sticky key
let sk = tap.sticky.mod in
# layer control
let lt = hold.reg.layer in
# boot, reset, etc
let fak = tap.custom.fak in
# media and mouse control
let media = tap.custom.media in
let mouse = tap.custom.mouse in
# keymap stuff
let tx = tap.none in
let tt = tap.trans in
let hx = hold.none in
let ht = hold.trans in

let hrm_behavior = {
  timeout_ms = 150,
  timeout_decision = 'hold,
} in

let cu = {
  # copy custom stuff from example
  UNDO = md.lctl & kc.Z,
  COPY = md.lctl & kc.C,
  PSTE = md.lctl & kc.V,
  CUT  = md.lctl & kc.X,
  SCH  = macro.make [
    macro.tap kc.S,
    macro.release mdh.rsft,
    macro.tap kc.C,
    macro.tap kc.H,
  ]
} in

# TODO: idea: make umlauts by tap-then-tap-and-holding the respective vowels
#let TD = {
#  let AE = td.make 200 [
#    kc.A,
#    kc.A & mdh.ralt & hold.reg.kc.A,
#  ] in
#  let OE = td.make 200 [
#    kc.O,
#    kc.O & mdh.ralt & hold.reg.kc.O,
#  ] in
#  let UE = td.make 200 [
#    kc.U,
#    kc.U & mdh.ralt & hold.reg.kc.U,
#  ] in
#  let SZ = td.make 200 [
#    kc.S,
#    kc.S & mdh.ralt & hold.reg.kc.S,
#  ] in
#} in

# layer taps
let ltExt = lt 1 in
let ltNum = lt 2 in
let ltFun = lt 3 in
let ltSym = lt 4 in

let combos_base = [
  # left side, top row
  kc.Q,
  # right side, top row
  kc.SLSH, kc.MINS,# kc.SCLN,
  ks.COLN,
  # left side, middle row
  ks.LCBR, kc.LBRC, ks.LPRN, kc.G, 
  # right side, middle row
  kc.Y, ks.RPRN, kc.RBRC, ks.RCBR,
  # left side, bottom row
  kc.Z, kc.ESC,  
  # right side, bottom row
  kc.BSPC, kc.DEL,
  # extras
  # fak.CWTG, kc.CAPS_LOCK,
  ltNum, ltFun,
] in

### Keymap itself! ###
{
  virtual_keys = [
    # alpha
    combo.make 25 [0, 1], # Q
    # sym
    combo.make 25 [21, 22], # SLSH
    combo.make 25 [20, 21], # MINS
    # combo.make 25 [6, 7], # SEMI
    combo.make 25 [14, 15], # COLON
    # parentheticals
    combo.make 25 [0, 9],  # {
    combo.make 25 [1, 10], # [
    combo.make 25 [2, 11], # (
    combo.make 25 [3, 12], # G
    # combo.make 25 [3, 12], # <
    # combo.make 25 [4, 13], # >
    combo.make 25 [4, 13], # Y
    combo.make 25 [5, 14], # )
    combo.make 25 [6, 15], # ]
    combo.make 25 [7, 16], # }
    # nav
    combo.make 25 [16, 17], # Z
    combo.make 25 [18, 19], # ESC
    # combo.make 25 [20, 23], # ENT
    combo.make 25 [5, 6], # BSPC
    combo.make 25 [6, 7], # DEL
    # combo.make 25 [5, 7], # C-BSPC
    # caps
    # combo.make 25 [11, 14], # caps word
    # combo.make 25 [0, 7], # caps lock
    # layer
    combo.make 25 [25, 27], # layer NUM
    combo.make 25 [24, 27], # layer FUN
  ],
  layers = [
    # ALPHAS
    [
               kc.D,    kc.R,    kc.W,   kc.B,        kc.J,    kc.F,    kc.U,    kc.P,
      kc.A,    kc.S,   kc.H,     kc.T,   kc.V,        kc.K,    kc.N,    kc.E,    kc.O,    kc.I,
               kc.X,    kc.M,    kc.C,                  kc.L,  kc.COMM, kc.DOT,
                   ltExt,   md.lsft,                  kc.SPACE,   ltSym,
    ] @ combos_base,
    # EXT
    [
                  kc.ESC,      tx & hx,     tx & hx,    cu.PSTE,        kc.PGUP,    kc.HOME,    kc.DEL,  kc.END,
      sk.lalt,    sk.lgui,     sk.lsft,     sk.lctl,    sk.ralt,        kc.PGDN,    kc.LEFT,    kc.DOWN,  kc.UP,    kc.RGHT,
       md.lgui,      cu.COPY,    cu.PSTE,                                kc.BSPC,    kc.TAB,  kc.PSCR,
                                            tt & ht,     tt & ht,       kc.ENTER,   tt & ht
    ] @ combos_base,
    # NUM
    [
                  tt & ht,    tt & ht,    tt & ht,    tt & ht,         kc.EQL,  kc.N7,   kc.N8,   kc.N9,
      sk.lalt,    sk.lgui,    sk.lsft,    sk.lctl,    sk.ralt,         kc.N0,   kc.N4,   kc.N5,   kc.N6,   kc.MINS,
                  tt & ht,     kc.TAB,     kc.DEL,                              kc.N1,   kc.N2,   kc.N3,
                                          tt & ht,    tt & ht,         tt & ht, tt & ht,
    ] @ combos_base,
    # FUN
    [
               fak.BOOT,   tt & ht, tt & ht, tt & ht,                kc.F11,  kc.F7,   kc.F8,   kc.F9,
      sk.lalt,  sk.lgui,   sk.lsft,    sk.lctl,  sk.ralt,       kc.F10,  kc.F4,   kc.F5,   kc.F6,   kc.F12,
              media.MUTE,  tt & ht,   tt & ht,                                 kc.F1,   kc.F2,   kc.F3,
                                  tt & ht, tt & ht,                    tt & ht, tt & ht,
    ] @ combos_base,
    # SYM
    [
               ks.AT,   ks.HASH, ks.DLR,  ks.PERC,        kc.EQL,  kc.GRV, ks.COLN, kc.SCLN,
     sk.lalt,  sk.lgui, sk.lsft, sk.lctl, ks.CIRC,        ks.ASTR, ks.EXLM, ks.PLUS, ks.UNDS, kc.MINS,
               kc.BSLS, ks.PIPE, ks.AMPR,                         ks.TILD, tt & ht, tt & ht,
                                 tt & ht, tt & ht,    tt & ht, tt & ht,
    ] @ combos_base,
  ]
}
