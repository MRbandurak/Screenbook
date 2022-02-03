;Screenbook_GUI.au3

;$int_Pageammount ,$str_Filename ,$int_Xstart ,$int_Xend ,$int_Ystart ,$int_Yend

Func _create_window()
$ID_window = GUICreate("ScreenBook", 172, 220, 192, 124, $WS_DLGFRAME)
GUICtrlCreateLabel("Number of pages:  ", 16, 120, 94, 17)
GUICtrlCreateLabel("Output file name:   ", 16, 144, 93, 17)
$ID_input_pgs = GUICtrlCreateInput($int_Pageammount, 104, 120, 49, 21)
$ID_input_flname = GUICtrlCreateInput($str_Filename, 16, 160, 137, 21)
GUICtrlCreateLabel("X - End", 16, 40, 39, 17)
GUICtrlCreateLabel("X - Start", 16, 16, 42, 17)
$ID_input_Xstart = GUICtrlCreateInput($int_Xstart, 64, 16, 49, 21)
$ID_input_Xend = GUICtrlCreateInput($int_Xend, 64, 40, 49, 21)
GUICtrlCreateLabel("Y - End", 16, 88, 39, 17)
GUICtrlCreateLabel("Y - Start", 16, 64, 42, 17)
$ID_input_Ystart = GUICtrlCreateInput($int_Ystart, 64, 64, 49, 21)
$ID_input_Yend = GUICtrlCreateInput($int_Yend, 64, 88, 49, 21)

$ID_Button_Start = GUICtrlCreateButton("Start", 120, 32, 35, 25)
$ID_Button_Exit = GUICtrlCreateButton("Exit", 120, 72, 35, 25)
GUISetState(@SW_SHOW)
While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $ID_Button_Exit
			Exit
		Case $ID_Button_Start
			$int_Pageammount = ControlGetText("ScreenBook", '', $ID_input_pgs)
			$str_Filename = ControlGetText("ScreenBook", '', $ID_input_flname)
			$int_Xstart = ControlGetText("ScreenBook", '', $ID_input_Xstart)
			$int_Xend = ControlGetText("ScreenBook", '', $ID_input_Xend)
			$int_Ystart = ControlGetText("ScreenBook", '', $ID_input_Ystart)
			$int_Yend = ControlGetText("ScreenBook", '', $ID_input_Yend)
			If @error Then _HndError("! missing input variable" & @CRLF & @ScriptName & '  ' & @error )
			GUISetState(@SW_HIDE)
			ExitLoop
	EndSwitch
WEnd
EndFunc
