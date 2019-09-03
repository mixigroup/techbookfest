#!/bin/bash

# ディレクトリ移動
#cd techbookfest-template

# 版情報作成
PR_NUM=$(echo ${CODEBUILD_SOURCE_VERSION} | sed 's/pr\/\(.*\)/\1/')
HISTORY="<https://github.com/${REPO}/issues/${PR_NUM}|PR-${PR_NUM}>"
echo ${HISTORY}

# Slack 投稿用コメント作成
SLACK_COMMENT="【"${HISTORY}"】の原稿ができました"

# Slack 投稿コメント確認
echo "Slack 投稿コメント確認"
echo ${SLACK_COMMENT}

# Slack 投稿
curl -F file=@book.pdf \
     -F channels=${SLACK_CHANNEL} \
     -F token=${SLACK_TOKEN} \
     -F initial_comment=${SLACK_COMMENT} \
     https://slack.com/api/files.upload
