#!/bin/bash

#-------------------------------
# 利用前に必ず以下を記入してください
#-------------------------------
BACKLOG_API_KEY=""
BACKLOG_SPACE=""
#-------------------------------
# ここまで
#-------------------------------

BACKLOG_DELETE_LIST_FILE="backlog-delete-list.txt"

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
