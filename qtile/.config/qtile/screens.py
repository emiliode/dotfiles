import os
import subprocess

from libqtile.config import (
    # KeyChord,
    # Key,
    Screen,
    # Group,
    # Drag,
    # Click,
    # ScratchPad,
    # DropDown,
    # Match,
)

from libqtile import bar, widget  # , hook, layout
from libqtile import qtile
from colors import colors

terminal = "alacritty"


def open_pavu():
    qtile.cmd_spawn("pavucontrol")


group_box_settings = {
    "padding": 5,
    "borderwidth": 4,
    "active": colors[9],
    "inactive": colors[10],
    "disable_drag": True,
    "rounded": True,
    "highlight_color": colors[2],
    "block_highlight_text_color": colors[8],
    "highlight_method": "block",
    "this_current_screen_border": colors[0],
    "this_screen_border": colors[7],
    "other_current_screen_border": colors[0],
    "other_screen_border": colors[0],
    "foreground": colors[1],
    # "background": colors[14],
    "urgent_border": colors[3],
}

text_size = 18
icon_size = 14


def init_widgets():
    return [
        # widget.TextBox(
        #     text="",
        #     foreground=colors[1],
        #     fontsize=20,
        #     padding=20,
        # ),
        widget.Sep(
            linewidth=0,
            foreground=colors[2],
            padding=20,
            size_percent=40,
        ),
        widget.GroupBox(
            font="Hack Nerd Font",
            **group_box_settings,
            fontsize=12,
        ),
        widget.Sep(
            linewidth=0,
            foreground=colors[2],
            padding=10,
            size_percent=40,
        ),
        widget.CurrentLayoutIcon(
            custom_icon_paths=[os.path.expanduser("~/.config/qtile/icons")],
            foreground=colors[1],
            padding=-2,
            scale=0.45,
        ),
        widget.Sep(
            linewidth=0,
            foreground=colors[2],
            padding=10,
            size_percent=50,
        ),
        widget.Systray(
            padding=10,
        ),
        widget.CheckUpdates(
            foreground=colors[3],
            colour_have_updates=colors[3],
            distro="Ubuntu",
            display_format=" {updates}",
            padding=20,
            update_interval=300,
            mouse_callbacks={
                "Button1": lambda: qtile.cmd_spawn(
                    terminal + " -e sudo apt update -y && sudo apt upgrade -y"
                )
            },
        ),
        widget.Spacer(),
        widget.Sep(
            linewidth=0,
            padding=25,
            size_percent=50,
        ),
        widget.TextBox(
            text=" ",
            foreground=colors[8],
            font="Font Awesome 5 Free Solid",
            fontsize=icon_size,
        ),
        widget.PulseVolume(
            foreground=colors[1],
            limit_max_volume="True",
            update_interval=0.1,
            mouse_callbacks={"Button3": open_pavu},
            fontsize=text_size,
        ),
        widget.Sep(
            linewidth=0,
            padding=25,
            size_percent=50,
        ),
        widget.TextBox(
            text="",
            font="Font Awesome 5 Free Solid",
            foreground=colors[1],
            fontsize=icon_size,
        ),
        widget.CPU(
            foreground=colors[1],
            update_interval=1,
            format="{load_percent: .0f} %",
            fontsize=text_size,
        ),
        widget.NetGraph(type="line", graph_color=colors[8], interface="wlo1"),
        widget.TextBox(
            text=" ",
            font="Font Awesome 5 Free Solid",
            fontsize=icon_size,
            foreground=colors[8],
        ),
        widget.Clock(
            format="%b %d",
            foreground=colors[1],
            fontsize=text_size,
        ),
        widget.Sep(
            linewidth=0,
            padding=25,
            size_percent=50,
        ),
        widget.TextBox(
            text=" ",
            font="Hack Nerd Font",
            foreground=colors[8],
            fontsize=14,
        ),
        widget.Clock(
            format="%H:%M",
            foreground=colors[1],
            fontsize=text_size,
        ),
        widget.Sep(
            linewidth=0,
            foreground=colors[1],
            padding=25,
            size_percent=50,
        ),
    ]


def make_bar():
    return bar.Bar(
        init_widgets(),
        32,
        margin=[0, -10, 5, -10],
    )


screens = [Screen(top=make_bar()), Screen(top=make_bar())]
