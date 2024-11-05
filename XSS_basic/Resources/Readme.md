# XSS Basic


## Flag
```
0fbb54bbf7d099713ca4be297e1bc7da0173d8b3c21c1811b916a3a86652724e
```

## How to find it

- Cross-Site Scripting (XSS) attacks are a type of injection, in which malicious scripts are injected into otherwise benign and trusted websites. XSS attacks occur when an attacker uses a web application to send malicious code, generally in the form of a browser side script, to a different end user. Flaws that allow these attacks to succeed are quite widespread and occur anywhere a web application uses input from a user within the output it generates without validating or encoding it.

- Upon examination of the website, a good candidate for XSS is found in the LEAVE A FEEDBACK section. Inspecting the code it is noticed that the user input is not sanitized, therefore a malicious script written in any of the two available fields will be posted automatically in the comments section.

- In order to obtain the flag it is enough with writing the word 'script' in any of the available fields and upon submission, the flag is obtained.

## How to fix it

Three basic strategies to solve this type of breach would be:

1. **Input Validation and Sanitization:** Ensure that all user inputs are validated and sanitized before being processed or stored. This involves checking for and removing any potentially harmful characters or scripts from the input.

2. **Output Encoding:** Encode all user-generated content before displaying it on the web page. This ensures that any potentially harmful scripts are rendered harmless by converting special characters to their HTML-encoded equivalents.

3. **Content Security Policy (CSP):** Implement a Content Security Policy to restrict the sources from which content can be loaded. This helps prevent the execution of malicious scripts by only allowing scripts from trusted sources.

## Resources

- [Cross Site Scripting (XSS) | OWASP Foundation](https://owasp.org/www-community/attacks/xss/)
- [Cross-site scripting (XSS) - MDN Web Docs Glossary: Definitions of Web-related terms | MDN](https://developer.mozilla.org/en-US/docs/Glossary/Cross-site_scripting)
- [Cross-site scripting - Wikipedia](https://en.wikipedia.org/wiki/Cross-site_scripting)


