Requires AutoHotKey V2. Download from here: https://www.autohotkey.com/download/ or here: https://github.com/AutoHotkey/AutoHotkey/releases

# Instructions
Install AutoHotKey V2, download the scripts from here, then run the one you prefer by double clicking it. If your scan binding is not tab, then you can edit the script with a text editor, just replace occurances of "Tab" with whatever key you use (I made comments so you'll know where) or just set Tab to scan in SC. The Autoscan script plays lore friendly beeps for feedback. If you don't want the sounds, just delete the sounds folder, it shouldn't affect anything. Please read about the scripts below. 

# StarCitizenOldStyleScanButton.ahk
Does what it says on the box, a single press scan button that functions like it used to. Press Capslock to scan (AHK will block capslock from the OS so it won't turn it on for you). F9 will terminate the script. Alternatively, close it in the system tray. If capslock doesn't work, you might have to unbind it from SC if it's bound, or edit the script to add a ~ before it (there's a comment in the script to show where to do it)

# StarCitizenAutoScan.ahk
An Autohotkey script that automatically repeatedly pings with your ship scanner. 

For use with Star Citizen to rectify the issue of having to spam press-hold tab for scanning, which is quite cumbersome, for the purposes of night vision. Can also be used for mining too.
Intended use: 
1. For people who have disabilities where they can't spam ping, or who can't really bind ping to whatever input device they're using.
2. For testing purposes, to see what an auto ping feature in the game would be like.

Please don't use it with the intention of scanning out players for pvp purposes, as it could possibly be considered an unfair advantage.

Default use:

- Capslock to start pinging every 4 seconds.

- Press Capslock again to reduce ping time to 2 seconds.

- Press Capslock again to stop pinging.

- Press Y (seat leave button) at any time to stop pinging. This means when you leave your seat you'll automatically stop pressing Tab.

- Press F9 (you can change this) at any time to terminate the script. Alternatively, close it in the system tray.

This script assumes your scan button is on Tab, as said above you can edit that in the script. Feel free to edit the timing variables in the script (just use notepad), they're in milliseconds. If capslock doesn't work, you might have to unbind it from SC if it's bound, or edit the script to add a ~ before it (there's a comment in the script to show where to do it)

Autohotkey is a macro program for making life easier. Automation of key presses is generally not considered cheating unless it gives an unfair advantage, or enables you to do things that shouldn't be possible. According to developers from Epic Games, EAC does not care about AHK, and isn't any different than using a fancy keyboard. Still, use at your own risk.