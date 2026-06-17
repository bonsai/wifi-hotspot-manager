# WiFi Hotspot Manager

Windows PCでWiFiホットスポットを簡単に管理するためのツール集です。

## 概要

PCをWiFiアクセスポイントとして使い、スマホやタブレットを接続できます。

## 構成

```
wifi-hotspot-manager/
├── scripts/           # スクリプト類
│   ├── start-wifi-hotspot.bat    # ホットスポット起動（スタートアップ用）
│   ├── setup-hotspot.ps1         # 初期セットアップ
│   └── stop-wifi-hotspot.bat     # ホットスポット停止
├── docs/              # ドキュメント
│   ├── SETUP.md                   # セットアップガイド
│   └── TROUBLESHOOTING.md         # トラブルシューティング
└── .github/           # GitHub設定
```

## クイックスタート

1. `scripts/setup-hotspot.ps1` を管理者権限で実行
2. SSIDとパスワードを設定
3. `scripts/start-wifi-hotspot.bat` で起動

## スマホ接続手順

1. スマホのWiFi設定を開く
2. ネットワーク名（SSID）を選択
3. パスワードを入力
4. 接続完了

## ライセンス

MIT License
