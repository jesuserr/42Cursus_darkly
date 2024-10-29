# Admin_htpasswd


## Flag
```
d19b4823e0d5600ceed56d5e896ef328d7a2b9e7ac7e80f4fcdb9b10bcb3e7ff
```

## How to find it

- After examination of 'robots.txt' at http://192.168.56.101/robots.txt is found a reference to a folder called '/whatever'. 'robots.txt' is a standard used by websites to communicate with web crawlers and other web robots. It specifies which parts of the website should not be accessed or scanned by these automated agents. The file is placed in the root directory of the website and follows a specific format.

- Accessing to http://192.168.56.101/whatever gives access to a file called 'htpasswd' which is downloaded. The file contents the following information:

    - root:437394baff5aa33daa618be47b75cb49

- We proceed to decrypt the presumed password using a webpage such as https://md5.gromweb.com/ obtaining the decrypted presumed password

    - qwerty123@

- Then we proceed to insert the password in the admin panel of the web http://192.168.56.101/admin/, gaining access to the flag.

## How to fix it

Three basic strategies to solve this type of breach would be:

1. **Restrict access to sensitive files**: Use proper server configurations to restrict access to sensitive files like htpasswd.

2. **Remove sensitive information from robots.txt**: Do not list sensitive directories or files in robots.txt. Instead, use other methods to secure these areas, such as authentication and authorization mechanisms.

3. **Use stronger hashing algorithms**: Replace MD5 hashing with stronger algorithms like bcrypt or Argon2 for storing passwords. MD5 is considered weak and can be easily cracked.

## Resources

- [.htaccess - Wikipedia](https://en.wikipedia.org/wiki/.htaccess)
- [htpasswd - Manage user files for basic authentication - Apache HTTP Server Version 2.4](https://httpd.apache.org/docs/2.4/programs/htpasswd.html)
