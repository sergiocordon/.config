import os
from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

mod = "mod4"
terminal = guess_terminal()

colors = {
  "primary": {
    "background": '#2e3440',
    "foreground": '#d8dee9',
    "dim_foreground": '#a5abb6'
    },
  "cursor": {
    "text": '#2e3440', 
    "cursor": '#d8dee9'
    }, 
  "selection": {
    "text": '#d8dee9', 
    "background": '#4c566a'
    }, 
  "search": {
    "matches": {
      "foreground":  '#2e3440', 
      "background": '#88c0d0'
      }, 
    "bar": {
      "background": '#434c5e', 
      "foreground": '#d8dee9'
      }, 
    }, 
  "normal": {
    "black": '#3b4252', 
    "red": '#bf616a', 
    "green": '#a3be8c', 
    "yellow": '#ebcb8b', 
    "blue": '#81a1c1', 
    "magenta": '#b48ead', 
    "cyan": '#88c0d0', 
    "white": '#e5e9f0', 
    }, 
  "bright": {
    "black": '#4c566a', 
    "red": '#bf616a', 
    "green": '#a3be8c', 
    "yellow": '#ebcb8b', 
    "blue": '#81a1c1', 
    "magenta": '#b48ead', 
    "cyan": '#8fbcbb', 
    "white": '#eceff4', 
    }, 
  "dim": {
    "black": '#373e4d', 
    "red": '#94545d', 
    "green": '#809575', 
    "yellow": '#b29e75', 
    "blue": '#68809a', 
    "magenta": '#8c738c', 
    "cyan": '#6d96a5', 
    "white": '#aeb3bb', 
    }
}

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "Tab", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "space", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    # Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    Key([mod], "r", lazy.spawn(
            f"dmenu_run -p '> ' " \
            f"-l 30 " \
            f"-fn 'FuraMono Nerd Font Mono' " \
            f"-nb {colors['primary']['background']} " \
            f"-nf {colors['primary']['foreground']} " \
            f"-sb {colors['search']['matches']['background']} " \
            f"-sf {colors['search']['matches']['foreground']} " 
    )),
]

groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

def init_layout_theme():
    return {
            "margin": 2,
            "border_width": 1,
            "border_focus": colors['normal']['cyan'],
            }

layout_theme = init_layout_theme() 

layouts = [
    layout.MonadTall(**layout_theme),
    layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font="FuraMono Nerd Font Mono",
    fontsize=12,
    padding=2,
    foreground=colors['primary']['foreground'],
    background=colors['primary']['background']
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        bottom=bar.Bar(
            [
                widget.Sep(
                    linewidth=0,
                    padding=6,
                    ),
                widget.GroupBox(
                    active=colors['selection']['text'],
                    inactive=colors['selection']['background'],
                    highlight_method='block',
                    rounded=False,
                    margin_x=0,
                    margin_y=0,
                    padding_x=5,
                    padding_y=5,
                    border_width=1,
                    this_current_screen_border=colors['selection']['background'],
                    this_current_border=colors['selection']['background'],
                    ),
                # widget.Prompt(),
                widget.Sep(
                    linewidth=0,
                    padding=6,
                    ),
                widget.WindowName(
                    padding=5,
                    foreground=colors['normal']['cyan'],
                    ),
                # widget.CPUGraph(),
                widget.TextBox(
                   text = '',
                   foreground = colors['normal']['blue'],
                   padding = -12,
                   fontsize = 58,
                   ),
                widget.Clock(
                    format="%Y-%m-%d %a",
                    foreground = colors['normal']['black'],
                    background = colors['normal']['blue'],
                    ),
                widget.TextBox(
                   text = '',
                   foreground = colors['normal']['cyan'],
                   background = colors['normal']['blue'],
                   padding = -12,
                   fontsize = 58,
                   ),
                widget.Clock(
                    format="%I:%M %p",
                    foreground = colors['normal']['black'],
                    background = colors['normal']['cyan'],
                    ),
            ],
            24,
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

if __name__ in ["config", "__main__"]:
    os.system('nitrogen --restore &')

wmname = "LG3D"
