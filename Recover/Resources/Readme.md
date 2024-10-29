# Recover


## Flag
```
1D4855F7337C0C14B6F44946872C4EB33853F40B2D54393FBE94F49F1E19BBB0
```

## How to find it

- In the SIGN IN / LOGIN page there is a link for password recovery called 'I forgot my password'. After inspecting the page source it is noticed that the mail address is already filled with the value "webmaster@borntosec.com".

   - `<input type="hidden" name="mail" value="webmaster@borntosec.com" maxlength="15">`

- If this email address is populated with another address, the attacker can obtain a recovery password intended for "webmaster@borntosec.com" and impersonate him/her. Knowing that, we proceed to replace the email address with another one and after hitting submit, the flag is obtained.

## How to fix it

Three basic strategies to solve this type of breach would be:

1. **Server-Side Validation:** Ensure that the email address used for password recovery is validated on the server side. Do not rely on hidden fields or client-side validation for sensitive information. Always verify the email address against the user database before sending a recovery email.

2. **Token-Based Password Recovery:** Implement a token-based password recovery system. When a user requests a password reset, generate a unique, time-limited token and send it to the user's email address. The user must then use this token to reset their password, ensuring that only the legitimate user can perform the reset.

3. **Rate Limiting and Monitoring:** Implement rate limiting on password recovery requests to prevent abuse. Additionally, monitor for unusual activity, such as multiple password recovery requests for the same account in a short period, and alert administrators or take automated actions to mitigate potential attacks.

## Resources

- [Forgot Password - OWASP Cheat Sheet Series](https://cheatsheetseries.owasp.org/cheatsheets/Forgot_Password_Cheat_Sheet.html)

