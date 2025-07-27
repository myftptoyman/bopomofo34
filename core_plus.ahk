;Vortex core plus Keyboard

#NoEnv
#SingleInstance Force
#UseHook
SendMode Input
SetBatchLines -1

#include bopomofo34.ahk

; 全局变量
global CurrentLayer := 0
global L1_Active := false
global L2_Active := false
global L3_Active := false
global L4_Active := false
global L5_Active := false
global L6_Active := false
global LE_Active := false

; Layer Tap 计时变量
SpacePressed := false
GuiPressed := false

; ==================== 层激活快捷键 ====================
; 您可以根据需要修改这些快捷键组合
; MO(_L1) - 方向键层（RWIN激活）
RWin::
RWin up::
    if GetKeyState("RWin", "P") && !GetKeyState("LWin", "P") {
        L1_Active := true
    } else {
        L1_Active := false
    }
return

; MO(_L2) - 功能键层（右Alt激活）
RAlt::
RAlt up::
    if GetKeyState("RAlt", "P") {
        L2_Active := true
    } else {
        L2_Active := false
    }
return

; MO(_L4) - Shift层（右Ctrl激活）
RCtrl::
RCtrl up::
    if GetKeyState("RCtrl", "P") {
        L4_Active := true
    } else {
        L4_Active := false
    }
return

; MO(_L5) - 符号层（右Shift激活）
RShift::
RShift up::
    if GetKeyState("RShift", "P") {
        L5_Active := true
    } else {
        L5_Active := false
    }
return

; MO(_LE) - 特殊功能层
F12::
F12 up::
    if GetKeyState("F12", "P") {
        LE_Active := true
    } else {
        LE_Active := false
    }
return

#if

; ==================== Layer Tap 功能 ====================
#if IsChineseIMESimple() = false
; transfer to keyboard FN keys
; TS(_L3) - 空格键 Layer Tap
$Space::
    SendKey("space")
    return
;     ; 检查是否按下了任何修饰键，如果是则直接发送Space，不处理Layer Tap
;     if GetKeyState("LWin", "P") || GetKeyState("RWin", "P") || GetKeyState("Ctrl", "P") || GetKeyState("Alt", "P") || GetKeyState("Shift", "P") {
;         SendKey("space")
;         return
;     }

;     Sleep, 100

;     if !GetKeyState("Space", "P") {
;         Send, {Space}
;     }

;     ; 检查是否为连续空格（双击空格）
;     global lastSpaceTime, doubleSpaceHold, doubleSpaceHoldFirst
;     if (lastSpaceTime = "")  ; 初始化
;         lastSpaceTime := 0
;     if (doubleSpaceHold = "") { ; 初始化
;         doubleSpaceHold := false
;         doubleSpaceHoldFirst := false
;     }

;     SpacePressed := true
;     StartTime := A_TickCount

;     ; 判断是否为双击空格
;     if (StartTime - lastSpaceTime < 500) && !doubleSpaceHoldFirst {
;         ; 双击空格，进入持续空格模式
;         doubleSpaceHold := true
;         L3_Active := true  ; 激活L3层
;         ; 只要空格按住就持续发送空格
;         Loop {
;             if !GetKeyState("Space", "P")
;                 break
;             if !doubleSpaceHoldFirst {
;                 doubleSpaceHoldFirst := true
;                 Sleep, 100
;             } else {
;                 Send, {Space}
;             }
;             Sleep, 50  ; 间隔可调整
;         }
;         L3_Active := false
;         doubleSpaceHold := false
;         lastSpaceTime := 0  ; 重置，避免三连空格
;         SpacePressed := false
;         return
;     } else {
;         doubleSpaceHoldFirst := false
;     }

;     L3_Active := true  ; 按下时立即激活L3层

;     ; 等待释放
;     KeyWait, Space

;     ; HoldTime := A_TickCount - StartTime
;     L3_Active := false  ; 释放时停用L3层

