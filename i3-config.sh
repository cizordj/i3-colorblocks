#!/bin/sh
cat << EOF
set \$mod Mod4

new_window pixel 0
new_float pixel 1

hide_edge_borders both

bindsym \$mod+u border none
bindsym \$mod+y border pixel 1
bindsym \$mod+n border normal

font xft:Fira Code 11

floating_modifier \$mod

bindsym \$mod+Return exec i3-sensible-terminal

# Window kill command
bindsym \$mod+Shift+q kill

# start program launcher
bindsym \$mod+d exec --no-startup-id sh \$HOME/.config/polybar/scripts/launcher.sh
bindsym \$mod+c exec --no-startup-id sh \$HOME/.config/polybar/scripts/run.sh

# change focus
bindsym \$mod+j focus left
bindsym \$mod+k focus down
bindsym \$mod+l focus up
bindsym \$mod+semicolon focus right

bindsym \$mod+Left focus left
bindsym \$mod+Down focus down
bindsym \$mod+Up focus up
bindsym \$mod+Right focus right

# move focused window
bindsym \$mod+Shift+j move left
bindsym \$mod+Shift+k move down
bindsym \$mod+Shift+l move up
bindsym \$mod+Shift+semicolon move right

bindsym \$mod+Shift+Left move left
bindsym \$mod+Shift+Down move down
bindsym \$mod+Shift+Up move up
bindsym \$mod+Shift+Right move right

# workspace back and forth (with/without active container)
workspace_auto_back_and_forth yes
bindsym \$mod+b workspace back_and_forth
bindsym \$mod+Shift+b move container to workspace back_and_forth; workspace back_and_forth

# split orientation
bindsym \$mod+h split h;exec notify-send 'Horizontal'
bindsym \$mod+v split v;exec notify-send 'Vertical'
bindsym \$mod+q split toggle

# toggle fullscreen mode for the focused container
bindsym \$mod+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym \$mod+s layout stacking;exec notify-send 'Stacking'
bindsym \$mod+w layout tabbed;exec notify-send 'Tabbed'
bindsym \$mod+e layout toggle split;exec notify-send 'Split'

# toggle tiling / floating
bindsym \$mod+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym \$mod+space focus mode_toggle

# toggle sticky
bindsym \$mod+Shift+s sticky toggle

# focus the parent container
bindsym \$mod+a focus parent

# move the currently focused window to the scratchpad
bindsym \$mod+Shift+minus move scratchpad

# Show the next scratchpad window or hide the focused scratchpad window.
# If there are multiple scratchpad windows, this command cycles through them.
bindsym \$mod+minus scratchpad show

# navigate workspaces next / previous
bindsym \$mod+Ctrl+Right workspace next
bindsym \$mod+Ctrl+Left workspace prev

# shows the dmenu password store
bindsym \$mod+g exec --no-startup-id dmenu-passwords.sh

# workspaces
set \$ws1 1
set \$ws2 2
set \$ws3 3
set \$ws4 4
set \$ws5 5
set \$ws6 6
set \$ws7 7
set \$ws8 8

# switch to workspace
bindsym \$mod+1 workspace \$ws1
bindsym \$mod+2 workspace \$ws2
bindsym \$mod+3 workspace \$ws3
bindsym \$mod+4 workspace \$ws4
bindsym \$mod+5 workspace \$ws5
bindsym \$mod+6 workspace \$ws6
bindsym \$mod+7 workspace \$ws7
bindsym \$mod+8 workspace \$ws8

# Move focused container to workspace
bindsym \$mod+Ctrl+1 move container to workspace \$ws1
bindsym \$mod+Ctrl+2 move container to workspace \$ws2
bindsym \$mod+Ctrl+3 move container to workspace \$ws3
bindsym \$mod+Ctrl+4 move container to workspace \$ws4
bindsym \$mod+Ctrl+5 move container to workspace \$ws5
bindsym \$mod+Ctrl+6 move container to workspace \$ws6
bindsym \$mod+Ctrl+7 move container to workspace \$ws7
bindsym \$mod+Ctrl+8 move container to workspace \$ws8

