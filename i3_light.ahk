#Persistent
#NoEnv

DesktopCount   = 9 ; Windows starts with 2 desktops at boot
CurrentDesktop = 1 ; Desktop count is 1-indexed (Microsoft numbers them this way)
mapDesktopsFromRegistry()
OutputDebug, [loading] desktops: %DesktopCount% current: %CurrentDesktop%



; Define the base path to your icons
iconBasePath := "C:\Users\Francois\Documents\Icons\Numbers\"

; Default icon (optional)
currentIcon := iconBasePath . "1.ico"
Menu, Tray, Icon, %currentIcon%

#1::switchDesktopByNumber(1) 	; WIN-1
#2::switchDesktopByNumber(2) 	; WIN-2
#3::switchDesktopByNumber(3) 	; WIN-3
#4::switchDesktopByNumber(4) 	; WIN-4
#5::switchDesktopByNumber(5) 	; WIN-5
#6::switchDesktopByNumber(6) 	; WIN-6
#7::switchDesktopByNumber(7) 	; WIN-7
#8::switchDesktopByNumber(8) 	; WIN-8
#9::switchDesktopByNumber(9) 	; WIN-9
#0::switchDesktopByNumber(10) 	; WIN-0



; Function to change the tray icon
ChangeIcon(iconFile) {
	global iconBasePath ;
	global currentIcon

	; Update the icon path
	currentIcon := iconBasePath . iconFile

	; Update the tray icon
	Menu, Tray, Icon, %currentIcon%
}


; Function to concatenate a number with ".ico"
FormatIconFile(number) {
    ; Ensure the input is treated as a string
    iconFile := number . ".ico"
    return iconFile
}

SetIcon(number) {
	ChangeIcon( FormatIconFile(number))
}


; This function examines the registry to build an accurate list of the current virtual desktops and which one we're currently on.
; Current desktop UUID appears to be in HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\SessionInfo\1\VirtualDesktops
; List of desktops appears to be in HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VirtualDesktops
;
mapDesktopsFromRegistry() {

	global CurrentDesktop, DesktopCount
	; Get the current desktop UUID. Length should be 32 always, but there's no guarantee this couldn't change in a later Windows release so we check.

	IdLength := 32
	SessionId := getSessionId()

	if (SessionId) {
			RegRead, CurrentDesktopId, HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\SessionInfo\%SessionId%\VirtualDesktops, CurrentVirtualDesktop

			if (CurrentDesktopId) {
				IdLength := StrLen(CurrentDesktopId)

			}
		}

	; Get a list of the UUIDs for all virtual desktops on the system
	RegRead, DesktopList, HKEY_CURRENT_USER, SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VirtualDesktops, VirtualDesktopIDs

	if (DesktopList) {
		DesktopListLength := StrLen(DesktopList)
		; Figure out how many virtual desktops there are
		DesktopCount := DesktopListLength / IdLength
		}
	else {
		DesktopCount := 1
		}


	; Parse the REG_DATA string that stores the array of UUID's for virtual desktops in the registry.
	i := 0
	while (CurrentDesktopId and i < DesktopCount) {
		StartPos := (i * IdLength) + 1
			DesktopIter := SubStr(DesktopList, StartPos, IdLength)
			OutputDebug, The iterator is pointing at %DesktopIter% and count is %i%.
			; Break out if we find a match in the list. If we didn't find anything, keep the
			; old guess and pray we're still correct :-D.
			if (DesktopIter = CurrentDesktopId) {
				CurrentDesktop := i + 1
				OutputDebug, Current desktop number is %CurrentDesktop% with an ID of %DesktopIter%.
				break
			  }
		  i++
		}
}








; This functions finds out ID of current session.
;
getSessionId()
{
ProcessId := DllCall("GetCurrentProcessId", "UInt")
			   if ErrorLevel {
				   OutputDebug, Error getting current process id: %ErrorLevel%
					   return
			   }
		   OutputDebug, Current Process Id: %ProcessId%
			   DllCall("ProcessIdToSessionId", "UInt", ProcessId, "UInt*", SessionId)
			   if ErrorLevel {
				   OutputDebug, Error getting session id: %ErrorLevel%
					   return
			   }
		   OutputDebug, Current Session Id: %SessionId%
			   return SessionId
}
;







