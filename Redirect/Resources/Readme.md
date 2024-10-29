# Redirect


## Flag
```

```

## How to find it

- In the SIGN IN / LOGIN page there is a link for password recovery called 'I forgot my password'. After inspecting the page source it is noticed that the mail address is already filled with the value "webmaster@borntosec.com".

   - `<input type="hidden" name="mail" value="webmaster@borntosec.com" maxlength="15">`

- If this email address is populated with another address, the attacker can obtain a recovery password intended for "webmaster@borntosec.com" and impersonate him/her. Knowing that, we proceed to replace the email address with another one and after hitting submit, the flag is obtained.

## How to fix it

Three basic strategies to solve this type of breach would be:



## Resources

- [Forgot Password - OWASP Cheat Sheet Series](https://cheatsheetseries.owasp.org/cheatsheets/Forgot_Password_Cheat_Sheet.html)

