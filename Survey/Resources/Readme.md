# Survey


## Flag
```
03a944b434d5baff05f46c4bede5792551a2595574bcafc9a6e25f67c382ccaa
```

## How to find it

- After examination of SURVEY section, it is found that the values of the 'Grade' column are established in the frontend, so the user has the capability to set any number in this field. For instance, in a online shop that would be dangerous since the user would be able to stablish any price for a product.

- In our case we established both values of any Grade field to '99' and then chose that value in the Survey and the flag was found.

    - `<option value="99">99</option>`

## How to fix it

Three basic strategies to solve this type of breach would be:

1. **Server-Side Validation:** Ensure that all input data is validated on the server side. This prevents users from manipulating data directly in the frontend. For example, verify that the 'Grade' values fall within an acceptable range before processing them.

2. **Client-Side Validation:** Implement robust client-side validation to provide immediate feedback to users. This can prevent incorrect data from being submitted in the first place. However, this should not be the only line of defense.

3. **Sanitization and Escaping:** Sanitize and escape all user inputs to prevent injection attacks. This includes ensuring that any data sent to the server is clean and does not contain malicious code.

## Resources

- [Input Validation - OWASP Cheat Sheet Series](https://cheatsheetseries.owasp.org/cheatsheets/Input_Validation_Cheat_Sheet.html#client-side-vs-server-side-validation)
- [CWE - CWE-20: Improper Input Validation (4.15)](https://cwe.mitre.org/data/definitions/20.html)