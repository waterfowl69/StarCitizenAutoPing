#Requires AutoHotkey v2.0
; this script works in the following fashion
; when running, pressing capslock will hold tab for 300ms then release, creating an easy to use scan button
; press F9 to terminate the script (in case it starts going haywire, who knows)

global tabHoldTime := 300 ; how long tab is held for pings

CapsLock:: ; Plain old Tab to scan
{
    HoldAndReleaseTab
}

; Tab timer function
HoldAndReleaseTab()
{
	global
	rand := Random(0, 30)
	Send "{Tab Down}" ; Change 'Tab' if your scan binding is not 'Tab'
	Sleep tabHoldTime + rand
	Send "{Tab Up}" ; Change 'Tab' if your scan binding is not 'Tab'
}

; Emergency Exit, terminates the script
~F9::
{
    SoundPlay "*-1"
	ExitApp
}