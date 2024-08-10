ne. 



#a:: ; Windows + A
Send, ^{PgUp} ; Sends Ctrl + Page Up (common for going up in lists or switching tabs)
return

#z:: ; Windows + Z
Send, ^{PgDn} ; Sends Ctrl + Page Down (common for going down in lists or switching tabs)
return


#s:: ; Windows + S
Click Right
return
; this will be usefull when you miss click on windows pageup/down for stack swap on same fancy zo


;-----------------------------------------------

#f::   ;  Windows + F
    if (toggle:=!toggle)
        WinMaximize % "ahk_id " _hwnd := WinExist("A")
    else
        WinRestore, % "ahk_id " _hwnd
return         

#+f:: ; Windows + Shift + F
Send, {F11}
return



#n::	; Windows + n
    if (toggle:=!toggle)
        WinMinimize % "ahk_id " _hwnd := WinExist("A")
    else
        WinRestore, % "ahk_id " _hwnd
return
; toggle Minimise -- Not really usefull since you can't minimise


; Kill the active window with Win + ;
#;:: ; Win + ;
WinKill, A
return


; Close the active window with Win + q
#q:: ; Win + q
WinKill, A
return



#Enter:: ; Windows + Enter
Run "C:\Program Files\WSL\wslg.exe" -d Arch --cd "~" -- kitty
return