# Move to workspace with focused container
bindsym \$mod+Shift+1 move container to workspace \$ws1; workspace \$ws1
bindsym \$mod+Shift+2 move container to workspace \$ws2; workspace \$ws2
bindsym \$mod+Shift+3 move container to workspace \$ws3; workspace \$ws3
bindsym \$mod+Shift+4 move container to workspace \$ws4; workspace \$ws4
bindsym \$mod+Shift+5 move container to workspace \$ws5; workspace \$ws5
bindsym \$mod+Shift+6 move container to workspace \$ws6; workspace \$ws6
bindsym \$mod+Shift+7 move container to workspace \$ws7; workspace \$ws7
bindsym \$mod+Shift+8 move container to workspace \$ws8; workspace \$ws8

# Open specific applications in floating mode
for_window [window_role="About"] floating enable
for_window [title="alsamixer"] floating enable border pixel 1
for_window [class="Calamares"] floating enable border normal
for_window [class="Clipgrab"] floating enable
for_window [title="File Transfer*"] floating enable
for_window [class="eog"] floating enable
for_window [class="Galculator"] floating enable border pixel 1
for_window [class="GParted"] floating enable border normal
for_window [class="(?i)gnome-calculator"] floating enable
for_window [title="i3_help"] floating enable sticky enable border normal
for_window [class="Lightdm-gtk-greeter-settings"] floating enable
for_window [class="Lxappearance"] floating enable sticky enable border normal
for_window [class="Manjaro-hello"] floating enable
for_window [class="Manjaro Settings Manager"] floating enable border normal
for_window [title="mixertui"] floating enable border pixel 1
for_window [title="MuseScore: Play Panel"] floating enable
for_window [class="Nitrogen"] floating enable sticky enable border normal
for_window [class="Oblogout"] fullscreen enable
for_window [class="octopi"] floating enable
for_window [class="Pamac-manager"] floating enable
for_window [class="Pavucontrol"] floating enable
for_window [class="qt5ct"] floating enable sticky enable border normal
for_window [class="Qtconfig-qt4"] floating enable sticky enable border normal
for_window [title="QEMU"] floating enable
for_window [class="Simple-scan"] floating enable border normal
for_window [class="st-256color"] floating enable border pixel 1
for_window [class="(?i)System-config-printer.py"] floating enable border normal
for_window [class="Skype"] floating enable border normal
for_window [class="Thus"] floating enable border normal
for_window [class="Timeset-gui"] floating enable border normal
for_window [class="(?i)xcalc"] floating enable
for_window [class="Xfburn"] floating enable

# switch to workspace with urgent window automatically
for_window [urgent=latest] focus

# reload the configuration file
bindsym \$mod+Shift+c reload

# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym \$mod+Shift+r restart

# exit i3 (logs you out of your X session)
bindsym \$mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"

# Set shut down, restart and locking features
bindsym \$mod+0 mode "\$mode_system"
set \$mode_system (l)ock, (e)xit, (r)eboot, (Shift+s)hutdown
mode "\$mode_system" {
    bindsym l exec --no-startup-id i3lock-fancy -p, mode "default"
    bindsym e exec --no-startup-id i3-msg exit, mode "default"
    bindsym r exec --no-startup-id doas /sbin/reboot, mode "default"
    bindsym Shift+s exec --no-startup-id doas /sbin/poweroff, mode "default"

    # exit system mode: "Enter" or "Escape"
    bindsym Return mode "default"
    bindsym Escape mode "default"
}

# Resize window (you can also use the mouse for that)
bindsym \$mod+r mode "resize"
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode
        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
        bindsym j resize shrink width 5 px or 5 ppt
        bindsym k resize grow height 5 px or 5 ppt
        bindsym l resize shrink height 5 px or 5 ppt
        bindsym semicolon resize grow width 5 px or 5 ppt

        # same bindings, but for the arrow keys
        bindsym Left resize shrink width 10 px or 10 ppt
        bindsym Down resize grow height 10 px or 10 ppt
        bindsym Up resize shrink height 10 px or 10 ppt
        bindsym Right resize grow width 10 px or 10 ppt

        # exit resize mode: Enter or Escape
        bindsym Return mode "default"
        bindsym Escape mode "default"
}

