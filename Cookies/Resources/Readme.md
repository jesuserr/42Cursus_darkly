# Cookies


## Flag
```
df2eb4ba34ed059a1e3e89ff4dfc13445f104a1a52295214def1c4fb1693a5c3
```

## How to find it

- In this case the vulnerability target is the session cookie. In order to examine the session cookie we use the Application tab of the browser inspector (Google Chrome in our case). The following information is found inside the cookie:

   - `'I_am_admin=68934a3e9455fa72420237eb05902327'`

- We proceed to decrypt the information linked to 'I_am_admin' using a webpage such as https://md5.gromweb.com/ obtaining the decrypted information. In this case we find that:

    - `'68934a3e9455fa72420237eb05902327' is equivalent to 'false'`

- After the revelation of this information, we proceed to substitute 'false' by 'true' in the cookie, using for that purpose the same website but this time encrypting the text 'true'. The following hashed value is obtained:

   - `'true' is equivalent to 'b326b5062b2f0e69046810717534cb09'`

- After updating the cookie with this new hashed value, the page is refreshed and the access to the flag is gained.

## How to fix it

Three basic strategies to solve this type of breach would be:

1. **Use Stronger Hashing Algorithms:** Replace weak hashing algorithms (like MD5) with stronger ones (such as SHA-256 or SHA-3). This makes it significantly harder for attackers to reverse-engineer the hashed values.

2. **Implement Salting:** Add a unique salt to each piece of data before hashing it. This ensures that even if two identical pieces of data are hashed, their resulting hashes will be different, making it more difficult for attackers to use precomputed hash tables (rainbow tables).

3. **Use Secure Cookies:** Ensure that cookies are marked as HttpOnly and Secure. HttpOnly cookies cannot be accessed via JavaScript, reducing the risk of XSS attacks, and Secure cookies are only sent over HTTPS, protecting them from being intercepted in transit.

## Resources

- [Session Management - OWASP Cheat Sheet Series](https://cheatsheetseries.owasp.org/cheatsheets/Session_Management_Cheat_Sheet.html)
- [Cryptographic Storage - OWASP Cheat Sheet Series](https://cheatsheetseries.owasp.org/cheatsheets/Cryptographic_Storage_Cheat_Sheet.html)



