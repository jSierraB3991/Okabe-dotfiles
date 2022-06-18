# Antonio Sarosi
# https://youtube.com/c/antoniosarosi
# https://github.com/antoniosarosi/dotfiles

# Qtile keybindings

from libqtile.config import Key
from libqtile.command import lazy


mod = "mod4"

keys = [Key(key[0], key[1], *key[2:]) for key in [
    # ------------ Window Configs ------------

    # Switch between windows in current stack pane
    ([mod], "j", lazy.layout.down()),
    ([mod], "k", lazy.layout.up()),
    ([mod], "h", lazy.layout.left()),
    ([mod], "l", lazy.layout.right()),

    ([mod], "Down", lazy.layout.down()),
    ([mod], "Up", lazy.layout.up()),
    ([mod], "Left", lazy.layout.left()),
    ([mod], "Right", lazy.layout.right()),

    # Change window sizes (MonadTall)
    ([mod, "shift"], "l", lazy.layout.grow()),
    ([mod, "shift"], "h", lazy.layout.shrink()),

    # Move windows up or down in current stack
    ([mod, "shift"], "j", lazy.layout.shuffle_down()),
    ([mod, "shift"], "k", lazy.layout.shuffle_up()),

    # Toggle between different layouts as defined below
    ([mod], "Tab", lazy.next_layout()),

    # Kill window
    ([mod], "w", lazy.window.kill()),

    # Restart Qtile
    ([mod, "control"], "r", lazy.restart()),

    ([mod, "control"], "q", lazy.shutdown()),
    ([mod], "r", lazy.spawncmd()),

    # ------------ App Configs ------------

    # Menu
    ([mod], "d", lazy.spawn("rofi -no-lazy-grab -show drun -theme Source/dotfiles/rofi/global-menu/appsmenu.rasi -show-icons")),

    # Browser
    ([mod], "f", lazy.spawn("firefox")),
    ([mod], "i", lazy.spawn("com.google.AndroidStudio")),

    # File Explorer
    ([mod, "shift"], "n", lazy.spawn("kitty ranger")),
    ([mod], "n", lazy.spawn("pcmanfm")),

    # Terminal
    ([mod], "Return", lazy.spawn("kitty")),
    #clipboard history
    ([mod], "z", lazy.spawn("clipcat-menu")),
    # Lock screen
    ([mod], "x", lazy.spawn("i3lock-fancy")),
    #Notification center
    ([mod, "shift"], "z", lazy.spawn("kill -s USR1 $(pidof deadd-notification-center)")),

    # Screenshot
    ([mod, "shift"], "s", lazy.spawn("flameshot gui")),
    ([mod], "s", lazy.spawn("/home/lelouch/.config/bin/scrot.sh -m")),

    # ------------ Hardware Configs ------------

    # Volume
    ([], "XF86AudioLowerVolume", lazy.spawn(
        "/home/lelouch/.config/bin/volume-deadd.sh down"
    )),
    ([], "XF86AudioRaiseVolume", lazy.spawn(
        "/home/lelouch/.config/bin/volume-deadd.sh up"
    )),
    ([], "XF86AudioMute", lazy.spawn(
        "/home/lelouch/.config/bin/volume-deadd.sh mute"
    )),
]]
