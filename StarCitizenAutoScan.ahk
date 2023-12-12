#Requires AutoHotkey v2.0
; this script works in the following fashion
; you press control + tab, you start auto pinging (holding tab down and releasing) every so many ms
; you press control + tab again, you start pinging at another set speed
; you press control + tab again, you stop pinging
; you press y (to leave your seat) at any time, you stop pinging
; press F12 to terminate the script (in case it starts going haywire, who knows)
; please don't use against players

; variables you can edit to fine tune
global pingInterval := 4000 ; time between pings on the first stage
global pingHighSpeedInterval := 2000  ; time between pings on the second stage
global tabHoldTime := 300 ; how long tab is held for pings

; variables you shouldn't touch unless you're editing the script
global holdingTab := false
global pingHighSpeed := false

; Control + Tab
^Tab:: 
{
	global
	if(holdingTab && pingHighSpeed == true) ; if we're on the high speed pinging stage
	{
		; end our pinging, reset all bools
		holdingTab := false
		pingHighSpeed := false
		SetTimer ReleaseTab, 0
	}
	else if(holdingTab == false) ; if we're not pinging
	{
		holdingTab := true
		SetTimer ReleaseTab, pingInterval
	}
	else ; if we're on the slow speed ping stage
	{
		pingHighSpeed := true
		SetTimer ReleaseTab, pingHighSpeedInterval
	}
}	

; Plain old Y 
~Y::
{
	global
	holdingTab := false
	pingHighSpeed := false
	SetTimer ReleaseTab, 0
}

; Tab timer function
ReleaseTab()
{
	global
	rand := Random(0, 30)
	Send "{Tab Down}"
	Sleep tabHoldTime + rand
	Send "{Tab Up}"
}

; Emergency Exit, terminates the script
~F12::
{
	ExitApp
}