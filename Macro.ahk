#Include %A_ScriptDir%\Lib\FindText.ahk
#Persistent
CoordMode, Mouse, Screen
CoordMode, Win, Screen
SetTitleMatchMode, 2
global loopRunning := false 

SysGet, screenWidth, 78
SysGet, ScreenHeight, 79
guiX := screenWidth - 200
guiY := 10

; Main GUI
Gui, +AlwaysOnTop +ToolWindow -Caption
Gui, Margin, 10, 10
Gui, Font, s10, Arial
Gui, Add, Text, cWhite, Instructions
Gui, Add, Text, cWhite, F1: Start Macro
Gui, Add, Text, cWhite, F2: Pause Macro
Gui, Add, Text, cWhite, F3: Resize Roblox 
Gui, Add, Text, cWhite, Q: Exit Macro
Gui, Font, s7.5, Arial
Gui, Add, Text, cGray, @fen6i - Discord
Gui, Color, Black
Gui, Add, Button, x10 y+10 w180 h30 gOpenFeatures, Open Features
Gui, Show, NoActivate x%guiX% y%guiY%, Macro Instructions

; Main GUI Hotkeys
F1::
    loop := True
    Send, {Tab}
    Sleep, 500

    MouseMove, 1629, 815
    Click
    Sleep, 120

    MouseMove, 1355, 670
    Click
    Sleep, 120
    
    Send, {d Down}
    Sleep, 2300
    Send, {d Up}

    Sleep 300

    Send, {w Down}
    Sleep, 3300
    Send, {w Up}

    Sleep 120

    MouseMove, 1563, 586
    Click
    Sleep, 120

    MouseMove, 1146, 579
    Click
    Sleep, 120

    MouseMove, 1265, 778
    Click
    Sleep, 120

    MouseMove, 1198, 655
    Click
    Sleep, 120

    MouseMove, 1265, 807
    Click
    Sleep, 120

    Sleep, 9300
        While, loop {
            Vote:="|<>*119$25.QS00TTU08wk04QTbv6SzykA63MA39aAMVla0kMnbzANk87ww63zzzzk"

            if (ok:=FindText(X, Y, 1266-150000, 435-150000, 1266+150000, 435+150000, 0, 0, Vote))
            {
                MouseMove, X, Y, L
                Click 
                Click
                Click
            }
            
            Next:="|<>*125$46.C1k00001wTU000yANb0003wkqA000Mn3snwQRXg7XzzvyDkCD0twk70Ms13W0Q1X06081l0AQQ1sT60k1sDXwQ307UyDlkATw1sT7Uk3U3UQT3U4CD1lyD0twyDzzzzzzzzzzzzzzzU"
        
            if (ok:=FindText(X, Y, 770-150000, 426-150000, 770+150000, 426+150000, 0, 0, Next))
            {
                MouseMove, X, Y, L
                Click 
                Click
                Click
            }
        
            Replay:="|<>*120$82.0000000000000000000000000000000000000000000000000k000000zk0000Dk000007zs0001X000000k1k0006400000301U000ME00000A060001V000000k0Bzbza4Dzy7U33ky7PrMFrjQn0AB3U707VA0Mq40kwA0Q0C5U11sM33UU0k0MQ06730A02731VVkEQAA0k0M0AC673Vk0U301U0ksMQS7U60A067z3VVksS0E0kw8Sw06301g3032kU1k0s606MA0A930707UM0NVU0laD0Q9n1sFa601yDjzky7xzwkk01UMDn207UnX3000000A800008M000000kU0001VU00000360000340000007s0000Dk2"
        
            if (ok:=FindText(X, Y, 935-150000, 151-150000, 935+150000, 151+150000, 0, 0, Replay)) {
                MouseMove, X, Y, L
                Click 
                Click
                Click
            }
        }
F2:: 
    GuiControl,, MacroStatus, Status: Paused
    loop := false 
return 

F3::
    WinGetActiveTitle, activeWindow
    if (activeWindow != "") {
        xPos := 855
        yPos := 310
        width := 816
        height := 638

        WinMove, %activeWindow%,, %xPos%, %yPos%, %width%, %height%
        MsgBox, Successfully Resized and Repositioned %activeWindow%
    } else {
        MsgBox, Could not find active window
    }
return 

F4::
    WinGetActiveTitle, activeWindow
    if (activeWindow != "") {
        winGetPos, xPos, yPos, width, height, %activeWindow%
        MsgBox, Active window:n%activeWindow%nnPosition:nX: %xPos%nY: %yPos%nnSize:nWidth: %width%nHeight: %height%
    }
return 

q::
    ExitApp

; Functionality for "Open Features" button
OpenFeatures:
    Gui, 2:Destroy  ; Ensure any existing Features GUI is destroyed first
    Gui, 2:+AlwaysOnTop +ToolWindow -Caption
    Gui, 2:Margin, 10, 10
    Gui, 2:Font, s10, Arial
    Gui, 2:Color, Black

    ; Position the Features GUI to the left of the main GUI
    featuresGuiX := guiX - 210  ; Adjust to position next to the main GUI
    featuresGuiY := guiY

    Gui, 2:Add, Text, cWhite, Features:
    Gui, 2:Add, Text, cWhite, - Image detection
    Gui, 2:Add, Text, cWhite, - Automaticlly Starts the Game
    Gui, 2:Add, Text, cWhite, - Fully automatic
    Gui, 2:Add, Text, cWhite, - 12k+ Gems a day
    Gui, 2:Add, Button, w180 h30 gCloseFeatures cWhite BackgroundBlack, Close
    Gui, 2:Show, NoActivate x%featuresGuiX% y%featuresGuiY%, Features
return

SendWebhook(message) {
    global webhookUrl
    http := ComObjCreate("WinHttp.WinHttpRequest.5.1")
    http.Open("POST", webhookUrl, false)
    http.SetRequestHeader("Content-Type", "application/json")
    json := "{""content"":""" message """}"
    http.Send(json)
}

CloseFeatures:
    Gui, 2:Destroy
return