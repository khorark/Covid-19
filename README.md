# Coronavirus (Covid-19) server

<p align="center">
Monitoring count sick and recovered. Get last news from Google.
</p>

## Installation and run

For run please use command

```
docker-compose up
```

Server will be running on port 8080 your localhost.

If you need changed host or port, please edit docket-compose file.

## Auth secret key

:exclamation: **IMPORTANT** :exclamation: Please changed your secret key for access server.

This key used when frontend send request in Authorization Header.

## Avalible routes

### News

For get news please use path /news. Example

```
http://localhost:8080/news
```

Example out:

```json
  {
    "status": 200,
    "data": [
      {
      "source": {
        "id": null,
        "name": "Test.org"
      },
      "author": "Author name",
      "title": "Some text...",
      "description": "Some text...",
      "url": "https://test.org/",
      "urlToImage": "https://test.org/1.jpg",
      "publishedAt": "2020-02-17T15:22:44Z",
      "content": "Some text..."
    },
    ...
  ]
}
```

### Statistics

For get news please use path /stats. Example

```
http://localhost:8080/stats
```

Example out:

```json
{
  "status": 200,
  "data": {
    "cities": [
      {
        "coordinates": [
          31.19185,
          112.638343
        ],
        "_id": "5e4075d6b019103c2b428fb2",
        "confirmed": 58182,
        "deaths": 1696,
        "cured": 6642,
        "en": "Hubei province (including Wuhan)",
        "ch": "湖北",
        "__v": 0
      },
      ...
```

## Licence MIT
