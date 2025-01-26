#Include %A_ScriptDir%\Lib\FindText.ahk
#Persistent
CoordMode, Mouse, Screen
CoordMode, Win, Screen
StartTime := A_TickCount
MacroStartTime := A_TickCount
SetTitleMatchMode, 2
WebhookURL := ""

; Display an InputBox for the webhook URL
InputBox, WebhookInput, Enter Webhook URL, Please enter your webhook URL and click OK., , 300, 150
if (ErrorLevel) {
    ; User canceled the input box
    MsgBox, You canceled the input. Webhook function will be disabled.
    WebhookURL := "" ; Ensure the webhook function is disabled
} else if (WebhookInput = "") {
    ; User left the input box blank
    MsgBox, No webhook URL provided. Webhook function will be disabled.
    WebhookURL := "" ; Ensure the webhook function is disabled
} else {
    ; Save the input
    WebhookURL := WebhookInput
    MsgBox, Webhook URL saved: %WebhookURL%
}
; Add elements to the GUI
; Function to send a webhook message
SendWebhookMessage(message) {
    global WebhookURL ; Use the global WebhookURL variable
    if (!WebhookURL || WebhookURL = "") {
        ; If no webhook URL is provided, skip the webhook function
        return
    }
    http := ComObjCreate("WinHttp.WinHttpRequest.5.1")
    http.Open("POST", WebhookURL, false)
    http.SetRequestHeader("Content-Type", "application/json")
    json := "{""content"": """ message """}"
    http.Send(json)
}

SysGet, screenWidth, 78
SysGet, ScreenHeight, 79
guiX := screenWidth - 200
guiY := 10

; Main GUI
Gui, +AlwaysOnTop +ToolWindow -Caption
Gui, Margin, 10, 10
Gui, Font, s10, Arial
Gui, Add, Text, cWhite, Fendi's Gem Macro v0.7
Gui, Add, Text, cWhite, F1: Start Macro
Gui, Add, Text, cWhite, F2: Pause Macro
Gui, Add, Text, cWhite, F3: Resize Roblox 
Gui, Add, Text, cWhite, 0: Exit Macro
Gui, Font, s7.5, Arial
Gui, Add, Text, cGray, @fen6i - Discord
Gui, Color, Black
Gui, Add, Button, x10 y+10 w180 h30 gOpenFeatures, Open Features
Gui, Show, NoActivate x%guiX% y%guiY%, Macro Instructions

; Main GUI Hotkeys
F1::
    loop := True
        SendWebhookMessage("Macro Active")
    LobbyConfirm:="|<>*116$49.nzzVrzzwtywzljzyQyCTxXzzST7DzlzzjDXY20Ezrblm009Tvnwt62QDxtyMX1D7ywz0lUV3zSTkxmsVzjDzzzzzzrbzzzzzzvnzzzzzzxs0000000y0000000zzzzzzzzy"
        if (ok:=FindText(X, Y, 896-150000, 599-150000, 896+150000, 599+150000, 0, 0, LobbyConfirm)) {
            LobbyStart()
        }
        While, loop {
            Vote:="|<>*119$25.QS00TTU08wk04QTbv6SzykA63MA39aAMVla0kMnbzANk87ww63zzzzk"

            if (ok := FindText(X, Y, 500, 300, 1600, 900, 0, 0, Vote))  ; Adjust the area as needed
                {
                    MouseMove, X, Y, L  ; Move the mouse to the found coordinates
                    Click
                    sleep, 150
                    ; Check if the checkbox is checked
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
                Sleep, 65
                Click 
                Sleep, 65
                Click
                Sleep, 65
                Click
                Sleep, 65
                SendWebHookFunc()

                Sleep, 4000

                ok:=FindText(X, Y, outX3, outY3, outX4, outY4, 0.15, 0.15, FindText().PicN("0123456789",2))

                LoadingScreen:="|<>*103$380.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzwDzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz1zzzzzzzzzzzzzzy0zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzUDzzzzzzzzzU0Dzz07zzzzzzzzzzzzzzzzzzzzzzzU0zzzzzzzzzzzzzzzzzzzzk1zzzzzzzzzU00Dzk1zzzzzzzzzzzzzzzzzzzzzzzU01zzzzzzzzzzzzzzzzzzzw0Tzzzzzzzzk000zw0Tzzzzzzzzzzzzzzzw1zzzzzU007zzzzzzzzzzzzzzzzzzz07zzzzzzzzw0003z07zzzzzzzzzzzzzzzz0Dzzzzk000zzzzzzzzzzzzzzzzzzzk1zzzzzzzzz0000Tk1zzzzzzzzzzzzzzzzU3zzzzk0007zzzzzzzzzzzzzzzzzzw0Tzzzzzzzzk0003w0Tzzzzzzzzzzzzzzzs0zzzzs0001zzzzzzzzzzzzzzzzzzz0Dzzzzzzzzw0000z07zzzzzzzzzzzzzzzy0Dzzzw0000Tzzzzzzzzzzzzzzzzzzs3zzzzzzzzz00007k1zzzzzzzzzzzzzzzzU3zzzz00007zzzzzzzzzzzzzzzzzzzzzzzzzzzzzk0001w0Tzzzzzzzzzzzzzzzs0zzzzU0003zzzzzzzzzzzzzzzzzzzzzzzzzzzzzw0Ts0D07zzzzzzzzzzzzzzzy0Dzzzk07y0zzzzzzzzzzzzzzzzzzzzzzzzzzzzzz07z03k1zzzzzzzzzzzzw1zzU3zzzw07zsTzzyTzw1zzzs3zzzzzzzzzzs3zzzzzk1zs0w0Tzw3k7s3k7zzs03z000Tzy03zzzz0Q0zs03zzk07zUC0TzUDzk07zzzzw0Ty0D07zw081w0k0Tzs00TU007zzU1zzzzU607s00Tzk00zk301zk3zk00zzzzz07zk3k1zw000D0003zw003s000zzs0zzzzs001w003zs003w000Dw0Ts003zzzzk1zw0w0Ty0003k000Ty000S000Dzy0Dzzzy000S000Tw000z0001z07w000zzzzw0Ty0D07z0000w0003z0003U003zz07z00TU0070003y0007k000Dk1y0007zzzz07zU3k1zk000D0000zU000s000zzk1zU03s001U000T0000w0003w0T0000zzzzk1zU0w0Ts0003k0007s0006000Tzw0Ts00S000s0007k000D0000T07k000Dzzzw0000T07w0000w0001w07k1k007zz07y007U00A07U1s0D03k0007k1s0703zzzz00007k1z01k0D00k0D03y0TU3zzzk1zU01s0DD03w0S07s0w0300w0S07s0zzzzk0003w0Tk1y03k0z03k1zU7s0zzzw0Ts00S0Dzk1zU7U3z0D03w0D0703z0Dzzzw0000z07w0Tk0w0Ts0w0Tk1y0DzzzU3y007U3zs0Tk1k0zU3k1zU3k1k0zU3zzzz0000Tk1y0Dy0D07y0C0000TU3zzzs0zzk1s0zy0000Q0000w0Ts0w0Q0000zzzzk000Dw0TU3zU3k1zk3U0007s0zzzy0Dzw0S0DzU00070000D07y0D070000Dzzzw000Dz07s0zs0w0Tw0s0003y0DzzzU1zz07U3zs0003k0007k1zU3k1k0007zzzz0007zk1z0Dw0D07z0C0001zU3zzzw0Dzk1s0zy0000w0001w0Ts0w0Q0001zzzzk00Dzw0Tk1z03k1zk3k001zs0zzzz01zw0S0DzU000zU001z07z0D070001zzzzw0Tzzz07w0DU0w0Tw0w0Tzzy0Dzzzs07z07U3zw0Tzzs0zzzk1zk3k1s0zzzzzzz07zzzk1z0000D07z0D07zzzk1zzzy00A01s0zz03zzy07zzw0Tw0w0S07zzzzzzk1zzzw01s0003k1zk3k0Tkzw01zzzk0000S0Dzk0TkzU0zVz07y0D07U0TVzzzzw0Tzzz00S0000w0Tw0y0007z00Dzzy00007U3zy0007w000Dk1zU3k1w000Dzzzz07zzzs07k000D07z0Dk000zk03zzzk0003s0zzU000z0001w0Ts0w0T0001zzzzk1zzzy01y0003k1zk3w000Dy00zzzy0000y0Dzw000Ds000T07y0D07s000Tzzzw0TzzzU0Tk000w0Tw0zU003zU0Dzzzk000TU3zzU003z0007k1zk3k1z0007zzzz07zzzw07y000D0Dz0Dw000zw03zzzy000Ds0zzw000zs001w0Tw0w0Ts001zzzzs3zzzzU1zk0k7s3zk3zU00TzU0zzzzs00Dy0TzzU00Tz000z0Dz0D0Dz000zzzzz1zzzzz0zzVy3z1zz3zy00Tzz0TzzzzU0DzkDzzy00Tzw00Ts7zs7s7zw00zzzzzzzzzzzzzzzzzzzzzzzzz7zzzzzzzzzzzzzzzzzzy1zzzw3zzzzzzzzzzw3zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzTzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy2zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU0Dzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk01zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw00Dzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs001zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy000TzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU003zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz8000zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk0007zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw0000zzzzzzzzzzU"

                if (ok:=FindText(X, Y, 1225-150000, 614-150000, 1225+150000, 614+150000, 0, 0, LoadingScreen)) {
                    Click
                } Else {
                leaveGame()

                LobbyConfirm:="|<>*116$49.nzzVrzzwtywzljzyQyCTxXzzST7DzlzzjDXY20Ezrblm009Tvnwt62QDxtyMX1D7ywz0lUV3zSTkxmsVzjDzzzzzzrbzzzzzzvnzzzzzzxs0000000y0000000zzzzzzzzy"

                if (ok:=FindText(X, Y, 896-150000, 599-150000, 896+150000, 599+150000, 0, 0, LobbyConfirm)) {
                    LobbyStart()
                    }
                }
            }

            IdleKick:="|<>*161$71.000000000001z0000000000/30000000000K60000000000gAC3lsr6sC3rsMWAYNnCMWAWzW6kMH6Mm6k5a7x0Ua4kbx0/48211A9V820KAM632MH2M60g8M4GAka4M4FMMS7XlVA8S7X000000000001"

            if (ok:=FindText(X, Y, 1018-150000, 758-150000, 1018+150000, 758+150000, 0, 0, IdleKick)) {
              MouseMove, X, Y, L
              Click
              Click
            LobbyConfirm:="|<>*116$49.nzzVrzzwtywzljzyQyCTxXzzST7DzlzzjDXY20Ezrblm009Tvnwt62QDxtyMX1D7ywz0lUV3zSTkxmsVzjDzzzzzzrbzzzzzzvnzzzzzzxs0000000y0000000zzzzzzzzy" 
            if (ok:=FindText(X, Y, 896-150000, 599-150000, 896+150000, 599+150000, 0, 0, LobbyConfirm)) {
                    LobbyStart()
                    SendWebhookMessage("succesfully fixed macro")
                }
            }

            LobbyConfirm:="|<>*116$49.nzzVrzzwtywzljzyQyCTxXzzST7DzlzzjDXY20Ezrblm009Tvnwt62QDxtyMX1D7ywz0lUV3zSTkxmsVzjDzzzzzzrbzzzzzzvnzzzzzzxs0000000y0000000zzzzzzzzy" 
            if (ok:=FindText(X, Y, 896-150000, 599-150000, 896+150000, 599+150000, 0, 0, LobbyConfirm)) {
                  LobbyStart()
                  SendWebhookMessage("succesfully fixed macro")
            }
        }


F2:: 
    loop := false 
    SendWebhookMessage("Macro Paused")
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

0::
    ExitApp
return

OpenFeatures:
    Gui, 2:Destroy  ; Ensure any existing Features GUI is destroyed first
    Gui, 2:+AlwaysOnTop +ToolWindow -Caption
    Gui, 2:Margin, 10, 10
    Gui, 2:Font, s10, Arial
    Gui, 2:Color, Black

    ; Position the Features GUI to the left of the main GUI
    featuresGuiX := guiX - 395  ; Adjust to position next to the main GUI
    featuresGuiY := guiY

    Gui, 2:Add, Text, cWhite, Features
    Gui, 2:Add, Text, cWhite, Auto Fixes Macro: Teleport Not working, Infinite Loading Screen 
    Gui, 2:Add, Text, cWhite, Webhooks 
    Gui, 2:Add, Text, cWhite, 100 Procent Fail Proof 
    Gui, 2:Add, Text, cWhite, https://discord.gg/hGT8xd3mJM 
    Gui, 2:Add, Button, w180 h30 gCloseFeatures cWhite BackgroundBlack, Close
    Gui, 2:Show, NoActivate x%featuresGuiX% y%featuresGuiY%, Features
return

LobbyStart() {
    Sleep, 200
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
}

leaveGame() {

    Send, {Esc}
    Sleep, 1000
    LeaveButton:="|<>*99$35.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU0000C00000AzzzzyNzzzzwnzzzztbzzzznDzzzzaTzzzzAzzzzyNzzzzwnzzzztbzzzznDznzzaTzbzzAzzDzyNzyTzwnzwzztbztzznDznzzaTzbzzAzz0zyNzy1zwnzzzztbzzzznDzzzzaTzzzzAzzzzyNzzzzwnzzzztbzzzznDzzzza00000C00000zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs"

    if (ok:=FindText(X, Y, 886-150000, 846-150000, 886+150000, 846+150000, 0, 0, LeaveButton)) {
        MouseMove, X, Y
        Click
        Click
        Click
    }

    Sleep, 1000
    Send, {Enter}
    Sleep, 1000

    AAGame:="|<>*133$63.zzzzzU01w0Tzzyzj48Tlnz7zVtsV3WQLkzwDi00QT2y7zUxs03VsLoTwXjUERD2wXzgRyW3cmLaTxlDwERamNlzb0zX3gaE07ws7wMRUm00zbUzV3yCE07sw7wATlm1kT70z1zyC0C1kM3k3slU1sC0060T000zUq0007zU7zzzyDk0zzlw"

    if (ok:=FindText(X, Y, 1016-150000, 580-150000, 1016+150000, 580+150000, 0, 0, AAGame)) {
        FindText().Click(X, Y, "L")
    }

    PlayButton:="|<>*184$40.zzwTzzzzzUzzzzzy0zzzzzs1zzzzzU3zzzzy03zzzzs07zzzzU0Dzzzy00Dzzzs00TzzzU00zzzy000zzzs001zzzU00Dzzy003zzzs00TzzzU03zzzy00zzzzs07zzzzU0zzzzy0Dzzzzs1zzzzzUDzzzzy3zzzzzwTzzy"

    if (ok:=FindText(X, Y, 1020-150000, 857-150000, 1020+150000, 857+150000, 0, 0, PlayButton)) {
        MouseMove, X, Y 
        Sleep, 1800
        Click
        Sleep, 300
        Click
        Sleep, 300
        Click
        Sleep, 300
    }

    Sleep, 5000

    LobbyConfirm:="|<>*116$49.nzzVrzzwtywzljzyQyCTxXzzST7DzlzzjDXY20Ezrblm009Tvnwt62QDxtyMX1D7ywz0lUV3zSTkxmsVzjDzzzzzzrbzzzzzzvnzzzzzzxs0000000y0000000zzzzzzzzy" 
        if (ok:=FindText(X, Y, 896-150000, 599-150000, 896+150000, 599+150000, 0, 0, LobbyConfirm)) 
        {
            LobbyStart()
        }
}

F5::
    leaveGame()
return

CloseFeatures:
    Gui, 2:Destroy
return


Placeorwin() {

    Loop, 13 {
        MouseClick, WheelUp  
        Sleep, 65  
    } 
    
    Loop, 78  {
       DllCall("mouse_event", "UInt", 0x01, "UInt", 0, "UInt", 100, "UInt", 0, "UInt", 0)  ; Move mouse down
       Sleep, 5  
    }
    
    Loop, 13  
    {
       MouseClick, WheelDown 
       Sleep, 65  
    } 
       Sleep, 5000
       send 1
       Click
}

F6::Placeorwin()


SendWebHookFunc() {
    global StartTime, WebhookURL  

    TotalElapsedTime := A_TickCount - StartTime 
    ElapsedMinutes := Floor(TotalElapsedTime / 60000) 
    ElapsedSeconds := Floor(Mod(TotalElapsedTime / 1000, 60)) 

    ElapsedTimeMessage := ElapsedMinutes . " minute" . (ElapsedMinutes != 1 ? "s" : "") . " and " . ElapsedSeconds . " second" . (ElapsedSeconds != 1 ? "s" : "")

    Message := "Round Finished after: " . ElapsedTimeMessage

    if (!WebhookURL || WebhookURL = "") {
        return  
    }

    SendWebhookMessage(Message)

    StartTime := A_TickCount
}

F7::reload 
