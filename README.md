# ibus-monitor

"Lightweight" ibus script that display languages.  

![image](https://user-images.githubusercontent.com/10562127/173026641-572564c1-6b9e-4e24-a188-53b9e042306c.png)


This is just a small script that output the value of `ibus engine` to `STDOUT` by using `dbus`, written in shell. I made this for displaying my keyboard layout in [Polybar](https://github.com/polybar/polybar), but feel free to tailor it to your need. There are some nifty part here and there and I will explain it below

## Usage
You can either clone this repository or just copy on the repository. Make sure to `chmod +x` the script files
```bash
git clone https://github.com/Banbeucmas/ibus-monitor.git
cd ibus-monitor
chmod +x *.sh
```

Main script is `ibus_monitor.sh` and you should use it, `ibus_toggle.sh` only serve the purpose of parsing the file.
Currently only `mozc-jp` and `Bamboo` is parsed, you can edit it to your liking and pipe `ibus_monitor.sh` as the input  

```bash
./ibus_monitor.sh | ./ibus_toggle.sh
```

## Example with Polybar
You can make a script module and use it like this. Note that `tail` has to be `true`  
```
[module/language]
type = custom/script
exec = ~/.config/polybar/scripts/ibus_monitor.sh | ~/.config/polybar/scripts/ibus_toggle.sh
tail = true

format-padding = 2
```

**Note:** Due to Dbus sending a warning message about eavesdropping mode, different message will be shown until you select a new output. To deal with this I added a delay `echo $(ibus engine)` command on the script.  
No, there is no other way, unless until `ibus` made `ibus watch` availiable

## Frequently Asked Question
**Q:** Why don't you use `ibus engine` directly?  
**A:** It isn't meant to be used in polybar, you can try it, it works, just be mindful that your CPU will go brrrrrrr for doing this

**Q:** How painful this was?  
**A:** I know nothing about `dbus` prior to this, give me back 16 hours of pain  

**Q:** How can I talk to you?  
**A:** I am fairly active in my own Discord. [Click here to join](https://discord.gg/CB9kw68)

## License
GNU GENERAL PUBLIC LICENSE, Version 3
