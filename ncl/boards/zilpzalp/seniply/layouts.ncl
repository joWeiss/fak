let { tap, hold, .. } = import "../../../fak/keycode.ncl" in
let util = import "../../../fak/util_functions.ncl" in

let kc = tap.reg.kc in
let ks = tap.reg.ks in
let md = hold.reg.mod in
let st = tap.sticky.mod in
let tm = tap.reg.mod in
let me = tap.custom.media in
let XXXX = tap.none & hold.none in

let shared_layers = {
  NUM = [
    XXXX,
    XXXX,
    XXXX,
    XXXX,
    kc.EQL,
    kc.N7,
    kc.N8,
    kc.N9,
    st.lgui,
    st.lsft,
    st.lctl,
    md.ralt,
    kc.N0,
    kc.N4,
    kc.N5,
    kc.N6,
    st.lalt,
    XXXX,
    kc.TAB,
    kc.BSPC,
    kc.N1,
    kc.N2,
    kc.N3,
    kc.SLSH,
    XXXX,
    XXXX,
    XXXX,
    XXXX,
  ],
  EXT = [
    kc.ESC,
    XXXX,
    XXXX,
    md.ralt,
    me.PGUP,
    kc.HOME,
    kc.UP,
    kc.END,
    st.lgui,
    st.lsft,
    st.lctl,
    tm.lctl & kc.V,
    kc.PGDN,
    kc.LEFT,
    kc.DOWN,
    kc.RIGHT,
    st.lalt,
    tm.lctl & kc.X,
    tm.lctl & kc.C,
    md.lgui,
    kc.BSPC,
    kc.TAB,
    kc.PSCR,
    kc.TAB,
    XXXX,
    XXXX,
    kc.ENTER,
    XXXX,
  ],
  SYM = [
    ks.EXLM,
    ks.DQUO,
    kc.DOT,
    kc.LBRC,
    kc.RBRC,
    kc.BSLS,
    ks.PIPE,
    kc.SLSH,
    ks.AT,
    ks.HASH,
    ks.DLR,
    ks.LPRN,
    ks.RPRN,
    ks.AMPR,
    ks.ASTR,
    ks.PERC,
    ks.EXLM,
    ks.TILD,
    kc.QUOT,
    ks.UNDS,
    kc.MINS,
    ks.PLUS,
    kc.EQL,
    kc.TAB,
    ks.LCBR,
    ks.RCBR,
    XXXX,
    XXXX,
  ],
  FUN = [
    XXXX,
    XXXX,
    XXXX,
    XXXX,
    kc.F12,
    kc.F7,
    kc.F8,
    kc.F9,
    XXXX,
    XXXX,
    XXXX,
    XXXX,
    kc.F11,
    kc.F4,
    kc.F5,
    kc.F6,
    XXXX,
    XXXX,
    XXXX,
    XXXX,
    kc.F1,
    kc.F2,
    kc.F3,
    kc.F10,
    XXXX,
    XXXX,
    XXXX,
    XXXX,
  ],
}
in

let both_side_combos = [
  [kc.CAPS, 0, 7],
  # Caps word combo here once supported
  # [CW, 10, 13],
]
in

{
  qwerty = {
    base_layout = "WERTYUIOSDFGHJKLAXCVM,.P",
    thumbs = [kc.ESC, kc.SPC, kc.N, kc.ENT],
    combos =
      [
        # Left
        [kc.Q, 0, 1],
        [kc.Z, 17, 18],
        [kc.B, 18, 19],
        # Right
        [kc.QUOT, 5, 6],
        [kc.SCLN, 6, 7],
        [kc.MINS, 20, 21],
        [kc.SLSH, 21, 22],
      ]
      @ both_side_combos,
    layers = {
      NUM = shared_layers.NUM,
      EXT = shared_layers.EXT,
      SYM = shared_layers.SYM,
      FUN = shared_layers.FUN,
    }
  },

  colemak = {
    base_layout = "WFPKJLUYRSTGMNEIAXCDH,.O",
    thumbs = [kc.ESC, kc.SPC, kc.ENT, kc.BSPC],
    combos =
      [
        # Left
        [kc.Q, 0, 1],
        [kc.B, 1, 2],
        [kc.Z, 17, 18],
        [kc.V, 18, 19],
        # Right
        [kc.QUOT, 5, 6],
        [kc.SCLN, 6, 7],
        [kc.MINS, 20, 21],
        [kc.SLSH, 21, 22],
      ]
      @ both_side_combos,
    layers = {
      NUM = shared_layers.NUM,
      EXT = shared_layers.EXT,
      SYM = shared_layers.SYM,
      FUN = shared_layers.FUN,
    }
  },

  workman = {
    base_layout = "DRWBJFUPASHTVKNEOIXMCL,.",
    thumbs = [kc.QUOT, kc.SPC, kc.ENT, XXXX],
    combos =
      [
        # Left
        [kc.Q, 0, 1],
        [ks.LCBR, 0, 8],
        [kc.LBRC, 1, 9],
        [ks.LPRN, 2, 10],
        [kc.G, 3, 11],
        [kc.Z, 17, 18],
        [kc.ESC, 18, 19],
        # Right
        [kc.DEL, 5, 7],
        [kc.BSPC, 5, 6],
        [kc.SCLN, 6, 7],
        [kc.Y, 4, 12],
        [ks.RPRN, 5, 13],
        [kc.RBRC, 6, 14],
        [ks.RCBR, 7, 15],
        [kc.MINS, 20, 21],
        [kc.SLSH, 21, 22],
      ]
      @ both_side_combos,
    layers = {
    EXT = shared_layers.EXT,
    FUN = shared_layers.FUN,
    NUM = shared_layers.NUM,
    SYM = shared_layers.SYM,
    },
  },
}