# Autostart applications
exec_always --no-startup-id xwallpaper --daemon --zoom \$HOME/.config/xwallpaper/default.png
exec_always --no-startup-id \$HOME/.config/polybar/launch.sh
exec_always --no-startup-id numlockx on
exec_always --no-startup-id \$HOME/.screenlayout/direita.sh
exec xset r rate 200 40
exec --no-startup-id picom

# Theme colors
client.focused          #EEEEEE #1E272B #EEEEEE #FFF #FFF
client.focused_inactive #EEEEEE #1E272B #EEEEEE #78824B #78824B
client.unfocused        #EEEEEE #1E272B #EEEEEE #78824B #78824B
client.urgent           #EEEEEE #1E272B #EEEEEE #78824B #78824B
client.placeholder      #EEEEEE #1E272B #EEEEEE #78824B #78824B

client.background       #1E272B

# set power-manager and volume control
bindsym XF86AudioRaiseVolume exec --no-startup-id amixer -c 0 -q set Master 2dB+ unmute && notify-send "Vol++"
bindsym XF86AudioLowerVolume exec --no-startup-id amixer -c 0 -q set Master 2db- unmute && notify-send "Vol--"
bindsym XF86AudioMute exec --no-startup-id amixer -q set Master toggle && notify-send Muted
bindsym XF86MonBrightnessUp exec --no-startup-id brightnessctl set +10% && notify-send "+10%"
bindsym XF86MonBrightnessDown exec --no-startup-id brightnessctl set 10%- && notify-send "10%-"

# touchpad on and off controller on laptop with Fn+<touchpad control functional key>
bindsym XF86TouchpadOn exec --no-startup-id synclient Touchpadoff=0
bindsym XF86TouchpadOff exec --no-startup-id synclient Touchpadoff=1

focus_follows_mouse yes

# User defined keys
bindsym Print exec flameshot gui
bindsym Shift+Print exec flameshot gui
bindsym \$mod+F1 exec --no-startup-id i3-sensible-terminal -e alsamixer
bindsym \$mod+F2 exec --no-startup-id surf
bindsym \$mod+F3 exec --no-startup-id nautilus
bindsym \$mod+F4 exec --no-startup-id xcalc
bindsym \$mod+F5 exec --no-startup-id i3-sensible-terminal -e cmus
bindsym \$mod+F6 exec --no-startup-id i3-sensible-terminal -e nmtui

# Gaps
# Uncomment this if you use i3-gaps
# gaps inner 10
# gaps outer -4
#smart_gaps on
# Press \$mod+Shift+g to enter the gap mode. Choose o or i for modifying outer/inner gaps. Press one of + / - (in-/decrement for current workspace) or 0 (remove gaps for current workspace). If you also press Shift with these keys, the change will be global for all workspaces.
# set \$mode_gaps Gaps: (o) outer, (i) inner
# set \$mode_gaps_outer Outer Gaps: +|-|0 (local), Shift + +|-|0 (global)
# set \$mode_gaps_inner Inner Gaps: +|-|0 (local), Shift + +|-|0 (global)
# bindsym \$mod+Shift+g mode "\$mode_gaps"
# mode "\$mode_gaps" {
#         bindsym o      mode "\$mode_gaps_outer"
#         bindsym i      mode "\$mode_gaps_inner"
#         bindsym Return mode "default"
#         bindsym Escape mode "default"
# }
# mode "\$mode_gaps_inner" {
#         bindsym plus  gaps inner current plus 5
#        bindsym minus gaps inner current minus 5
#        bindsym 0     gaps inner current set 0
#        bindsym Shift+plus  gaps inner all plus 5
#        bindsym Shift+minus gaps inner all minus 5
#        bindsym Shift+0     gaps inner all set 0
#        bindsym Return mode "default"
#        bindsym Escape mode "default"
# }
# mode "\$mode_gaps_outer" {
#        bindsym plus  gaps outer current plus 5
#        bindsym minus gaps outer current minus 5
#        bindsym 0     gaps outer current set 0
#        bindsym Shift+plus  gaps outer all plus 5
#        bindsym Shift+minus gaps outer all minus 5
#        bindsym Shift+0     gaps outer all set 0
#        bindsym Return mode "default"
#        bindsym Escape mode "default"
# }
EOF
