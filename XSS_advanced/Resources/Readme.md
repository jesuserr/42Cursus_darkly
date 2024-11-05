# XSS Advanced


## Flag
```
928d819fc19405ae09921a2b71227bd9aba106f9d2d37ac412e9e5a750f1506d
```

## How to find it

- Cross-Site Scripting (XSS) attacks are a type of injection, in which malicious scripts are injected into otherwise benign and trusted websites. XSS attacks occur when an attacker uses a web application to send malicious code, generally in the form of a browser side script, to a different end user. Flaws that allow these attacks to succeed are quite widespread and occur anywhere a web application uses input from a user within the output it generates without validating or encoding it.

- Upon examination of the website, it is noticed that the NSA logo is clickable. Once we click on the image we are redirected to the following address:

    - `http://192.168.56.102/?page=media&src=nsa`

- It seems that the logo is loaded using the 'src' field, therefore we start to play with this field, writing random things and obtaining '404:Not found' warnings. Then we decide to insert a simple script in 'src' as follows:

    - `http://192.168.56.102/?page=media&src=<script>alert(1)</script>`

- This time we obtain an error but the message is somehow different which could be an indication that we are in the good path. Since 'src' is expecting an image, we decide to camouflage the script as it was an image, in order to do that we encode the script into base 64, obtaining the following:

    - `Input ASCII: <script>alert(1)</script>`
    - `Output Base64: PHNjcmlwdD5hbGVydCgxKTwvc2NyaXB0Pg==`

- In order to load the script we have to send it as Data URL, as follows:

    - `http://192.168.56.102/?page=media&src=data:text/html;base64,PHNjcmlwdD5hbGVydCgxKTwvc2NyaXB0Pg==`

- The malicious script is inserted and the flag is obtained.

## How to fix it

Three basic strategies to solve this type of breach would be:

1. **Input Validation and Sanitization:** Ensure that all user inputs are validated and sanitized before being processed or stored. This involves checking for and removing any potentially harmful characters or scripts from the input.

2. **Output Encoding:** Encode all user-generated content before displaying it on the web page. This ensures that any potentially harmful scripts are rendered harmless by converting special characters to their HTML-encoded equivalents.

3. **Content Security Policy (CSP):** Implement a Content Security Policy to restrict the sources from which content can be loaded. This helps prevent the execution of malicious scripts by only allowing scripts from trusted sources.

## Resources

- [Cross Site Scripting (XSS) | OWASP Foundation](https://owasp.org/www-community/attacks/xss/)
- [Cross-site scripting (XSS) - MDN Web Docs Glossary: Definitions of Web-related terms | MDN](https://developer.mozilla.org/en-US/docs/Glossary/Cross-site_scripting)
- [Cross-site scripting - Wikipedia](https://en.wikipedia.org/wiki/Cross-site_scripting)
- [👉 ¿Qué es Cross-site Scripting (XSS)? Demostración y RIESGOS de esta VULNERABILIDAD - YouTube](https://www.youtube.com/watch?v=lG2XpAgy0Ns())
- [Data URLs - URIs | MDN](https://developer.mozilla.org/en-US/docs/Web/URI/Schemes/data)


