Requires AutoHotKey V2. Download from here: https://www.autohotkey.com/download/ or here: https://github.com/AutoHotkey/AutoHotkey/releases

# Instructions
Install AutoHotKey V2, download the script from here, then run it by double clicking it. If your scan binding is not tab, then you can edit the script with a text editor, just replace occurances of "Tab" with whatever key or joystick button you use (I made comments so you'll know where) or just set Tab to scan in SC. The Autoscan script plays lore friendly beeps for feedback. If you don't want the sounds, just delete the sounds folder, it shouldn't affect anything. Press F9 to end the script, or right click and kill via system tray.

# StarCitizenAutoScan.ahk
An Autohotkey script that automatically repeatedly pings with your ship scanner. 

For use with Star Citizen to rectify the issue of having to spam the scan button to see in the dark. Can also be used for mining or salvage too. Other potential uses are for people who have a disability that prevents them from spamming a hotkey every 2 seconds, or those with custom input devices

Please don't use it with the intention of scanning out players for pvp purposes, as it could possibly be considered an unfair advantage.

Default use:

- Capslock to start pinging every 4 seconds.

- Press Capslock again to reduce ping time to 2 seconds.

- Press Capslock again to stop pinging.

- Press Y (seat leave button) at any time to stop pinging. This means when you leave your seat you'll automatically stop pressing Tab.

- Press F9 (you can change this) at any time to terminate the script. Alternatively, close it in the system tray.

You can customize any of these keys easily. AHK also supports joysticks with hotkeys such as Joy1 Joy2 etc. You can usually find out which button a joystick button is through the windows controller interface.
