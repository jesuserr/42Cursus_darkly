# Redirect


## Flag
```
B9E775A0291FED784A2D9680FCFAD7EDD6B8CDF87648DA647AAF4BBA288BCAB3
```

## How to find it

- At the bottom of the main page there are three links to social networks (Twitter, Facebook and Instagram). After inspecting the code of the page it is noticed that the addresses to these social networks can be modified by the attacker. See example below for facebook:

   - `<a href="index.php?page=redirect&amp;site=facebook" class="icon fa-facebook"></a>`

- If these addresses are manipulated, the attacker can redirect the user to another page that impersonates the original one and obtain the user credentials to that particular web.

- Knowing that, we proceed to replace the facebook address with another address and once the facebook icon is clicked the flag is obtained.

   - `<a href="index.php?page=redirect&amp;site=ANOTHER_SITE" class="icon fa-facebook"></a>`

## How to fix it

Three basic strategies to solve this type of breach would be:

1. **Whitelist Valid URLs**: Implement a whitelist of allowed URLs that the application can redirect to. This ensures that only predefined, trusted URLs are used for redirection.

2. **Use Relative URLs**: Use relative URLs instead of absolute URLs for internal links. This prevents the possibility of redirecting to an external malicious site.

3. **Validate and Sanitize Input**: Validate and sanitize any user input that is used to construct URLs. Ensure that the input conforms to expected patterns and does not contain malicious content.

## Resources

- [Unvalidated Redirects and Forwards - OWASP Cheat Sheet Series](https://cheatsheetseries.owasp.org/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.html)
- [CWE - Common Weakness Enumeration](https://cwe.mitre.org/data/definitions/601.html)

