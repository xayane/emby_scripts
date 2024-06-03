#!/bin/bash

# 读取index.html文件内容
content=$(cat index.html)

# 检查index.html是否包含emby-crx
if grep -q "chenghui-lee" index.html; then
    echo "Index.html already contains danmuku, skipping insertion."
else
    # 定义要插入的代码
    code='<script src="https://raw.githubusercontent.com/chen3861229/dd-danmaku/develop/ede.js" defer></script>'

    # 在</body>之前插入代码
    new_content=$(echo -e "${content/<\/body>/$code<\/body>}")

    # 将新内容写入index.html文件
    echo -e "$new_content" > index.html
fi
