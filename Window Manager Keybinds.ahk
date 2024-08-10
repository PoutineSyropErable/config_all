; Send F11 to the active window with Win + F

; Minimize the active window with Win + N







#f::
    if (toggle:=!toggle)
        WinMaximize % "ahk_id " _hwnd := WinExist("A")
    else
        WinRestore, % "ahk_id " _hwnd
return

!d:: ; Alt + F
Send, {F11}
return



#n::
    if (toggle:=!toggle)
        WinMaximize % "ahk_id " _hwnd := WinExist("A")
    else
        WinRestore, % "ahk_id " _hwnd
return



; Kill the active window with Win + ;
#;:: ; Win + ;
WinKill, A
return


; Close the active window with Win + q
#q:: ; Win + q
WinKill, A
return
