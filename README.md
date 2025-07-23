# bopomofo34

大千注音排列到34鍵位，適合40%鍵盤的注音輸入解決方案

## 📋 專案簡介

這是一個專為 40% 鍵盤（34 鍵位）設計的注音輸入法腳本，使用 AutoHotkey 實現。將標準大千注音鍵盤布局重新映射到小型鍵盤上，讓使用緊湊型鍵盤的用戶也能享受流暢的中文注音輸入體驗。

## ✨ 功能特點

- 🎯 **34鍵位適配**: 專為 40% 鍵盤量身定制，充分利用有限的按鍵
- 📝 **完整注音支持**: 支援所有大千注音符號（聲母、韻母、介音、聲調）
- 🔄 **智慧狀態機**: 內建注音組合狀態機，確保正確的注音輸入順序
- 💡 **即時顯示**: 提供注音狀態與輸入緩衝區的即時顯示
- 🎛️ **一鍵切換**: 支持中英文輸入模式快速切換
- ⚡ **輕量高效**: 使用 AutoHotkey 實現，資源佔用極低

## 🛠️ 系統需求

- Windows 作業系統
- [AutoHotkey v1.1](https://www.autohotkey.com/) 或更新版本
- 支援中文輸入法的系統環境

## 📦 安裝與使用

### 1. 安裝 AutoHotkey
```bash
# 請先下載並安裝 AutoHotkey
# 官方網站: https://www.autohotkey.com/
```

### 2. 下載腳本
```bash
git clone https://github.com/yourusername/bopomofo34.git
cd bopomofo34
```

### 3. 執行腳本
```bash
# 雙擊執行 bopomofo34.ahk
# 或使用命令列執行
autohotkey.exe bopomofo34.ahk
```

### 4. 開機自動啟動（可選）
將 `bopomofo34.ahk` 放入 Windows 啟動資料夾：
```
%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\
```

## 🎮 使用方法

1. **啟動腳本**: 執行 `bopomofo34.ahk`
2. **切換模式**: 在支援中文輸入的應用程式中使用
3. **注音輸入**: 按照重新映射的鍵位輸入注音符號
4. **狀態顯示**: 腳本會顯示當前注音狀態和輸入緩衝區

## 🗝️ 按鍵映射

本腳本將標準大千注音布局重新映射到 34 鍵位鍵盤，詳細的按鍵映射請參考源碼中的定義。

### 主要按鍵區域
- **聲母區**: 對應原大千注音的聲母位置
- **韻母區**: 對應原大千注音的韻母位置
- **介音區**: 對應原大千注音的介音位置
- **聲調區**: 對應原大千注音的四聲標記

### 聲調共用
ˇ (三聲) | ㄍ 共用 E
ˋ (四聲) | ㄐ 共用 R
ˊ (二聲) | ㄗ 共用 Y
˙ (輕聲) | ㄧ 共用 U

### 聲母共用
ㄅ | ㄝ 共用 ,
ㄉ | ㄟ 共用 O
ㄓ | ㄥ 共用 /

### 韻母共用
ㄚ 指定到 [
ㄞ 指定到 ]
ㄢ 指定到 '
ㄦ 指定到 " (shift+')

### 共用原則
遵守 聲母-介音-韻母-聲調 原則
* 第一個字一定不是聲調 => 聲調與聲母出現時一定是聲母, ˙ (輕聲) 與 ㄧ還多加聲母規則
* ㄝ, ㄟ, ㄥ 都不會是第一個字. 有例外, 但是沒打過 (誒 (ㄝˋ), 欸 (ㄟˋ))
* 依照教育部《國語辭典簡編本‧字詞頻統計》整理的韻母使用頻率

| 韻母 | 出現次數 | 佔比    |
|:----:|--------:|--------:|
| ㄞ   | 76,203  | 3.843%  |
| ㄢ   | 75,572  | 3.811%  |
| ㄚ   | 70,954  | 3.578%  |
| ㄦ   | 10,677  | 0.539%  |

* 維持由左到右的規則

## 🔧 自訂設定

您可以根據個人喜好修改 `bopomofo34.ahk` 中的按鍵映射：

```autohotkey
; 範例：修改特定按鍵映射
$a::
if (CheckZhuyinMode()) {
    ProcessZhuyinInput(Chr(0x3107))  ; ㄇ
    send a
} else {
    Send a
}
return
```

## 📊 狀態機說明

腳本內建智慧狀態機，支援以下注音輸入狀態：
- `INIT`: 初始狀態
- `CONSONANT`: 已輸入聲母
- `MEDIAL`: 已輸入介音
- `VOWEL`: 已輸入韻母
- `TONE`: 已輸入聲調
- 以及各種組合狀態

## 🤝 貢獻

歡迎提交 Issue 和 Pull Request 來改善這個專案！

### 貢獻方式
1. Fork 這個專案
2. 建立您的功能分支 (`git checkout -b feature/AmazingFeature`)
3. 提交您的變更 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 開啟一個 Pull Request

## 📄 授權條款

本專案採用 MIT 授權條款 - 詳見 [LICENSE](LICENSE) 檔案

## 🙏 致謝

- 感謝 AutoHotkey 社群提供的強大腳本平台
- 感謝所有使用者的回饋與建議

## 📞 聯絡方式

如有問題或建議，請透過以下方式聯絡：
- 提交 [GitHub Issue](https://github.com/yourusername/bopomofo34/issues)
- 或發送郵件至 your.email@example.com

---

> 讓小鍵盤也能擁有完整的中文輸入體驗！ 🚀


