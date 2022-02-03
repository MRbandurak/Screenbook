;BaseFunctions.au3
Func _HndError($msg, $mod = 49)
	$exit = MsgBox(49, @ScriptName, $msg)
	If Not @Compiled Then ConsoleWrite($msg & @CRLF)
	Switch $exit
		Case 1
			$exit = 0
		Case 2
			$exit = 1
	EndSwitch
	
	If $exit Then Exit
EndFunc   ;==>_HndError

Func _Clipboard_screenshot()
$err = False
;$hHBITMAP = _ScreenCapture_Capture("", $int_Xstart, $int_Ystart, $int_Xend, $int_Yend); - hawe a problem with variables for some reason
$hHBITMAP = _ScreenCapture_Capture("", 435, 0, 1164, 899)
If Not _ClipBoard_Open(0) Then
    $err = @error
    $err_txt = "_ClipBoard_Open failed!"
EndIf
If Not _ClipBoard_Empty() Then
    $err = @error
    $err_txt = "_ClipBoard_Empty failed!"
EndIf
If Not _ClipBoard_SetDataEx($hHBITMAP, $CF_BITMAP) Then
    $err = @error
    $err_txt = "_ClipBoard_SetDataEx failed!"
EndIf
_ClipBoard_Close()
_WinAPI_DeleteObject($hHBITMAP)
EndFunc 