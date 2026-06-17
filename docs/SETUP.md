# セットアップガイド

## 前提条件

- Windows 10/11
- WiFiアダプター内蔵PC
- 管理者権限

## セットアップ手順

### 1. 初期設定

PowerShell（管理者権限）で以下を実行：

```powershell
.\scripts\setup-hotspot.ps1 -SSID "あなたのSSID" -Password "パスワード"
```

### 2. スタートアップに追加

`start-wifi-hotspot.bat` をスタートアップフォルダにコピー：

```
%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup
```

### 3. スマホ接続

1. スマホのWiFi設定を開く
2. 設定したSSIDを選択
3. パスワードを入力
4. 接続

## コマンド一覧

| コマンド | 説明 |
|---------|------|
| `netsh wlan show hostednetwork` | ホットスポット状態確認 |
| `netsh wlan start hostednetwork` | ホットスポット起動 |
| `netsh wlan stop hostednetwork` | ホットスポット停止 |
| `netsh wlan refresh hostednetwork` | ホットスポット更新 |

## よくある設定

### SSIDとパスワード変更

```powershell
netsh wlan set hostednetwork mode=allow ssid=新しいSSID key=新しいパスワード
```

### 接続デバイス数確認

```powershell
netsh wlan show hostednetwork setting=security
```
