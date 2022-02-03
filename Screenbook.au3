;*****************************************
;Screenbook.au3 by gmjan
;Created with ISN AutoIt Studio v. 1.11
;*****************************************


#include <ScreenCapture.au3>
#include <MsgBoxConstants.au3>
#include <ClipBoard.au3>
#include <GuiRichEdit.au3>
;GUI
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
;USER
#include <BaseFunctions.au3>
#include <GUI_variables.au3>
#include <Screenbook_GUI.au3>

Opt("WinTitleMatchMode", 2)

Local $hbitmap
$start = MsgBox($MB_YESNO, "Welcome to Screenbook", "Program Screenbook is created to make a pdf file by taking " & @LF & "screenshots in defined size on full screen" & @LF & @LF & "Do you wish to star?")
If $start = 6 Then
_create_window()
Runwait (@ComSpec & " /c " & 'cd ' & @ScriptDir)
Runwait (@ComSpec & " /c " & 'cd .>' & $str_Filename)
$ID_wordpad = Run ('C:\Program Files\Windows NT\Accessories\wordpad.exe ' & $str_Filename, @ScriptDir, @SW_MINIMIZE)
WinWait("WordPad")
Send("!{TAB}")
Sleep (100)
WinActivate("WordPad")
Send("!{TAB}")
Sleep (1000)	
For $i = 1 To $int_Pageammount 
_Clipboard_screenshot()
Send("!{TAB}")
$hndl_wordpad = ControlGetHandle("WordPad", "", 59648)
_GUICtrlRichEdit_Paste ( $hndl_wordpad )
Sleep(500)
Send("!{TAB}")
Sleep(500)
Send("{PGDN}")
Sleep(500)
Next 
EndIf 