; This function switches to the desktop number provided.
;
switchDesktopByNumber(targetDesktop)
{
	global CurrentDesktop, DesktopCount
	; Re-generate the list of desktops and where we fit in that. We do this because
	; the user may have switched desktops via some other means than the script.

	mapDesktopsFromRegistry()

	; Don't attempt to switch to an invalid desktop
	if (targetDesktop > DesktopCount || targetDesktop < 1) {
		OutputDebug, [invalid] target: %targetDesktop% current: %CurrentDesktop%
		return
	}

	; Go right until we reach the desktop we want
	while(CurrentDesktop < targetDesktop) {
		Send ^#{Right}
		CurrentDesktop++
		OutputDebug, [right] target: %targetDesktop% current: %CurrentDesktop%
	}

; Go left until we reach the desktop we want
	while(CurrentDesktop > targetDesktop) {
		Send ^#{Left}
		CurrentDesktop--
			OutputDebug, [left] target: %targetDesktop% current: %CurrentDesktop%
	}

	SetIcon(targetDesktop)
	return

}









;
; This function creates a new virtual desktop and switches to it
;
createVirtualDesktop()
{
	global CurrentDesktop, DesktopCount
		Send, #^d
		DesktopCount++
		CurrentDesktop = %DesktopCount%
		OutputDebug, [create] desktops: %DesktopCount% current: %CurrentDesktop%
}
;
; This function deletes the current virtual desktop
;
deleteVirtualDesktop()
{
	global CurrentDesktop, DesktopCount
		Send, #^{F4}
	DesktopCount--
		CurrentDesktop--
		OutputDebug, [delete] desktops: %DesktopCount% current: %CurrentDesktop%
}







;------- Start of other customs keybinds





#a:: ; Windows + A
Send, ^{PgUp} ; Sends Ctrl + Page Up (common for going up in lists or switching tabs)
return

#z:: ; Windows + Z
Send, ^{PgDn} ; Sends Ctrl + Page Down (common for going down in lists or switching tabs)
return


#s:: ; Windows + S
Click Left
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
; toggle Minimise -- Not really usefull since you can't unminimise the now inactive winmdow. So, it's just straight up minimize untill I change it


; Close the active window with Win + ;
#;:: ; Win + ;
WinClose, A
return


; Close the active window with Win + q
#+;:: ; Win + Shift+ ;
WinKill, A
return



#<:: ; Windows + Enter To open Arch WSL
Run wt new-tab -p "{a5a97cb8-8961-5535-816d-772efe0c6a3f}" --startingDirectory "~"
return

#w::
Run firefox

#p::     ; Windows + To open Developper Powershell
Run wt new-tab -p  "{701794fd-607c-5404-a93a-538ab1bd5727}" --startingDirectory "~"


#c:: ; Windows+ c for file explorer
Run explorer.exe

#Enter::
Run C:\Users\Francois\AppData\Local\Microsoft\WindowsApps\gwsl.exe --r --wsl_machine="Arch" --wsl_cmd="kitty" --w_mode="Multi Window" --clip_enabled="Default" --gtk_scale="Default" --qt_scale="Default" --append="" --theme="follow" --root="false" --dbus="false" --



; Set your hotkey to open the program
^!p:: ; Ctrl + Alt + P
{
    ; Get the mouse position
    MouseGetPos, mouseX, mouseY
    MsgBox, Mouse Position: X=%mouseX% Y=%mouseY%

    ; Retrieve monitor information and identify which monitor the mouse is on
    SysGet, MonitorCount, MonitorCount
    MsgBox, Number of Monitors: %MonitorCount%

    Loop, %MonitorCount%
    {
        SysGet, Monitor, Monitor, %A_Index%
        MsgBox, Monitor %A_Index%: Left=%MonitorLeft% Top=%MonitorTop% Right=%MonitorRight% Bottom=%MonitorBottom%

        if (mouseX >= MonitorLeft && mouseX <= MonitorRight && mouseY >= MonitorTop && mouseY <= MonitorBottom)
        {
            TargetMonitor := A_Index
            MsgBox, Mouse is on Monitor %TargetMonitor%
            break
        }
    }

    ; Run the program (replace with the actual path to your program)
    Run, notepad.exe, , , PID

    ; Wait for the window to appear
    WinWait, ahk_pid %PID%

    ; Move the window to the detected monitor
    SysGet, Monitor, Monitor, %TargetMonitor%

    newX := MonitorLeft + 100 ; Offset from the left edge
    newY := MonitorTop + 100  ; Offset from the top edge
    MsgBox, Moving window to X=%newX% Y=%newY%

    WinMove, ahk_pid %PID%, , %newX%, %newY%
}



