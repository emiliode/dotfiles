# Udev Rules


/etc/udev/rules.d/100-usb.rules
```udev-rule
ACTION=="add", SUBSYSTEMS=="usb", ENV{DEVTYPE}=="usb_device", RUN+="/home/user/.config/bspwm/usb.sh"
```
