#!/bin/bash

# 读取index.html文件内容
content=$(cat index.html)

# 检查index.html是否包含emby-crx
if grep -q "danmaku.movie.kg" index.html; then
    echo "Index.html already contains /danmaku.movie.kg, skipping insertion."
else
    # 定义要插入的代码
    code='<script type="text/javascript" src="https://danmaku.movie.kg/ext.js"></script>\n<link rel="stylesheet" href="https://danmaku.movie.kg/ext.css"/>\n'

    # 在</body>之前插入代码
    new_content=$(echo -e "${content/<\/body>/$code<\/body>}")

    # 将新内容写入index.html文件
    echo -e "$new_content" > index.html
fi
