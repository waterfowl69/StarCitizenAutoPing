#Requires AutoHotkey v2.0
; this script works in the following fashion
; control + tab toggles functionality
; when enabled, tab will hold for 300ms then release, creating an easy to use scan button
; press F9 to terminate the script (in case it starts going haywire, who knows)

global tabHoldTime := 300 ; how long tab is held for pings
global scriptEnabled := true

; Control + Tab to toggle script
; Alternatives: ~+Tab (shift tab), ~F5 (F5), etc
~^Tab:: 
{
	global
    try SoundPlay "Sounds/Button_2.wav"
	scriptEnabled := !scriptEnabled 
}

~Tab:: ; Plain old Tab to scan
{
    global
    if(scriptEnabled)
    {
        HoldAndReleaseTab
    }
}

; Tab timer function
HoldAndReleaseTab()
{
	global
	rand := Random(0, 30)
	Send "{Tab Down}"
	Sleep tabHoldTime + rand
	Send "{Tab Up}"
}

; Emergency Exit, terminates the script
~F9::
{
    SoundPlay "*-1"
	ExitApp
}