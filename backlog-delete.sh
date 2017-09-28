#!/bin/bash
#===============================
# Backlog Delete Batch Script
#===============================

#-------------------------------
# 利用前に必ず以下の項目を記入してください
# ここから
#-------------------------------

# Backlogから取得したAPI-Key（backlogの個人設定メニューのAPIタブ）
BACKLOG_API_KEY=""

# 削除対象のキー一覧を記述したファイル名
BACKLOG_DELETE_LIST_FILE="backlog-delete-list.txt"

# Backlogのスペース名
BACKLOG_SPACE=""

#-------------------------------
# ここまで
#-------------------------------


cat ${BACKLOG_DELETE_LIST_FILE} | while read BACKLOG_ID
do
    # シャープで始まる行（コメント）は無視
    if [[ $BACKLOG_ID =~ ^# ]]; then
        continue
    fi
    result=`curl -s -X DELETE https://${BACKLOG_SPACE}.backlog.jp/api/v2/issues/${BACKLOG_ID}?apiKey=${BACKLOG_API_KEY}`
    echo $result | jq '.summary'
done

exit 0
