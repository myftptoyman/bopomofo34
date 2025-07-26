
InitWindowDetection()

RemoveResetToolTip() {
    ToolTip,,,,3
}


IsOnChineseIME() {
    try {
        DetectHiddenWindows, On
        VarSetCapacity(guiThreadInfo, 72, 0) ; x64 結構大小為 72 bytes
        NumPut(72, guiThreadInfo, 0, "UInt")
        DllCall("GetGUIThreadInfo", "UInt", 0, "Ptr", &guiThreadInfo)
        hWnd := NumGet(guiThreadInfo, 16, "Ptr") ; x64 offset 為 16

        threadId := DllCall("GetWindowThreadProcessId", "Ptr", hWnd, "Ptr", 0, "UInt")
        layout := DllCall("GetKeyboardLayout", "UInt", threadId, "Ptr")
        langID := layout & 0xFFFF
        return (langID = 1028 || langID = 2052 || langID = 3076 || langID = 4100 || langID = 5124)
    }
    catch e {
        return false
    }
}

IsChineseIMESimple() {
    try {
        DetectHiddenWindows, On
        VarSetCapacity(guiThreadInfo, 72, 0) ; x64 結構大小為 72 bytes
        NumPut(72, guiThreadInfo, 0, "UInt")
        DllCall("GetGUIThreadInfo", "UInt", 0, "Ptr", &guiThreadInfo)
        hWnd := NumGet(guiThreadInfo, 16, "Ptr") ; x64 offset 為 16

        threadId := DllCall("GetWindowThreadProcessId", "Ptr", hWnd, "Ptr", 0, "UInt")
        layout := DllCall("GetKeyboardLayout", "UInt", threadId, "Ptr")
        IMEWnd := DllCall("imm32.dll\ImmGetDefaultIMEWnd", "Uint", hWnd)
        IMEStatus := DllCall("user32.dll\SendMessageA", "UInt", IMEWnd, "UInt", 0x0283, "Int", 0x0001, "Int", 0)
        IMEStatus2 := DllCall("user32.dll\SendMessageA", "UInt", IMEWnd, "UInt", 0x0283, "Int", 0x0005, "Int", 0)
        langID := layout & 0xFFFF
        return (langID = 1028 || langID = 2052 || langID = 3076 || langID = 4100 || langID = 5124) && (IMEStatus >= 1)
    }
    catch e {
        return false
    }
}

; =============================================================================
; 完整注音符號按鍵映射 (標準大千注音鍵盤布局)
; =============================================================================

; 字母鍵按照大千注音標準布局
$a::
if (CheckZhuyinMode()) {
    ProcessZhuyinInput(Chr(0x3107))  ; ㄇ
    send a
} else {
    Send a
}
return

$b::
if (CheckZhuyinMode()) {
    ProcessZhuyinInput(Chr(0x3116))  ; ㄖ
    send b
} else {
    Send b
}
return

$c::
if (CheckZhuyinMode()) {
    ProcessZhuyinInput(Chr(0x310F))  ; ㄏ
    send c
} else {
    Send c
}
return

$d::
if (CheckZhuyinMode()) {
    ProcessZhuyinInput(Chr(0x310E))  ; ㄎ
    send d
} else {
    Send d
}
return

$e::
if (CheckZhuyinMode()) {
    global ZhuyinState
    if (ZhuyinState = "INIT") {
        ProcessZhuyinInput(Chr(0x310D))  ; ㄍ
        send e
    } else {
        ProcessZhuyinInput(Chr(0x02C7))  ; ˇ (三聲)
        send 3
    }
} else {
    Send e
}
return

$f::
if (CheckZhuyinMode()) {
    ProcessZhuyinInput(Chr(0x3111))  ; ㄑ
    send f
} else {
    Send f
}
return

$g::
if (CheckZhuyinMode()) {
    ProcessZhuyinInput(Chr(0x3115))  ; ㄕ
    send g
} else {
    Send g
}
return

