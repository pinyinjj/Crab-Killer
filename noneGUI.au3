#NoTrayIcon
#RequireAdmin
#include <MsgBoxConstants.au3>
#include <AutoItConstants.au3>
#include <WinAPI.au3>
#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region
#AutoIt3Wrapper_icon=C:\Users\Administrator\Downloads\1.ico
#EndRegion

Opt("SendKeyDownDelay", 200)
Opt("SendKeyDelay", 200)
Opt("MouseCoordMode", 1)
Opt("MouseClickDragDelay", 500)
Opt("GUIOnEventMode", 1)
HotKeySet("{PAUSE}", "TogglePause")
Global $g_bPaused = False
Global $aProcessList = ProcessList("WowClassic.exe")
Global $a = 0
Global $wow1 = $aProcessList[1][1]
;~ Global $wow2 = $aProcessList[2][1]
;~ Global $wow3 = $aProcessList[3][1]
;~ Global $wow4 = $aProcessList[4][1]
;~ Global $wow5 = $aProcessList[5][1]
Global $handle1 = _ProcessGetHWnd($wow1, 1, "魔兽世界")
;~ Global $handle2 = _ProcessGetHWnd($wow2, 1, "魔兽世界")
;~ Global $handle3 = _ProcessGetHWnd($wow3, 1, "魔兽世界")
;~ Global $handle4 = _ProcessGetHWnd($wow4, 1, "魔兽世界")
;~ Global $handle5 = _ProcessGetHWnd($wow5, 1, "魔兽世界")



While 1
	Sleep(100)
	Press()
	AntiAFK()
WEnd


Func TogglePause()
    $g_bPaused = Not $g_bPaused
    While $g_bPaused
        Sleep(100)
    WEnd
EndFunc   ;==>TogglePause



Func AntiAFK()
;~ 	ControlSend($handle2, "", "", "1")
;~ 	ControlSend($handle3, "", "", "1")
;~ 	ControlSend($handle4, "", "", "1")
;~ 	ControlSend($handle5, "", "", "1")
EndFunc   ;==>AntiAFK

Func Press()
	ControlSend($handle1, "", "", "1")
	Sleep(100)
	releasekey()
	$a = $a + 1
	Sleep(1500)
	If $a > 57 Then
		Sleep(3000)
		ControlSend($handle1, "", "", "2")
		Sleep(30000)
		ControlSend($handle1, "", "", "{SPACE}")
		releasekey()
		$a = 0
	EndIf
	releasekey()
EndFunc   ;==>Press



Func releasekey()
	Send("{ALTUP}")
	Send("{CTRLUP}")
	Send("{SHIFTUP}")
	Send("{LWINUP}")
	Send("{RWINUP}")
EndFunc   ;==>releasekey


Func _ProcessGetHWnd($iPid, $iOption = 1, $sTitle = "", $iTimeout = 2000)
	Local $aReturn[1][1] = [[0]], $aWin, $hTimer = TimerInit()

	While 1

		; Get list of windows
		$aWin = WinList($sTitle)

		; Searches thru all windows
		For $i = 1 To $aWin[0][0]

			; Found a window owned by the given PID
			If $iPid = WinGetProcess($aWin[$i][1]) Then


				; Option 0 or 1 used
				If $iOption = 1 Or ($iOption = 0 And $aWin[$i][0] <> "") Then
					Return $aWin[$i][1]

					; Option 2 is used
				ElseIf $iOption = 2 Then
					ReDim $aReturn[UBound($aReturn) + 1][2]
					$aReturn[0][0] += 1
					$aReturn[$aReturn[0][0]][0] = $aWin[$i][0]
					$aReturn[$aReturn[0][0]][1] = $aWin[$i][1]
				EndIf
			EndIf
		Next

		; If option 2 is used and there was matches then the list is returned
		If $iOption = 2 And $aReturn[0][0] > 0 Then Return $aReturn

		; If timed out then give up
		If TimerDiff($hTimer) > $iTimeout Then ExitLoop

		; Waits before new attempt
		Sleep(Opt("WinWaitDelay"))
	WEnd



	; No matches
	SetError(1)
	Return 0
EndFunc   ;==>_ProcessGetHWnd
