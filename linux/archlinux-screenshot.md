Taking screenshot in i3, you can install `imgur-screenshot` to automatically upload the file.

```
bindsym $mod+Print --release exec --no-startup-id imgur-screenshot
```

If you want to copy the screenshot to clipboard instead, you can config:

```
bindsym Print --release exec "scrot -s /tmp/screenshot-$(date +%F_%T).png -e 'xclip -selection c -t image/png < $f'"
```
