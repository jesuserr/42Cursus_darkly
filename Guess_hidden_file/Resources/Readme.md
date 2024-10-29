# Guess (hidden file)


## Flag
```
d5eec3ec36cf80dce44a896f961c1831a05526ec215693c8f2c39543497d4466
```

## How to find it

- After examination of 'robots.txt' at http://192.168.56.101/robots.txt is found a reference to a folder called './hidden'. 'robots.txt' is a standard used by websites to communicate with web crawlers and other web robots. It specifies which parts of the website should not be accessed or scanned by these automated agents. The file is placed in the root directory of the website and follows a specific format.

- Accessing to http://192.168.56.101/.hidden gives access to an structure of nested folders that is very clear that is impossible to examine one by one, so a script in written to download all the content.

- The script downloads all the files except those named 'index.html' since our goal are the README files. Once everything is downloaded it searches for a README containing numbers and not just letters (since just letters seems to be the pattern of the files with no useful information). Once the file is found the flag is shown in the terminal.

## How to fix it

Three basic strategies to solve this type of breach would be:

1. **Restrict Access to Sensitive Files and Directories**: Use proper access control mechanisms to restrict access to sensitive files and directories. Ensure that only authorized users can access these resources.

2. **Use Robots.txt Properly**: While robots.txt can be used to guide web crawlers, it should not be relied upon to hide sensitive information. Ensure that sensitive directories and files are not listed in robots.txt and are instead protected by proper authentication and authorization mechanisms.


3. **Implement Security Through Obscurity**: Avoid relying solely on obscurity to protect sensitive information. Use encryption and secure authentication methods to ensure that even if the location of sensitive files is discovered, unauthorized users cannot access the content.

## Resources

- [Broken Access Control | OWASP Foundation](https://owasp.org/www-community/Broken_Access_Control)
- [Security on the web | MDN](https://developer.mozilla.org/en-US/docs/Web/Security)
