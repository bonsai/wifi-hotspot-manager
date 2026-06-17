# トラブルシューティング

## よくある問題と解決策

### 1. 「管理者権限が必要です」エラー

**原因**: 通常ユーザーでコマンドを実行している

**解決策**:
- コマンドプロンプトを管理者として開く
- PowerShellを管理者として開く
- batchファイルを右クリック→「管理者として実行」

### 2. 「ホストされたネットワークが利用不可」エラー

**原因**: WiFiアダプターのドライバーが対応していない

**解決策**:
1. WiFiアダプタードライバーを更新
2. ネットワークアダプター設定で「共有」を有効化

### 3. スマホが接続できない

**原因**: ファイアウォール、IPアドレス問題

**解決策**:
```powershell
# ファイアウォールを一時無効化
netsh advfirewall set allprofiles state off

# IPアドレスを再取得
ipconfig /release
ipconfig /renew
```

### 4. インターネットが共有されない

**原因**: 共有設定が正しくない

**解決策**:
1. ネットワーク接続設定を開く
2. インターネット接続を右クリック→プロパティ
3. 「共有」タブで「他のネットワークユーザーがこのコンピュターのインターネット接続を通じて接続できるようにする」をチェック

### 5. 接続が不安定

**原因**: WiFiチャネルの干渉

**解決策**:
```powershell
# チャネルを変更
netsh wlan set hostednetwork channel=11
```

## ログ確認

```powershell
# イベントログ確認
Get-WinEvent -LogName "Microsoft-Windows-WLAN-AutoConfig/Operational" -MaxEvents 50
```

## リセット手順

完全リセットが必要な場合：

```powershell
netsh wlan stop hostednetwork
netsh wlan set hostednetwork mode=disallow
netsh wlan set hostednetwork mode=allow ssid=BYO key=password123
netsh wlan start hostednetwork
```
