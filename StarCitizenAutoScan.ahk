#Requires AutoHotkey v2.0
; this script works in the following fashion
; you press the activation key, you start auto pinging (using StarCitizenScanBinding)
; you press activation again, you start pinging at another set speed
; you press activation again, you stop pinging
; you press y (to leave your seat) at any time, you stop pinging
; press F9 to terminate the script (in case it starts going haywire, who knows)
; some people might consider this cheating if you're using it against players

global StarCitizenScanBinding := "Tab" ;change this to your SC scan binding input key. 
global activationKey := "Capslock" ;note: if an input isn't working, try addling a tilda ~ before it, to stop windows or other programs from seizing the event
global leaveSeatKey := "~Y" ;should be the same key you use in SC to leave your seat
global forceStopKey := "~F9"
;Alternative activation keys: copy and paste everything inside the quotations over what's in the original's quotations
;global activationKey := "~^Capslock" ;(control capslock)
;global activationKey := "~+Capslock" ;(shift capslock)
;global activationKey := "~^Tab" ;(control tab)
;global activationKey := "~+Tab" ;(shift tab)
;global activationKey := "~F10" 

; FINE TUNE HERE - edit these variables
global pingInterval := 4000 ; time between pings on the first stage
global pingHighSpeedInterval := 2000  ; time between pings on the second stage
global tabHoldTime := 25 ; simulate human keypress. If the script doesn't work, tweaking this might help

; state vars
global currentState := 0
global PING_DISABLED := 0
global PING_LOWSPEED := 1
global PING_HIGHSPEED := 2

; input
Hotkey(activationKey, (*) => AutopingToggle())
Hotkey(leaveSeatKey, (*) => LeaveSeatOverride())
Hotkey(forceStopKey, (*) => ForceStop())

AutopingToggle()
{
	global
	if(currentState == PING_DISABLED)
	{
		StartPingLowSpeed()
	}
	else if(currentState == PING_LOWSPEED)
	{
		StartPingHighSpeed()
	}
	else if(currentState == PING_HIGHSPEED)
	{
		EndPinging()
	}
}	

StartPingLowSpeed()
{
	global
	try SoundPlay "Sounds/Button_1.wav"
	currentState := PING_LOWSPEED
	SetTimer(HoldAndReleaseScanBinding, 1) ;we start on 1ms to instantly ping on start
}

StartPingHighSpeed()
{
	global
	try SoundPlay "Sounds/Button_2.wav"
	currentState := PING_HIGHSPEED
	SetTimer(HoldAndReleaseScanBinding, 1)
}

EndPinging()
{
	global
	try SoundPlay "Sounds/Button_3.wav"
	currentState := PING_DISABLED
	SetTimer(HoldAndReleaseScanBinding, 0)
}

HoldAndReleaseScanBinding()
{
	global
	rand := Random(0, 15)
	Send("{" StarCitizenScanBinding " Down}")
	Sleep tabHoldTime + rand
	Send("{" StarCitizenScanBinding " Up}")
	if(currentState == PING_LOWSPEED)
	{
		SetTimer( , pingInterval)
	}	
	else if(currentState == PING_HIGHSPEED)
	{
		SetTimer( , pingHighSpeedInterval)
	}
}

; stops pinging to prevent interference w/ first person
LeaveSeatOverride()
{
	global
	if(currentState != PING_DISABLED) 
	{
		EndPinging()
	}
}

; Emergency Exit, terminates the script
ForceStop()
{
	SoundPlay "*-1"
	ExitApp
}