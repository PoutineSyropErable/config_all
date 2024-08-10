#Persistent
#NoEnv

; Define the base path to your icons
iconBasePath := "C:\Users\Francois\Documents\Icons\Numbers\"

; Default icon (optional)
currentIcon := iconBasePath . "1.ico"
Menu, Tray, Icon, %currentIcon%

; Hotkeys to change the tray icon
#1::  ; Windows + 1
ChangeIcon("1.ico")
return

#2::  ; Windows + 2
ChangeIcon("2.ico")
return

#3::  ; Windows + 3
ChangeIcon("3.ico")
return

#4::  ; Windows + 3
ChangeIcon("4.ico")
return

#5::  ; Windows + 3
ChangeIcon("5.ico")
return

#6::  ; Windows + 3
ChangeIcon("6.ico")
return

#7::  ; Windows + 3
ChangeIcon("7.ico")
return

#8::  ; Windows + 3
ChangeIcon("8.ico")
return

#9::  ; Windows + 3
ChangeIcon("9.ico")
return

#0::  ; Windows + 3
ChangeIcon("10.ico")
return


; Add more hotkeys as needed...

; Function to change the tray icon
ChangeIcon(iconFile) {
    global iconBasePath
    global currentIcon

    ; Update the icon path
    currentIcon := iconBasePath . iconFile

    ; Update the tray icon
    Menu, Tray, Icon, %currentIcon%
}

