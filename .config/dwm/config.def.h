/* See LICENSE file for copyright and license details. */

/* appearance */
static unsigned int borderpx = 1;    /* border pixel of windows */
static const unsigned int snap = 32; /* snap pixel */
// static unsigned int gappih = 5;      /* horiz inner gap between windows */
static unsigned int gappiv = 5; /* vert inner gap between windows */
// static unsigned int gappoh =
//     0; /* horiz outer gap between windows and screen edge */
// static unsigned int gappov =
//     0; /* vert outer gap between windows and screen edge */
// static int smartgaps = 0; /* 1 means no outer gap when there is only one
// window */
static const int swallowfloating =
    1;                        /* 1 means swallow floating windows by default */
static const int showbar = 1; /* 0 means no bar */
static const int topbar = 1;  /* 0 means bottom bar */
static int user_bh = 1; /* 2 is the default spacing around the bar's font */
static const char buttonbar[] = " ";

static char font[] = "FiraCode Nerd Font:size=12";
static char rofifont[] = "FiraCode Nerd Font 10";
static const char *fonts[] = {
    "FiraCode Nerd Font:size=10", "Noto Color Emoji:size=9"};

static char norm_fg[] = "#dadada";
static char norm_bg[] = "#0a0a0a";
static char norm_border[] = "#555555";

static char sel_fg[] = "#dadada";
static char sel_bg[] = "#005577";
static char sel_border[] = "#a8a8a8";

static char *colors[][3] = {
    /*               fg         bg         border   */
    [SchemeNorm] = {norm_fg, norm_bg, norm_border},
    [SchemeSel] = {sel_fg, sel_bg, sel_border},
};

/* tagging */
static const char *tags[] = {"1", "2", "3", "4", "5", "6", "7", "8", "9"};

static const Rule rules[] = {
    /* xprop(1):
     *	WM_CLASS(STRING) = instance, class
     *	WM_NAME(STRING) = title
     */
    /* class      instance    title       tags mask     isfloating   monitor */
    {"Gimp", NULL, NULL, 0, 1, -1},
    {"Firefox", NULL, NULL, 1 << 8, 0, -1},
};

/* layout(s) */
static const float mfact = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster = 1;    /* number of clients in master area */
static const int resizehints =
    1; /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen =
    1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
    /* symbol     arrange function */
    {"[]=", tile}, /* first entry is default */
    {"><>", NULL}, /* no layout function means floating behavior */
    {"[M]", monocle},
};

/*
 * Xresources preferences to load at startup
 */
ResourcePref resources[] = {
    {"font", STRING, &font},
    /* { "dmenufont",          STRING,  &dmenufont }, */
    {"rofifont", STRING, &rofifont}, {"user_bh", INTEGER, &user_bh},
    {"norm_bg", STRING, &norm_bg}, {"norm_border", STRING, &norm_border},
    {"norm_fg", STRING, &norm_fg}, {"sel_bg", STRING, &sel_bg},
    {"sel_border", STRING, &sel_border}, {"sel_fg", STRING, &sel_fg},
    {"borderpx", INTEGER, &borderpx},
    // {"gappih", INTEGER, &gappih},
    {"gappiv", INTEGER, &gappiv},
    //{"gappoh", INTEGER, &gappoh},
    // {"gappov", INTEGER, &gappov},
    // {"statmonval", INTEGER, &statmonval},
};

/* key definitions */
#define MODKEY Mod1Mask
#define TAGKEYS(KEY, TAG)                                        \
  {MODKEY, KEY, view, {.ui = 1 << TAG}},                         \
      {MODKEY | ControlMask, KEY, toggleview, {.ui = 1 << TAG}}, \
      {MODKEY | ShiftMask, KEY, tag, {.ui = 1 << TAG}},          \
      {MODKEY | ControlMask | ShiftMask, KEY, toggletag, {.ui = 1 << TAG}},

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd)                                       \
  {                                                      \
    .v = (const char *[]) { "/bin/sh", "-c", cmd, NULL } \
  }

/* commands */
static char dmenumon[2] =
    "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = {"rofi", "-show", "drun", "-theme",
    "~/.config/rofi/dmenu.rasi", "-font", rofifont, "-drun-display-format",
    "{name}", NULL};

static const char *termcmd[] = {"st", NULL};

static const Key keys[] = {
    /* modifier                     key        function        argument */
    {MODKEY, XK_p, spawn, {.v = dmenucmd}},
    {MODKEY | ShiftMask, XK_Return, spawn, {.v = termcmd}},
    {MODKEY, XK_b, togglebar, {0}}, {MODKEY, XK_j, focusstack, {.i = +1}},
    {MODKEY, XK_k, focusstack, {.i = -1}},
    {MODKEY, XK_i, incnmaster, {.i = +1}},
    {MODKEY, XK_d, incnmaster, {.i = -1}},
    {MODKEY, XK_h, setmfact, {.f = -0.05}},
    {MODKEY, XK_l, setmfact, {.f = +0.05}}, {MODKEY, XK_Return, zoom, {0}},
    {MODKEY, XK_Tab, view, {0}}, {MODKEY, XK_x, killclient, {0}},

    {MODKEY, XK_t, setlayout, {.v = &layouts[0]}},
    {MODKEY, XK_f, setlayout, {.v = &layouts[1]}},
    {MODKEY, XK_m, setlayout, {.v = &layouts[2]}},

    {MODKEY, XK_space, setlayout, {0}},
    {MODKEY | ShiftMask, XK_space, togglefloating, {0}},

    {MODKEY, XK_0, view, {.ui = ~0}},
    {MODKEY | ShiftMask, XK_0, tag, {.ui = ~0}},
    {MODKEY, XK_comma, focusmon, {.i = -1}},
    {MODKEY, XK_period, focusmon, {.i = +1}},
    {MODKEY | ShiftMask, XK_comma, tagmon, {.i = -1}},
    {MODKEY | ShiftMask, XK_period, tagmon, {.i = +1}},

    {MODKEY | ShiftMask, XK_q, quit, {1}},
    {MODKEY | ControlMask | ShiftMask, XK_q, quit, {0}},

    TAGKEYS(XK_1, 0) TAGKEYS(XK_2, 1) TAGKEYS(XK_3, 2) TAGKEYS(XK_4, 3)
        TAGKEYS(XK_5, 4) TAGKEYS(XK_6, 5) TAGKEYS(XK_7, 6) TAGKEYS(XK_8, 7)
            TAGKEYS(XK_9, 8)};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle,
 * ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
    /* click                event mask      button          function argument */
    {ClkButton, 0, Button1, spawn, {.v = dmenucmd}},
    {ClkLtSymbol, 0, Button1, setlayout, {0}},
    {ClkLtSymbol, 0, Button3, setlayout, {.v = &layouts[2]}},
    {ClkWinTitle, 0, Button2, zoom, {0}},
    {ClkStatusText, 0, Button2, spawn, {.v = termcmd}},
    {ClkClientWin, MODKEY, Button1, movemouse, {0}},
    {ClkClientWin, MODKEY, Button2, togglefloating, {0}},
    {ClkClientWin, MODKEY, Button3, resizemouse, {0}},
    {ClkTagBar, 0, Button1, view, {0}},
    {ClkTagBar, 0, Button3, toggleview, {0}},
    {ClkTagBar, MODKEY, Button1, tag, {0}},
    {ClkTagBar, MODKEY, Button3, toggletag, {0}},
};
