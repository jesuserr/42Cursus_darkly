# Path Traversal (also called Local File Inclusion)


## Flag
```
b12c4b2cb8094750ae121a676269aa9e2872d07c06e429d25a63196ec1c8c1d0
```

## How to find it

- To find a path traversal breach, you can test input fields by submitting payloads to navigate directories. Monitor the application's response for unauthorized file access or error messages indicating directory traversal.

- An input field was found in the 'sign in' form page http://192.168.56.101/?page=signin that was exploited in the following way http://192.168.56.101/?page=../../../../../../../../etc/passwd, obtaining access to the root of the disk structure and therefore access to the 'passwd' file and consequently to the flag.

## How to fix it

Three basic strategies to solve this type of breach would be:

1. **Input Validation**: Validate and sanitize all user inputs to ensure they do not contain directory traversal characters like `../`.

2. **Use Secure APIs**: Use secure APIs that abstract file system access and prevent direct manipulation of file paths.

3. **Access Controls**: Implement strict access controls to restrict file access to authorized users and directories only.

## Resources

- [Path Traversal | OWASP Foundation](https://owasp.org/www-community/attacks/Path_Traversal)
- [CWE - CWE-22: Improper Limitation of a Pathname to a Restricted Directory ('Path Traversal') (4.15)](https://cwe.mitre.org/data/definitions/22.html)
- [💻 CURSO DE HACKING ÉTICO - Qué es la vulnerabilidad PATH TRAVERSAL y por qué es tan PELIGROSA #13 - YouTube](https://www.youtube.com/watch?v=4rv14W1PoXU)
