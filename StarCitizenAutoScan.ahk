#Requires AutoHotkey v2.0
; this script works in the following fashion
; you press control + tab, you start auto pinging (holding tab down and releasing) every so many ms
; you press control + tab again, you start pinging at another set speed
; you press control + tab again, you stop pinging
; you press y (to leave your seat) at any time, you stop pinging
; press F9 to terminate the script (in case it starts going haywire, who knows)
; please don't use against players

; variables you can edit to fine tune
global pingInterval := 4000 ; time between pings on the first stage
global pingHighSpeedInterval := 2000  ; time between pings on the second stage
global tabHoldTime := 300 ; how long tab is held for pings

; variables you shouldn't touch unless you're editing the script
global currentlyPinging := false
global pingHighSpeed := false

; Control + Tab
; Alternatives: ~+Tab:: (shift tab), ~F5:: (F5), etc
~^Tab:: 
{
	global
	if(currentlyPinging == false) ; if we're not pinging
	{
		try SoundPlay "Button_1.wav"
		currentlyPinging := true
		HoldAndReleaseTab() ; initial ping so there isn't a pause
		SetTimer HoldAndReleaseTab, pingInterval
	}
	else if(currentlyPinging && pingHighSpeed == false) ; if we're on the slow speed ping stage
	{
		try SoundPlay "Button_2.wav"
		pingHighSpeed := true
		SetTimer HoldAndReleaseTab, pingHighSpeedInterval
	}
	else ; if we're on the high speed ping stage, shut it down
	{
		try SoundPlay "Button_3.wav"
		EndPinging()
	}
}	

; Plain old Y
~Y::
{
	EndPinging()
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

; resets all bools, stops timer
EndPinging()
{
	global
	currentlyPinging := false
	pingHighSpeed := false
	SetTimer HoldAndReleaseTab, 0
}

; Emergency Exit, terminates the script
~F9::
{
	SoundPlay "*-1"
	ExitApp
}