;     ; if (HoldTime < 200) {
;     ;     ; 短按：发送空格
;     ;     ; Send, {Space}
;         lastSpaceTime := StartTime
;     ; }
;     ; 长按：什么都不做（已经通过L3层处理了）

;     SpacePressed := false
; return

#if

; TGU(_L6) - Win键 Layer Tap  
LWin::
+LWin::
^LWin::
+^LWin::
    GuiPressed := true
    StartTime := A_TickCount
    L6_Active := true  ; 按下时立即激活L6层
    
    ; 等待释放
    KeyWait, LWin
    
    HoldTime := A_TickCount - StartTime
    L6_Active := false  ; 释放时停用L6层
    
    ; if (HoldTime < 200) {
    ;     ; 短按：发送Win键
    ;     Send, {LWin}
    ; }
    ; 长按：什么都不做（已经通过L6层处理了）
    
    GuiPressed := false
return

#if IsChineseIMESimple() = false

; ==================== 键位重映射 ====================
; 基础字母和数字键
1::SendKey("1")
2::SendKey("2")
3::SendKey("3")
4::SendKey("4")
5::SendKey("5")
6::SendKey("6")
7::SendKey("7")
8::SendKey("8")
9::SendKey("9")
0::SendKey("0")
-::SendKey("-")
=::SendKey("=")
\::SendKey("\")
q::SendKey("q")
w::SendKey("w")
e::SendKey("e")
r::SendKey("r")
t::SendKey("t")
y::SendKey("y")
u::SendKey("u")
i::SendKey("i")
o::SendKey("o")
p::SendKey("p")
a::SendKey("a")
s::SendKey("s")
d::SendKey("d")
f::SendKey("f")
g::SendKey("g")
h::SendKey("h")
j::SendKey("j")
k::SendKey("k")
l::SendKey("l")
z::SendKey("z")
x::SendKey("x")
c::SendKey("c")
v::SendKey("v")
b::SendKey("b")
n::SendKey("n")
m::SendKey("m")

+q::SendKey("q")
+w::SendKey("w")
+e::SendKey("e")
+r::SendKey("r")
+t::SendKey("t")
+y::SendKey("y")
+u::SendKey("u")
+i::SendKey("i")
+o::SendKey("o")
+p::SendKey("p")

; 符号键
[::SendKey("[")
]::SendKey("]")
`;::SendKey(";")
'::SendKey("'")
/::SendKey("/")

+[::SendKey("[")
+]::SendKey("]")
+`;::SendKey(";")
+'::SendKey("'")
+/::SendKey("/")

^[::SendKey("[")
^]::SendKey("]")
^`;::SendKey(";")
^'::SendKey("'")
^/::SendKey("/")

+^[::SendKey("[")
+^]::SendKey("]")
+^`;::SendKey(";")
+^'::SendKey("'")
+^/::SendKey("/")

; 标准方向键
Left::SendKey("Left")
Down::SendKey("Down")
Up::SendKey("Up")
Right::SendKey("Right")

+Left::SendKey("Left")
+Down::SendKey("Down")
+Up::SendKey("Up")
+Right::SendKey("Right")

^Left::SendKey("Left")
^Down::SendKey("Down")
^Up::SendKey("Up")
^Right::SendKey("Right")

+^Left::SendKey("Left")
+^Down::SendKey("Down")
+^Up::SendKey("Up")
+^Right::SendKey("Right")

; 特殊键
Esc::SendSpecialKey("esc")
+Esc::SendSpecialKey("esc")
^Esc::SendSpecialKey("esc")
Enter::SendSpecialKey("enter")
Backspace::SendSpecialKey("backspace")


#if

#if IsChineseIMESimple() && GetKeyState("RWin", "P") && !GetKeyState("LWin", "P") && !GetKeyState("LShift", "P")
$`;::Send {Left}
$'::Send {Right}
$[::Send {Up}
$/::Send {Down}
#if

#if IsChineseIMESimple() && GetKeyState("RWin", "P") && !GetKeyState("LWin", "P") && GetKeyState("LShift", "P")
$+`;::Send +{Left}
$+'::Send +{Right}
$+[::Send +{Up}
$+/::Send +{Down}
#if

#if IsChineseIMESimple() && GetKeyState("LWin", "P") && !GetKeyState("LShift", "P")
$`;::Send {Home}
$'::Send {End}
$[::Send {PgUp}
$/::Send {PgDn}
#if

#if IsChineseIMESimple() && GetKeyState("LWin", "P") && GetKeyState("LShift", "P")
$+`;::Send +{Home}
$+'::Send +{End}
$+[::Send +{PgUp}
$+/::Send +{PgDn}
#if

; ==================== 核心发送函数 ====================

SendKey(key) {
    ; 检查特殊功能层 (LE)
    if (LE_Active) {
        SendLEKey(key)
        return
    }
    
    ; 检查GUI层 (L6)
    if (L6_Active) {
        SendL6Key(key)
        return
    }
    
    ; 检查符号层 (L5)
    if (L5_Active) {
        SendL5Key(key)
        return
    }
    
    ; 检查Shift层 (L4)
    if (L4_Active) {
        SendL4Key(key)
        return
    }
    
    ; 检查数字层 (L3)
    if (L3_Active) {
        SendL3Key(key)
        return
    }
    
    ; 检查功能键层 (L2)
    if (L2_Active) {
        SendL2Key(key)
        return
    }
    
    ; 检查方向键层 (L1)
    if (L1_Active) {
        SendL1Key(key)
        return
    }
    
    ; 基础层 (L0)]
    if GetKeyState("Shift", "P") {
        if GetKeyState("Ctrl", "P") {
            Send, ^+{%key%}
        } else {
            Send, +{%key%}
        }
    } else {
        if GetKeyState("Ctrl", "P") {
            Send, ^{%key%}
        } else {
            Send, {%key%}
        }
    }
}

SendSpecialKey(key) {
    if (key = "esc") {
        ; KC_GESC 功能
        if GetKeyState("Shift", "P") {
            Send, ~
        } else if GetKeyState("Ctrl", "P") {
            Send, ``
        ; } else if GetKeyState("Space", "P") {
        ;     Send, ``
        } else {
            Send, {Esc}
        }
    } else if (key = "tab") {
        Send, {Tab}
    } else if (key = "enter") {
        if GetKeyState("Shift", "P") {
            Send, |
        } else if GetKeyState("RCtrl", "P") {
            Send, \
        } else {
            Send, {Enter}
        }
    } else if (key = "backspace") {
        if GetKeyState("Shift", "P") {
            Send, -
        } else if GetKeyState("RCtrl", "P") {
            Send, _
        } else {
            Send, {Backspace}
        }
    } else if (key = "delete") {
        Send, {Delete}
    }
}

; ==================== 各层键位映射 ====================

; L1层 - 方向键层
SendL1Key(key) {
    ; 检测左Shift是否按下
    if GetKeyState("LShift", "P") {
        if !GetKeyState("LCtrl", "P") {
            ; 左Shift+L1层的组合功能（选择文本）
            if (key = "[") {
                Send, +{Up}    ; Shift+Up - 向上选择文本
            } else if (key = ";") {
                Send, +{Left} ; Shift+Left - 按词向左选择
            } else if (key = "'") {
                Send, +{Right} ; Shift+Right - 按词向右选择
            } else if (key = "/") {
                Send, +{Down}  ; Shift+Down - 向下选择文本
            } else {
                Send, +{%key%}   ; 其他键加Shift
            }
        } else {
            ; 左Shift+左Ctrl+L1层的组合功能（选择文本）
            if (key = "[") {
                Send, ^+{Up}    ; Shift+Ctrl+Up - 向上选择文本
            } else if (key = ";") {
                Send, ^+{Left} ; Shift+Ctrl+Left - 按词向左选择
            } else if (key = "'") {
                Send, ^+{Right} ; Shift+Ctrl+Right - 按词向右选择
            } else if (key = "/") {
                Send, ^+{Down}  ; Shift+Ctrl+Down - 向下选择文本
            } else {
                Send, ^+{%key%}   ; 其他键加Shift+Ctrl
            }
        }
    } else {
        if !GetKeyState("LCtrl", "P") {
            ; 原有的L1层功能（无左Shift）
            if (key = "[") {
                Send, {Up}
            } else if (key = ";") {
                Send, {Left}
            } else if (key = "'") {
                Send, {Right}
            } else if (key = "/") {
                Send, {Down}
            } else {
                Send, {%key%}  ; 其他键保持原样
            }
        } else {
            ; 原有的L1层功能（无左Shift）
            if (key = "[") {
                Send, ^{Up}
            } else if (key = ";") {
                Send, ^{Left}
            } else if (key = "'") {
                Send, ^{Right}
            } else if (key = "/") {
                Send, ^{Down}
            } else {
                Send, ^{%key%}  ; 其他键保持原样
            }
        }
    }
}

; L2层 - 功能键层
SendL2Key(key) {
    if GetKeyState("LShift", "P") {
        if (key = "q") {
            Send, +{F1}
        } else if (key = "w") {
            Send, +{F2}
        } else if (key = "e") {
            Send, +{F3}
        } else if (key = "r") {
            Send, +{F4}
        } else if (key = "t") {
            Send, +{F5}
        } else if (key = "y") {
            Send, +{F6}
        } else if (key = "u") {
            Send, +{F7}
        } else if (key = "i") {
            Send, +{F8}
        } else if (key = "o") {
            Send, +{F9}
        } else if (key = "p") {
            Send, +{F10}
        } else if (key = "[") {
            Send, +{F11}
        } else if (key = "]") {
            Send, +{F12}
        } else {
            Send, +{%key%}
        }
    } else {
        if (key = "q") {
            Send, {F1}
        } else if (key = "w") {
            Send, {F2}
        } else if (key = "e") {
            Send, {F3}
        } else if (key = "r") {
            Send, {F4}
        } else if (key = "t") {
            Send, {F5}
        } else if (key = "y") {
            Send, {F6}
        } else if (key = "u") {
            Send, {F7}
        } else if (key = "i") {
            Send, {F8}
        } else if (key = "o") {
            Send, {F9}
        } else if (key = "p") {
            Send, {F10}
        } else if (key = "[") {
            Send, {F11}
        } else if (key = "]") {
            Send, {F12}
        } else {
            Send, {%key%}
        }
    }
}

; L3层 - 数字键层
SendL3Key(key) {
    if (key = "q") {
        Send, 1
    } else if (key = "w") {
        Send, 2
    } else if (key = "e") {
        Send, 3
    } else if (key = "r") {
        Send, 4
    } else if (key = "t") {
        Send, 5
    } else if (key = "y") {
        Send, 6
    } else if (key = "u") {
        Send, 7
    } else if (key = "i") {
        Send, 8
    } else if (key = "o") {
        Send, 9
    } else if (key = "p") {
        Send, 0
    } else if (key = "[") {
        Send, -
    } else if (key = "]") {
        Send, =
    } else if (key = "'") {
        Send, +\  ; R(KC_BSLS)
    } else {
        Send, {%key%}
    }
}

; L4层 - Shift层
SendL4Key(key) {
    Send, +{%key%}  ; 所有键加Shift
}

; L5层 - 符号层
SendL5Key(key) {
    ; 修正：用AutoHotkey语法，注释改为分号，符号用花括号包裹，\需转义
    if (key = "q") {
        Send, {!}   ; R(KC_1) = !
    } else if (key = "w") {
        Send, {@}   ; R(KC_2) = @
    } else if (key = "e") {
        Send, {#}   ; R(KC_3) = #
    } else if (key = "r") {
        Send, {$}   ; R(KC_4) = $
    } else if (key = "t") {
        Send, {`%}  ; R(KC_5) = %
    } else if (key = "y") {
        Send, {^}   ; R(KC_6) = ^
    } else if (key = "u") {
        Send, {&}   ; R(KC_7) = &
    } else if (key = "i") {
        Send, {*}   ; R(KC_8) = *
    } else if (key = "o") {
        Send, {(}   ; R(KC_9) = (
    } else if (key = "p") {
        Send, {)}   ; R(KC_0) = )
    } else if (key = "[") {
        Send, {_}   ; R(KC_MINS) = _
    } else if (key = "]") {
        Send, {+}   ; R(KC_EQL) = +
    } else if (key = "enter") {
        Send, {|}
    } else if (key = "backspace") {
        Send, {-}
    } else {
        Send, +{%key%}  ; 其他键加Shift
    }
}

; L6层 - GUI层
SendL6Key(key) {
    ; 检测左Shift是否按下
    if GetKeyState("LShift", "P") {
        ; 左Shift+L6层的组合功能
        if (key = "[" || key = "Up") {
            Send, +{PgUp}  ; Shift+Home - 跳到文档开头
        } else if (key = ";" || key = "Left") {
            Send, +{Home}  ; Shift+Left - 按词左移
        } else if (key = "'" || key = "Right") {
            Send, +{End} ; Shift+Right - 按词右移
        } else if (key = "/" || key = "Down") {
            Send, +{PgDn}   ; Shift+End - 跳到文档末尾
        } else if (key = "e") {
            Send, +{F3}
        } else {
            Send, +#{%key%}  ; 其他键加Shift+Win
        }
    } else {
        ; 原有的L6层功能（无左Shift）
        if (key = "[" || key = "Up") {
            Send, {PgUp}
        } else if (key = ";" || key = "Left") {
            Send, {Home}
        } else if (key = "'" || key = "Right") {
            Send, {End}
        } else if (key = "/" || key = "Down") {
            Send, {PgDn}
        } else if (key = "e") {
            Send, {F3}
        } else if (key = "l") {
            L6_Active := false
            Send, #{l}
        } else {
            Send, #{%key%}  ; 其他键加Win键
        }
    }
}

; LE层 - 特殊功能层
SendLEKey(key) {
    if (key = "esc") {
        ; TO(_L0) - 重置所有层
        L1_Active := false
        L2_Active := false
        L3_Active := false
        L4_Active := false
        L5_Active := false
        L6_Active := false
        LE_Active := false
        ToolTip, 切换到基础层
        SetTimer, RemoveToolTip, 1000
    } else if (key = "tab") {
        ; KC_USB
        ToolTip, 切换到 USB 模式
        SetTimer, RemoveToolTip, 2000
    } else if (key = "a") {
        ; KC_BT1
        ToolTip, 连接蓝牙设备 1
        SetTimer, RemoveToolTip, 2000
    } else if (key = "s") {
        ; KC_BT2
        ToolTip, 连接蓝牙设备 2
        SetTimer, RemoveToolTip, 2000
    } else if (key = "d") {
        ; KC_BT3
        ToolTip, 连接蓝牙设备 3
        SetTimer, RemoveToolTip, 2000
    } else if (key = "f") {
        ; KC_2G4
        ToolTip, 切换到 2.4G 模式
        SetTimer, RemoveToolTip, 2000
    } else if (key = "p") {
        ; HS_BATQ
        ToolTip, 电池查询
        SetTimer, RemoveToolTip, 2000
    } else if (key = "[") {
        ; RGB_VAD
        ToolTip, RGB 亮度降低
        SetTimer, RemoveToolTip, 1000
    } else if (key = "]") {
        ; RGB_VAI
        ToolTip, RGB 亮度增加
        SetTimer, RemoveToolTip, 1000
    } else if (key = "enter") {
        ; RGB_TOG
        ToolTip, RGB 开关切换
        SetTimer, RemoveToolTip, 1000
    } else if (key = "backspace") {
        ; QK_BOOT
        ToolTip, 进入引导模式
        SetTimer, RemoveToolTip, 2000
    } else if (key = "c") {
        ; KC_CAPS
        Send, {CapsLock}
    }
    ; 其他未映射的键不发送任何内容
}

; ==================== 工具函数 ====================
RemoveToolTip:
    ToolTip
    SetTimer, RemoveToolTip, Off
return
