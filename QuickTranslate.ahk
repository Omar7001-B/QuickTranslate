#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
SetTitleMatchMode, 2
CoordMode, Screen
Menu, Tray, Icon, Shell32.dll, 155
; Sending a word to a translator
XButton1::
$^+r::
    WinGetActiveTitle, current_window
    CopySelected()
    SendToTranslator()
    WinActivate, %current_window%
return

; Get the selection to youglish
XButton2::
    RightClickRunYouglish()
return

; Setting all macros inside obsidian
; Converting seleciton to red line through
$^+q::
    ; Set up macros @r --> red & @g --> green
    RedLineThrough()
    Sleep, 100
    Green()

return

;---------------------------------Functions---------------------------------
; setting @r to make text red line through

CopySelected(){
    if(WinActive("Obsidian")){
        SendInput, "
        SendInput, {NumpadAdd}
        SendInput, y
    }
    else {
        SendInput, ^c
    }

    IfWinNotExist, Google Translate
    {
        Run, chrome.exe "https://translate.google.com.eg/" "--new-window"
        Sleep, 6000
    }
}

SendToTranslator(){
    Sleep, 100
    WinActivate, Google Translate
    SendInput, !d
    Sleep, 100
    SendInput, ^v
    RegExReplace(Clipboard, ".*?[a-zA-Z-(']+" , , wrd, -1, 1)
    Sleep, 1000
    if(wrd < 4){
        SendInput, !l
    }
    Sleep, 2000
}

RightClickRunYouglish(){
    if(WinActive("Chrome")){
        SendInput, {AppsKey}
        Sleep, 100
        SendInput, {Up}
        SendInput, {Up}
        SendInput, {Up}
        Sleep, 50
        SendInput, {Enter}

    }
}

RedLineThrough(){
    SendInput, qr
    SendInput, s<span style="text-decoration: line-through; color:red;">
    SendInput, {Esc}
    SendInput, p
    SendInput, a
    SendInput, </span>
    SendInput, {Esc}
    SendInput, ll
    SendInput, q
}

Green(){
    SendInput, qg
    SendInput, s<span style="color:green;">
    SendInput, {Esc}
    SendInput, p
    SendInput, a
    SendInput, </span>
    SendInput, {Esc}
    SendInput, ll
    SendInput, q
}

; Testing counting number of words
;Numpad0::

;RegExReplace(Clipboard, ".*?[a-zA-Z-(']+" , , OutputVarCount, -1, 1)
;MsgBox, %OutputVarCount% words!

;return
