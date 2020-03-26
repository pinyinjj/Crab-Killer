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

Global $aProcessList = ProcessList("WowClassic.exe")
Global $a = 0
Global $i = False
Global $j = False
Global $g_bPaused = False
Global $msgcount = 0
HotKeySet("{PAUSE}", "_exit")



GUICreate("螃蟹杀手", 253, 124, 192, 124)
GUICtrlCreateLabel("窗口数量", 16, 20, 50, 17)
Local $iWindow = GUICtrlCreateCombo("1", 74, 16, 41, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
GUICtrlSetOnEvent(-1, "WindowCount")
GUICtrlSetData($iWindow, "2|3|4|5", "1")
Local $idCheckbox = GUICtrlCreateCheckbox("运行/停止", 20, 56, 80, 17)
GUICtrlSetOnEvent(-1, "Press")
Local $iAntiAFK = GUICtrlCreateCheckbox("小号防暂离", 20, 88, 80, 17)
GUICtrlSetOnEvent(-1, "AntiAFK")
$Input1 = GUICtrlCreateInput("50", 184, 16, 49, 21)
GUICtrlSetOnEvent(-1, "_exit")
GUICtrlCreateLabel("技能次数", 128, 19, 50, 17)
$Button1 = GUICtrlCreateButton("关闭", 160, 80, 67, 25)
GUICtrlSetOnEvent(-1, "_exit")
GUISetOnEvent($GUI_EVENT_CLOSE, "_exit")
$sk = GUICtrlRead($Input1)
GUISetState(@SW_SHOW)


While 1
	Sleep(100)
WEnd

Func _exit()
	If @GUI_CtrlId = $GUI_EVENT_CLOSE Then
	releasekey()
	Exit
	EndIf
EndFunc   ;==>_exit

Func WindowCount()
	$cvalue = GUICtrlRead($iWindow)
	If $msgcount < 2 Then
		MsgBox($MB_SYSTEMMODAL, "", "当前窗口数量为:" & $cvalue, 10)
		$msgcount = $msgcount + 1
	EndIf
	If $cvalue == 1 Then
		Global $wow1 = $aProcessList[1][1]
		Global $handle1 = _ProcessGetHWnd($wow1, 1, "魔兽世界")
	ElseIf $cvalue == 2 Then
		Global $wow1 = $aProcessList[1][1]
		Global $wow2 = $aProcessList[2][1]
		Global $handle1 = _ProcessGetHWnd($wow1, 1, "魔兽世界")
		Global $handle2 = _ProcessGetHWnd($wow2, 1, "魔兽世界")
	ElseIf $cvalue == 3 Then
		Global $wow1 = $aProcessList[1][1]
		Global $wow2 = $aProcessList[2][1]
		Global $wow3 = $aProcessList[3][1]
		Global $handle1 = _ProcessGetHWnd($wow1, 1, "魔兽世界")
		Global $handle2 = _ProcessGetHWnd($wow2, 1, "魔兽世界")
		Global $handle3 = _ProcessGetHWnd($wow3, 1, "魔兽世界")
	ElseIf $cvalue == 4 Then
		Global $wow1 = $aProcessList[1][1]
		Global $wow2 = $aProcessList[2][1]
		Global $wow3 = $aProcessList[3][1]
		Global $wow4 = $aProcessList[4][1]
		Global $handle1 = _ProcessGetHWnd($wow1, 1, "魔兽世界")
		Global $handle2 = _ProcessGetHWnd($wow2, 1, "魔兽世界")
		Global $handle3 = _ProcessGetHWnd($wow3, 1, "魔兽世界")
		Global $handle4 = _ProcessGetHWnd($wow4, 1, "魔兽世界")
	ElseIf $cvalue == 5 Then
		Global $wow1 = $aProcessList[1][1]
		Global $wow2 = $aProcessList[2][1]
		Global $wow3 = $aProcessList[3][1]
		Global $wow4 = $aProcessList[4][1]
		Global $wow5 = $aProcessList[5][1]
		Global $handle1 = _ProcessGetHWnd($wow1, 1, "魔兽世界")
		Global $handle2 = _ProcessGetHWnd($wow2, 1, "魔兽世界")
		Global $handle3 = _ProcessGetHWnd($wow3, 1, "魔兽世界")
		Global $handle4 = _ProcessGetHWnd($wow4, 1, "魔兽世界")
		Global $handle5 = _ProcessGetHWnd($wow5, 1, "魔兽世界")
	EndIf
EndFunc   ;==>WindowCount

Func _IsChecked($idControlID)
	Return BitAND(GUICtrlRead($idControlID), $GUI_CHECKED) = $GUI_CHECKED
EndFunc   ;==>_IsChecked

Func TogglePause()
	$g_bPaused = Not $g_bPaused
	While $g_bPaused
		Sleep(100)
	WEnd
EndFunc   ;==>TogglePause

Func AntiAFK()
	$cvalue = GUICtrlRead($iWindow)
	If $cvalue == 2 Then
		ControlSend($handle2, "", "", "1")
		Sleep(100)
	ElseIf $cvalue == 3 Then
		ControlSend($handle2, "", "", "1")
		Sleep(100)
		ControlSend($handle3, "", "", "1")
		Sleep(100)
	ElseIf $cvalue == 4 Then
		ControlSend($handle2, "", "", "1")
		Sleep(100)
		ControlSend($handle3, "", "", "1")
		Sleep(100)
		ControlSend($handle4, "", "", "1")
		Sleep(100)
	ElseIf $cvalue == 5 Then
		ControlSend($handle2, "", "", "1")
		Sleep(100)
		ControlSend($handle3, "", "", "1")
		Sleep(100)
		ControlSend($handle4, "", "", "1")
		Sleep(100)
		ControlSend($handle5, "", "", "1")
		Sleep(100)
	EndIf
EndFunc   ;==>AntiAFK

Func Press()
	While 1
		If _IsChecked($idCheckbox) Then
			ControlSend($handle1, "", "", "1")
			Sleep(100)
			releasekey()
			$a = $a + 1
			Sleep(1500)
			If $a > $sk Then
				If _IsChecked($iAntiAFK) Then
					AntiAFK()
				EndIf
				Sleep(5000)
				ControlSend($handle1, "", "", "2")
				Sleep(30000)
				ControlSend($handle1, "", "", "{SPACE}")
				releasekey()
				$a = 0
			EndIf
			releasekey()
		Else
			Sleep(100)
		EndIf
	WEnd
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
