# Backlog課題一括削除スクリプト

指定した複数の課題を一括削除する（Backlogには課題の一括削除の機能がなかったので作成した）

## 利用手順

- Backlogの環境に合わせてAPI-Keyとスペース名をbacklog-delete.shに記入する
- backlog-delete-list.txtに削除対象課題IDを1行ずつ記入する
- ```sh ./backlog-delete.sh```で実行

## API-key取得方法

**管理者権限ユーザのみ取得可能**

backlogの個人設定（画面右上のメニュー） → APIタブ → APIキーを発行

## 注意事項

### backlog-delete-list.txtについて

親課題を削除する場合は子課題を先に削除しないとエラーになるので子課題から順に記述する

### その他

jqコマンドが必要なので事前にインストールする必要あり
（Macの人はHomebrewで簡単にインストール出来ます```brew install jq```）

参考：https://stedolan.github.io/jq/download/