$h::
if (CheckZhuyinMode()) {
    ProcessZhuyinInput(Chr(0x3118))  ; ㄘ
    send h
} else {
    Send h
}
return

$i::
if (CheckZhuyinMode()) {
    ProcessZhuyinInput(Chr(0x311B))  ; ㄛ
    send i
} else {
    Send i
}
return

$j::
if (CheckZhuyinMode()) {
    ProcessZhuyinInput(Chr(0x3128))  ; ㄨ
    send j
} else {
    Send j
}
return

$k::
if (CheckZhuyinMode()) {
    ProcessZhuyinInput(Chr(0x311C))  ; ㄜ
    send k
} else {
    Send k
}
return

$l::
if (CheckZhuyinMode()) {
    ProcessZhuyinInput(Chr(0x3120))  ; ㄠ
    send l
} else {
    Send l
}
return

$m::
if (CheckZhuyinMode()) {
    ProcessZhuyinInput(Chr(0x3129))  ; ㄩ
    send m
} else {
    Send m
}
return

$n::
if (CheckZhuyinMode()) {
    ProcessZhuyinInput(Chr(0x3119))  ; ㄙ
    send n
} else {
    Send n
}
return

$o::
if (CheckZhuyinMode()) {
    if (ZhuyinState = "INIT") {
        ProcessZhuyinInput(Chr(0x3109))  ; ㄉ
        send 2
    } else {
        ProcessZhuyinInput(Chr(0x311F))  ; ㄟ
        send o
    }
} else {
    Send o
}
return

$p::
if (CheckZhuyinMode()) {
    ProcessZhuyinInput(Chr(0x3123))  ; ㄣ
    send p
} else {
    Send p
}
return

$q::
if (CheckZhuyinMode()) {
    ProcessZhuyinInput(Chr(0x3106))  ; ㄆ
    send q
} else {
    Send q
}
return

$r::
if (CheckZhuyinMode()) {
    global ZhuyinState
    if (ZhuyinState = "INIT") {
        ProcessZhuyinInput(Chr(0x3110))  ; ㄐ
        send r
    } else {
        ProcessZhuyinInput(Chr(0x02CB))  ; ˋ (四聲)
        send 4
    }
} else {
    Send r
}
return

$s::
if (CheckZhuyinMode()) {
    ProcessZhuyinInput(Chr(0x310B))  ; ㄋ
    send s
} else {
    Send s
}
return

$t::
if (CheckZhuyinMode()) {
    ProcessZhuyinInput(Chr(0x3114))  ; ㄔ
    send t
} else {
    Send t
}
return

$u::
if (CheckZhuyinMode()) {
    global ZhuyinState
    if (ZhuyinState = "INIT" || ZhuyinState = "CONSONANT") {
        ProcessZhuyinInput(Chr(0x3127))  ; ㄧ
        send u
    } else {
        ProcessZhuyinInput(Chr(0x02D9))  ; ˙ (輕聲)
        send 7
    }
} else {
    Send u
}
return

$v::
if (CheckZhuyinMode()) {
    ProcessZhuyinInput(Chr(0x3112))  ; ㄒ
    send v
} else {
    Send v
}
return

$w::
if (CheckZhuyinMode()) {
    ProcessZhuyinInput(Chr(0x310A))  ; ㄊ
    send w
} else {
    Send w
}
return

$x::
if (CheckZhuyinMode()) {
    ProcessZhuyinInput(Chr(0x310C))  ; ㄌ
    send x
} else {
    Send x
}
return

$y::
if (CheckZhuyinMode()) {
    global ZhuyinState
    if (ZhuyinState = "INIT") {
        ProcessZhuyinInput(Chr(0x3117))  ; ㄗ
        send y
    } else {
        ProcessZhuyinInput(Chr(0x02CA))  ; ˊ (二聲)
        send 6
    }
} else {
    Send y
}
return

