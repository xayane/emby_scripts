#!/bin/bash

# 读取index.html文件内容
content=$(cat index.html)

# 检查index.html是否包含emby-crx
if grep -q "josephus" index.html; then
    echo "Index.html already contains josephus, skipping insertion."
else
    # 定义要插入的代码
    code='<script type="text/javascript" src="https://raw.githubusercontent.com/chenghui-lee/dd-danmaku/master/josephus/ext.js"></script>\n<link rel="stylesheet" href="https://raw.githubusercontent.com/chenghui-lee/dd-danmaku/master/josephus/ext.css"/>\n'

    # 在</body>之前插入代码
    new_content=$(echo -e "${content/<\/body>/$code<\/body>}")

    # 将新内容写入index.html文件
    echo -e "$new_content" > index.html
fi
