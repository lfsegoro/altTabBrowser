#ifwinactive, ahk_class Chrome_WidgetWin_1
#NoEnv
#SingleInstance Force
SetTitleMatchMode, 2

isEdgeTabSwitch := false
tabPressedCount := 0

; Only trigger when Alt + Tab is pressed inside Edge
Alt & Tab::
;if (WinActive("ahk_class Chrome_WidgetWin_1")) {
    if (!isEdgeTabSwitch) {
        isEdgeTabSwitch := true
        tabPressedCount := 0
        Send ^+a  ; Show Edge's tab list
        Sleep 300
    }

    tabPressedCount++
    if (tabPressedCount = 1) {
        Send {Tab}
    } else {
        Send {Tab 2} ; 2 tabs for 2nd+ press
    }
;}
return

~Alt::
    KeyWait, Alt
    if (isEdgeTabSwitch) {
        Sleep 150
        Send {Enter}
        isEdgeTabSwitch := false
        tabPressedCount := 0
    }
return