$z::
if (CheckZhuyinMode()) {
    ProcessZhuyinInput(Chr(0x3108))  ; ㄈ
    send z
} else {
    Send z
}
return

; 其他符號鍵
$`;::
if (CheckZhuyinMode()) {
    ProcessZhuyinInput(Chr(0x3124))  ; ㄤ
    send `;
} else {
    Send `;
}
return

$.::
if (CheckZhuyinMode()) {
    ProcessZhuyinInput(Chr(0x3121))  ; ㄡ
    send .
} else {
    Send .
}
return

$,::
if (CheckZhuyinMode()) {
    if (ZhuyinState = "INIT") {
        ProcessZhuyinInput(Chr(0x3105))  ; ㄅ
        send 1
    } else {
        ProcessZhuyinInput(Chr(0x311D))  ; ㄝ
        send `,
    }
} else {
    Send `,
}
return

$/::
if (CheckZhuyinMode()) {
    if (ZhuyinState = "INIT") {
        ProcessZhuyinInput(Chr(0x3113))  ; ㄓ
        send 5
    } else {
        ProcessZhuyinInput(Chr(0x3125))  ; ㄥ
        send /
    }
} else {
    Send /
}
return

; 數字列按鍵處理
$1::
if (CheckZhuyinMode()) {
    ProcessZhuyinInput(Chr(0x3105))  ; ㄅ
    send 1
} else {
    Send 1
}
return

$2::
if (CheckZhuyinMode()) {
    ProcessZhuyinInput(Chr(0x3109))  ; ㄉ
    send 2
} else {
    Send 2
}
return

$3::
if (CheckZhuyinMode()) {
    ProcessZhuyinInput(Chr(0x02C7))  ; ˇ (三聲)
    send 3
} else {
    Send 3
}
return

$4::
if (CheckZhuyinMode()) {
    ProcessZhuyinInput(Chr(0x02CB))  ; ˋ (四聲)
    send 4
} else {
    Send 4
}
return

$5::
if (CheckZhuyinMode()) {
    ProcessZhuyinInput(Chr(0x3113))  ; ㄓ
    send 5
} else {
    Send 5
}
return

$6::
if (CheckZhuyinMode()) {
    ProcessZhuyinInput(Chr(0x02CA))  ; ˊ (二聲)
    send 6
} else {
    Send 6
}
return

$7::
if (CheckZhuyinMode()) {
    ProcessZhuyinInput(Chr(0x02D9))  ; ˙ (輕聲)
    send 7
} else {
    Send 7
}
return

$8::
if (CheckZhuyinMode()) {
    ProcessZhuyinInput(Chr(0x311A))  ; ㄚ
    send 8
} else {
    Send 8
}
return

$[::
if (CheckZhuyinMode()) {
    ProcessZhuyinInput(Chr(0x311A))  ; ㄚ
    send 8
} else {
    Send [
}
return

$9::
if (CheckZhuyinMode()) {
    ProcessZhuyinInput(Chr(0x311E))  ; ㄞ
    send 9
} else {
    Send 9
}
return

$]::
if (CheckZhuyinMode()) {
    ProcessZhuyinInput(Chr(0x311E))  ; ㄞ
    send 9
} else {
    Send ]
}
return

$0::
if (CheckZhuyinMode()) {
    ProcessZhuyinInput(Chr(0x3122))  ; ㄢ
    send 0
} else {
    Send 0
}
return

$'::
if (CheckZhuyinMode()) {
    ProcessZhuyinInput(Chr(0x3122))  ; ㄢ
    send 0
} else {
    Send '
}
return

$-::
if (CheckZhuyinMode()) {
    ProcessZhuyinInput(Chr(0x3126))  ; ㄦ
    send -
} else {
    Send -
}
return

$"::
if (CheckZhuyinMode()) {
    ProcessZhuyinInput(Chr(0x3126))  ; ㄦ
    send -
} else {
    Send "
}
return

$Space::
if (CheckZhuyinMode()) {
    if GetKeyState("LWin", "P") {
        send #{Space}
        sleep 100
        if (CheckZhuyinMode()) {
            ; 重置 FSM 到 INIT 狀態
            ResetZhuyinFSM()
        }
    } else {
        ProcessZhuyinInput(" ")  ; 一聲
        send {Space}
    }
} else {
    Send {Space}
}
return

$Esc::
if (CheckZhuyinMode()) {
    ; 重置 FSM 到 INIT 狀態
    ResetZhuyinFSM()
    send {Esc}
} else {
    Send {Esc}
}
return

$Tab::
if (CheckZhuyinMode()) {
    ; 重置 FSM 到 INIT 狀態
    ResetZhuyinFSM()
    send {Tab}
} else {
    Send {Tab}
}
return

$BackSpace::
if (CheckZhuyinMode()) {
    ; 回退到前一個狀態 (使用字符串比較)
    BackToLastState()
    send {BackSpace}
} else {
    Send {BackSpace}
}
return

#if CheckZhuyinMode() = true
~$Shift::
    sleep 100
    ; 重置 FSM 到 INIT 狀態
    ResetZhuyinFSM()
    RemoveResetToolTip()
return
#if

#if IsOnChineseIME() = true && CheckZhuyinMode() = false
~$Shift::
    sleep 100
    ; 重置 FSM 到 INIT 狀態
    ResetZhuyinFSM()
    ShowZhuyinFSM()
return
#if

; 檢查是否在注音輸入法模式的函數
CheckZhuyinMode() {
        IsChineseIME := IsChineseIMESimple()
        if (IsChineseIME = false) {
            RemoveResetToolTip()
            return false
        } else {
            return IsChineseIME
        }
}

; =============================================================================
; 注音輸入法 FSM (Finite State Machine)
; =============================================================================

; FSM 狀態變量 (全局變量)
global ZhuyinState := "INIT"
global ZhuyinBuffer := ""

; 添加窗口切換檢測相關變量
global CurrentActiveWindow := ""
global PreviousActiveWindow := ""

InitWindowDetection() {
    ; 使用系統Hook（備用方案）
    try {
        DllCall("SetWinEventHook", "UInt", 0x0003, "UInt", 0x0003, "Ptr", 0, "Ptr", RegisterCallback("OnWindowActivate"), "UInt", 0, "UInt", 0, "UInt", 0)
    }
}
; Windows Hook回調函數
OnWindowActivate(hWinEventHook, event, hwnd, idObject, idChild, dwEventThread, dwmsEventTime) {
    global CurrentActiveWindow, PreviousActiveWindow
    
    ; 檢查是否為窗口激活事件
    if (event = 0x0003) {  ; EVENT_SYSTEM_FOREGROUND
        if (hwnd != CurrentActiveWindow && CurrentActiveWindow != "") {
            ; 保存前一個窗口
            PreviousActiveWindow := CurrentActiveWindow
            
            ; 重置注音狀態
            ResetZhuyinFSM()
            RemoveResetToolTip()
        }
        CurrentActiveWindow := hwnd
    }
}

; 注音符號分類 (使用Unicode編碼以避免字符顯示問題)
; 聲母: ㄅㄆㄇㄈㄉㄊㄋㄌㄍㄎㄏㄐㄑㄒㄓㄔㄕㄖㄗㄘㄙ
global Consonants := Chr(0x3105) . Chr(0x3106) . Chr(0x3107) . Chr(0x3108) . Chr(0x3109) . Chr(0x310A) . Chr(0x310B) . Chr(0x310C) . Chr(0x310D) . Chr(0x310E) . Chr(0x310F) . Chr(0x3110) . Chr(0x3111) . Chr(0x3112) . Chr(0x3113) . Chr(0x3114) . Chr(0x3115) . Chr(0x3116) . Chr(0x3117) . Chr(0x3118) . Chr(0x3119)

; 介音: ㄧㄨㄩ
global Medials := Chr(0x3127) . Chr(0x3128) . Chr(0x3129)

; 韻母: ㄚㄛㄜㄝㄞㄟㄠㄡㄢㄣㄤㄥㄦ
global Vowels := Chr(0x311A) . Chr(0x311B) . Chr(0x311C) . Chr(0x311D) . Chr(0x311E) . Chr(0x311F) . Chr(0x3120) . Chr(0x3121) . Chr(0x3122) . Chr(0x3123) . Chr(0x3124) . Chr(0x3125) . Chr(0x3126)

; 聲調: ˊˇˋ˙ 和空格鍵 (一聲)
global Tones := Chr(0x02CA) . Chr(0x02C7) . Chr(0x02CB) . Chr(0x02D9) . Chr(0x3100)

; 檢查字符屬於哪個類別
GetZhuyinType(char) {
    ; 獲取字符的Unicode編碼
    charCode := Asc(char)
    
    ; 聲母: ㄅㄆㄇㄈㄉㄊㄋㄌㄍㄎㄏㄐㄑㄒㄓㄔㄕㄖㄗㄘㄙ (0x3105-0x3119)
    if (charCode >= 0x3105 && charCode <= 0x3119) {
        return "CONSONANT"
    }
    
    ; 介音: ㄧㄨㄩ (0x3127-0x3129)
    if (charCode = 0x3127 || charCode = 0x3128 || charCode = 0x3129) {
        return "MEDIAL"
    }
    
    ; 韻母: ㄚㄛㄜㄝㄞㄟㄠㄡㄢㄣㄤㄥㄦ (0x311A-0x3126)
    if (charCode >= 0x311A && charCode <= 0x3126) {
        return "VOWEL"
    }
    
    ; 聲調: ˊˇˋ˙ 和空格鍵 (一聲)
    if (charCode = 0x02CA || charCode = 0x02C7 || charCode = 0x02CB || charCode = 0x02D9 || charCode = 32) {
        return "TONE"
    }
    
    return "UNKNOWN"
}

; FSM 狀態轉換
ProcessZhuyinInput(char) {
    global ZhuyinState, ZhuyinBuffer
    
    charType := GetZhuyinType(char)
    oldState := ZhuyinState

    ; ZhuyinBuffer := char . charType
    
    ; 狀態轉換邏輯
    if (ZhuyinState = "INIT") {
        if (charType = "CONSONANT") {
            ZhuyinState := "CONSONANT"
            ZhuyinBuffer := char
        }
        else if (charType = "MEDIAL") {
            ZhuyinState := "MEDIAL"
            ZhuyinBuffer := char
        }
        else if (charType = "VOWEL") {
            ZhuyinState := "VOWEL"
            ZhuyinBuffer := char
        }
    }
    else if (ZhuyinState = "CONSONANT") {
        if (charType = "CONSONANT") {
            ZhuyinState := "CONSONANT"
            ZhuyinBuffer := char
        }
        else if (charType = "MEDIAL") {
            ZhuyinState := "CONSONANT_MEDIAL"
            ZhuyinBuffer .= char
        }
        else if (charType = "VOWEL") {
            ZhuyinState := "CONSONANT_VOWEL"
            ZhuyinBuffer .= char
        }
        else if (charType = "TONE") {
            ZhuyinState := "CONSONANT_TONE"
            ZhuyinBuffer .= char
        }
    }
    else if (ZhuyinState = "CONSONANT_MEDIAL") {
        if (charType = "VOWEL") {
            ZhuyinState := "CONSONANT_MEDIAL_VOWEL"
            ZhuyinBuffer .= char
        }
        else if (charType = "TONE") {
            ZhuyinState := "CONSONANT_MEDIAL_TONE"
            ZhuyinBuffer .= char
        }
    }
    else if (ZhuyinState = "CONSONANT_VOWEL") {
        if (charType = "TONE") {
            ZhuyinState := "CONSONANT_VOWEL_TONE"
            ZhuyinBuffer .= char
        }
    }
    else if (ZhuyinState = "CONSONANT_MEDIAL_VOWEL") {
        if (charType = "TONE") {
            ZhuyinState := "CONSONANT_MEDIAL_VOWEL_TONE"
            ZhuyinBuffer .= char
        }
    }
    else if (ZhuyinState = "MEDIAL") {
        if (charType = "MEDIAL") {
            ZhuyinState := "MEDIAL"
            ZhuyinBuffer := char
        }
        else if (charType = "VOWEL") {
            ZhuyinState := "MEDIAL_VOWEL"
            ZhuyinBuffer .= char
        }
        else if (charType = "TONE") {
            ZhuyinState := "MEDIAL_TONE"
            ZhuyinBuffer .= char
        }
    }
    else if (ZhuyinState = "VOWEL") {
        if (charType = "VOWEL") {
            ZhuyinState := "VOWEL"
            ZhuyinBuffer := char
        }
        else if (charType = "TONE") {
            ZhuyinState := "VOWEL_TONE"
            ZhuyinBuffer .= char
        }
    }
    else if (ZhuyinState = "MEDIAL_VOWEL") {
        if (charType = "TONE") {
            ZhuyinState := "MEDIAL_VOWEL_TONE"
            ZhuyinBuffer .= char
        }
    }
    
    ; 檢查是否到達最終狀態（有聲調）
    if (InStr(ZhuyinState, "_TONE")) {
        ; 完成一個音節，回到 INIT
        SetTimer, ResetZhuyinFSM, 10
    }
    
    ; 顯示 FSM 狀態
    ShowZhuyinFSM()
}

; 重置 FSM 到初始狀態
ResetZhuyinFSM() {
global ZhuyinState, ZhuyinBuffer
ZhuyinState := "INIT"
ZhuyinBuffer := ""
ShowZhuyinFSM()
SetTimer, ResetZhuyinFSM, Off
}


; 回退到前一個狀態 (使用字符串比較)
BackToLastState() {
    global ZhuyinState, ZhuyinBuffer
    
    ; 移除 buffer 中的最後一個字符
    if (StrLen(ZhuyinBuffer) > 0) {
        ZhuyinBuffer := SubStr(ZhuyinBuffer, 1, StrLen(ZhuyinBuffer) - 1)
    }
    
    ; 使用字符串比較來判斷前一個狀態
    if (ZhuyinState = "INIT") {
        ; 已經在初始狀態，無法再回退
        return
    }
    else if (ZhuyinState = "CONSONANT") {
        ZhuyinState := "INIT"
    }
    else if (ZhuyinState = "MEDIAL") {
        ZhuyinState := "INIT"
    }
    else if (ZhuyinState = "VOWEL") {
        ZhuyinState := "INIT"
    }
    else if (ZhuyinState = "CONSONANT_MEDIAL") {
        ZhuyinState := "CONSONANT"
    }
    else if (ZhuyinState = "CONSONANT_VOWEL") {
        ZhuyinState := "CONSONANT"
    }
    else if (ZhuyinState = "CONSONANT_TONE") {
        ZhuyinState := "CONSONANT"
    }
    else if (ZhuyinState = "CONSONANT_MEDIAL_VOWEL") {
        ZhuyinState := "CONSONANT_MEDIAL"
    }
    else if (ZhuyinState = "CONSONANT_MEDIAL_TONE") {
        ZhuyinState := "CONSONANT_MEDIAL"
    }
    else if (ZhuyinState = "CONSONANT_VOWEL_TONE") {
        ZhuyinState := "CONSONANT_VOWEL"
    }
    else if (ZhuyinState = "CONSONANT_MEDIAL_VOWEL_TONE") {
        ZhuyinState := "CONSONANT_MEDIAL_VOWEL"
    }
    else if (ZhuyinState = "MEDIAL_VOWEL") {
        ZhuyinState := "MEDIAL"
    }
    else if (ZhuyinState = "MEDIAL_TONE") {
        ZhuyinState := "MEDIAL"
    }
    else if (ZhuyinState = "VOWEL_TONE") {
        ZhuyinState := "VOWEL"
    }
    else if (ZhuyinState = "MEDIAL_VOWEL_TONE") {
        ZhuyinState := "MEDIAL_VOWEL"
    }
    
    ; 顯示更新後的 FSM 狀態
    ShowZhuyinFSM()
}

; Show FSM current state
ShowZhuyinFSM() {
    global ZhuyinState, ZhuyinBuffer
    
    ; stateDisplay := "=== Zhuyin FSM ===" . "`n"
    ; stateDisplay .= "Current State: [" . ZhuyinState . "]" . "`n"
    stateDisplay .= "bopomofo: [" . ZhuyinBuffer . "]" . "`n"
    ; stateDisplay .= "==================" . "`n"
    
    ; State flow diagram
    ; stateDisplay .= "State Flow:" . "`n"
    
    ; ; Show different flow diagrams based on current state
    ; if (ZhuyinState = "INIT") {
    ;     stateDisplay .= "[*] INIT -> Waiting for input" . "`n"
    ;     ; stateDisplay .= "Can input: Consonant(1)/Medial(2)/Vowel(3)"
    ; }
    ; else if (ZhuyinState = "CONSONANT") {
    ;     stateDisplay .= "INIT -> [*] CONSONANT" . "`n"
    ;     ; stateDisplay .= "Can input: Medial(2)/Vowel(3)/Tone(4)"
    ; }
    ; else if (ZhuyinState = "CONSONANT_MEDIAL") {
    ;     stateDisplay .= "INIT -> CONSONANT -> [*] CONSONANT_MEDIAL" . "`n"
    ;     ; stateDisplay .= "Can input: Vowel(3)/Tone(4)"
    ; }
    ; else if (ZhuyinState = "CONSONANT_VOWEL") {
    ;     stateDisplay .= "INIT -> CONSONANT -> [*] CONSONANT_VOWEL" . "`n"
    ;     ; stateDisplay .= "Can input: Tone(4)"
    ; }
    ; else if (ZhuyinState = "CONSONANT_MEDIAL_VOWEL") {
    ;     stateDisplay .= "INIT -> CONSONANT -> MEDIAL -> [*] CONSONANT_MEDIAL_VOWEL" . "`n"
    ;     ; stateDisplay .= "Can input: Tone(4)"
    ; }
    ; else if (ZhuyinState = "MEDIAL") {
    ;     stateDisplay .= "INIT -> [*] MEDIAL" . "`n"
    ;     ; stateDisplay .= "Can input: Vowel(3)/Tone(4)"
    ; }
    ; else if (ZhuyinState = "VOWEL") {
    ;     stateDisplay .= "INIT -> [*] VOWEL" . "`n"
    ;     ; stateDisplay .= "Can input: Tone(4)"
    ; }
    ; else if (ZhuyinState = "MEDIAL_VOWEL") {
    ;     stateDisplay .= "INIT -> MEDIAL -> [*] MEDIAL_VOWEL" . "`n"
    ;     ; stateDisplay .= "Can input: Tone(4)"
    ; }
    ; else if (InStr(ZhuyinState, "_TONE")) {
    ;     stateDisplay .= "Complete syllable: [*] " . StrReplace(ZhuyinState, "_TONE", "") . "_TONE" . "`n"
    ;     ; stateDisplay .= "*** COMPLETE! Back to INIT in 1 sec ***"
    ; }
    
    ; ToolTip, %stateDisplay%, 100, 100, 3
}
