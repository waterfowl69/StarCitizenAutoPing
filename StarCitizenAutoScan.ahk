#Requires AutoHotkey v2.0
; this script works in the following fashion
; you press control + tab, you start auto pinging (holding tab down and releasing) every so many ms
; you press control + tab again, you start pinging at another set speed
; you press control + tab again, you stop pinging
; you press y (to leave your seat) at any time, you stop pinging
; press F9 to terminate the script (in case it starts going haywire, who knows)
; please don't use against players

; FINE TUNE HERE - edit these variables
global pingInterval := 4000 ; time between pings on the first stage
global pingHighSpeedInterval := 2000  ; time between pings on the second stage
global tabHoldTime := 300 ; how long tab is held for pings (not really worth going below 300, but lag or something might necessitate a change)

; variables you shouldn't touch unless you're editing the script
global currentlyPinging := false
global pingHighSpeed := false

; Control + Tab
; Toggles the ping mode
; Alternatives: ~+Tab:: (shift tab), ~F5:: (F5), etc
~+Tab:: 
{
	global
	if(currentlyPinging == false) ; if we're not pinging
	{
		try SoundPlay "Sounds/Button_1.wav"
		currentlyPinging := true
		SetTimer HoldAndReleaseTab, 1
	}
	else if(currentlyPinging && pingHighSpeed == false) ; if we're on the slow speed ping stage
	{
		try SoundPlay "Sounds/Button_2.wav"
		pingHighSpeed := true
	}
	else ; if we're on the high speed ping stage, shut it down
	{
		try SoundPlay "Sounds/Button_3.wav"
		EndPinging()
	}
}	

; Plain old Y
~Y::
{
	if(currentlyPinging) 
		EndPinging()
}

; Tab timer function
; We start the timer on 1ms and update the interval inside the timer so we get an initial ping
HoldAndReleaseTab()
{
	global
	rand := Random(0, 30)
	Send "{Tab Down}" ; Change 'Tab' if your scan binding is not 'Tab'
	Sleep tabHoldTime + rand
	Send "{Tab Up}" ; Change 'Tab' if your scan binding is not 'Tab'
	if(pingHighSpeed)
		SetTimer , pingHighSpeedInterval 
	else 
		SetTimer , pingInterval 
}

; resets all bools, stops timer
EndPinging()
{
	global
	try SoundPlay "Sounds/Button_3.wav"
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