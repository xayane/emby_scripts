#!/bin/bash

# 读取index.html文件内容
content=$(cat index.html)

# 检查index.html是否包含emby-crx
if grep -q "iJellyfin.v2.2.0.user.js" index.html; then
    echo "Index.html already contains iJellyfin.v2.2.0.user.js, skipping insertion."
else
    # 定义要插入的代码
    code='<script src="https://ayfxczxhllwadxfqmvit.supabase.co/storage/v1/object/public/blob/script/iJellyfin.v2.2.0.user.js"></script>\n'

    # 在</body>之前插入代码
    new_content=$(echo -e "${content/<\/body>/$code<\/body>}")

    # 将新内容写入index.html文件
    echo -e "$new_content" > index.html
fi
