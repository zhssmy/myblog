#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.

# if using a theme, replace by `hugo -t <yourtheme>`
hugo -t meme 

# Go To Public folder
cd public

# Add changes to git.
git add -A

# Commit changes.

# 使用`date`加入时间
# msg="rebuilding site `date`"
# update：更新文章《从0到1打造Hugo博客》
# publish：发表文章《从0到1打造Hugo博客》
# add：增加某项功能
# delete：删除某项内容
# modify：修改某项内容
# style：博客样式修改
# docs：增加注释文档

msg="modify：修改文章《从0到1打造Hugo博客》目录"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back
cd ..