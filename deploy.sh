#!/usr/bin/env bash
# fuge0xsol 个人主页同步脚本：GitHub Pages 自动（push main 即构建），
# Cloudflare Pages 走本脚本（wrangler 直传）。
# 用法：改完页面后在本目录执行 ./deploy.sh
set -e
export HTTPS_PROXY=http://127.0.0.1:7897
export NO_UPDATE_CHECK=1 WRANGLER_SEND_METRICS=false

if [ -n "$(git status --porcelain)" ]; then
    git add -A
    git commit -m "update: $(date +%F %H:%M)" --quiet
fi
git push
wrangler pages deploy . --project-name=fuge0xsol --branch=main --commit-dirty=true

echo "完成: https://fuge0xsol.github.io/  |  https://fuge0xsol.pages.dev"
