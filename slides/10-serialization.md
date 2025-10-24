---
title: "Data Serialization"
author: "Michael Lee"
---

# Data Serialization

## Agenda

- What is Data Serialization?
- JSON (JavaScript Object Notation)
- YAML (YAML Ain't Markup Language)
- Some other serialization formats
- Why did I just learn this?

---

## What is Data Serialization?

- Data serialization is the process of converting _structured information_ into
  a format that can be stored, transmitted, and reconstructed later.

<!-- pause -->

E.g., we might want to save a Java object to disk, or send it over the web:

```java
class Student {
  int id;
  String name;
  List<String> classes;

  ...
}

Student s = new Student(1234567,
                        "John, Doe",
                        ["CS 100",   "CSP 200",
                         "MATH 151", "SOC 100"]);
```

---

# JSON (JavaScript Object Notation)

A very popular serialization format based on JavaScript syntax.

See <https://www.json.org/> for gory details.

---

# JSON

## Basic Syntax

- Two main structures: _objects_ and *array*s
- An object consists of key-value pairs.
  - Keys are strings
  - Values can be strings, numbers, booleans, arrays, or other objects
- An array is an ordered list of values
- Objects are `{}` enclosed, arrays are `[]` enclosed, strings are `""` enclosed

---

# JSON

## Example 1: Simple object

```json
{
  "name": "Alice",
  "id": 1234567,
  "graduated": false
}
```

Note:

- keys must be quoted
- single quotes can't be used instead of double quotes
- numbers and Booleans aren't quoted

---

# JSON

## Example 2: Object with an array

```json
{
  "name": "Alice",
  "id": 1234567,
  "graduated": false,
  "courses": ["CS 100", "CSP 200", "MATH 151"]
}
```

---

# JSON

## Example 3: Nested object

```json
{
  "name": "Alice",
  "id": 1234567,
  "graduated": false,
  "courses": ["CS 100", "CSP 200", "MATH 151"],
  "contact": {
    "email": "alice@illinoistech.edu",
    "phone": "123-456-7890"
  }
}
```

---

# JSON

## Example 4: Array of objects

```json
[
  { "name": "Alice", "id": 1234567 },
  { "name": "Bob", "id": 2345678 },
  { "name": "Chantelle", "id": 3456789 }
]
```

---

# JSON

## How is it used?

Countless web services and APIs (more on both of these later!) accept and return
JSON-encoded data. It is the _de facto standard_ for data interchange on the web
today!

- Every (serious) programming language supports it
- Every browser understands it

<!-- pause -->

But hand-writing/parsing JSON is painful!

---

# `jq`: a JSON processor

`jq` is a command-line tool for working with JSON.

```sh
jq . data.json # this will validate our JSON syntax

jq 'PROGRAM' data.json # run program to parse data
```

Basic programs:

- `.` access the entire object (identity)
- `.key` access the value for `key` in an object
- `.[N]` access the value at index `N` in an array
- `.[].key` access value for `key` in all objects in an array

---

# JSON / `jq` Demo

We can get JSON data from the following web APIs:

- GitHub API: https://docs.github.com/
  - E.g., https://api.github.com/repos/csp200/lessons
- OpenMeteo: https://open-meteo.com/
  - E.g.,
    https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current=temperature_2m,wind_speed_10m&hourly=temperature_2m,relative_humidity_2m,wind_speed_10m
- NASA Image search: https://images.nasa.gov/
  - E.g., https://images-api.nasa.gov/search?q=apollo

---

# Exploring `jq` with NASA Image Search JSON

The examples below demonstrate a series of increasingly complex `jq` filters
using the JSON returned by NASA's image search API (`nasa.json`).

---

## STEP 1: Exploring the Structure

### 0. Grab the JSON data

```sh
curl -s 'https://images-api.nasa.gov/search?q=apollo' > nasa.json
```

### 1. Show all top-level keys

```sh
jq 'keys' nasa.json
```

### 2. Peek at the first item in the collection

```sh
jq '.collection.items[0]' nasa.json
```

### 3. List the titles of the first few image results

```sh
jq '.collection.items[0:5][] .data[0].title' nasa.json
```

---

## STEP 2: Navigating Nested Structures

### 4. Extract just the titles and descriptions

```sh
jq '.collection.items[] | {title: .data[0].title, desc: .data[0].description}' nasa.json
```

### 5. Show all image URLs

```sh
jq '.collection.items[] | .links[]?.href' nasa.json
```

### 6. Print a flat list of `{title, url}` pairs

```sh
jq '.collection.items[] | {title: .data[0].title, url: .links[0].href}' nasa.json
```

---

## STEP 3: Filtering and Searching

### 7. Show only items with "Moon" in the title

```sh
jq '.collection.items[] | select(.data[0].title | test("Moon")) | .data[0].title' nasa.json
```

### 8. Filter for media type "image"

```sh
jq '.collection.items[] | select(.data[0].media_type == "image") | .data[0].title' nasa.json
```

### 9. Get all image URLs only for results with "Apollo" in the description

```sh
jq '.collection.items[] 
    | select(.data[0].description | test("Apollo"; "i")) 
    | .links[]?.href' nasa.json
```

---

## STEP 4: Transforming and Restructuring

### 10. Build an array of image cards with custom structure

```sh
jq '[.collection.items[] 
      | {title: .data[0].title, 
         date: .data[0].date_created, 
         url: .links[0].href}]' nasa.json
```

### 11. Sort the results by creation date

```sh
jq '[.collection.items[] 
       | {title: .data[0].title, 
          date: .data[0].date_created}] 
    | sort_by(.date)' nasa.json
```

### 12. Count how many results have a description that includes "earth"

```sh
jq '[.collection.items[] 
      | select(.data[0].description | test("earth"; "i"))] 
    | length' nasa.json
```

---

# YAML (YAML Ain’t Markup Language)

## Basic Syntax

- YAML uses indentation to define structure instead of `{}` and `[]`.
- Uses key-value pairs without quotation marks for keys.
- Arrays are represented using dashes (`-`).
- Strings, integers, booleans, and lists are supported.

---

# YAML (YAML Ain’t Markup Language)

## Example 1: Simple YAML Object

```yaml
name: Alice
age: 25
is_student: false
```

---

# YAML (YAML Ain’t Markup Language)

#### Example 2: YAML with Lists

```yaml
name: Alice
age: 25
is_student: false
courses:
  - Math
  - Computer Science
  - History
```

---

# YAML (YAML Ain’t Markup Language)

#### Example 3: Nested YAML Structures

```yaml
person:
  name: Alice
  age: 25
  contact:
    email: alice@example.com
    phone: 123-456-7890
```

---

# `yq`: Like `jq` but for YAML!

```sh
yq . data.yaml # validate our YAML file
```

---

# Other Serialization Formats

- TOML
- XML
- Proto

---

## TOML (Tom’s Obvious, Minimal Language)

- Common in configuration files (`Cargo.toml`, `pyproject.toml`).
- More readable and structured than JSON for configs.
- Example:

```toml
name = "Alice"
age = 25
is_student = false
courses = ["Math", "Computer Science"]
```

---

## XML (Extensible Markup Language)

- Used in older web services (SOAP, RSS feeds).
- More verbose than JSON but supports attributes.
- Example:

```xml
<person>
  <name>Alice</name>
  <age>25</age>
  <is_student>false</is_student>
  <courses>
    <course>Math</course>
    <course>Computer Science</course>
  </courses>
</person>
```

---

## Binary Formats (MessagePack, Protocol Buffers, Avro)

- Efficient and compact (used in high-performance systems).
- Example (Protocol Buffers):

```proto
message Person {
  string name = 1;
  int32 age = 2;
  bool is_student = 3;
}
```

- More difficult to read but faster for data exchange.

---

## References

- [JSON specification](https://www.json.org/)
- [JSON cheatsheet](https://quickref.me/json.html)
- [YAML specification](https://yaml.org/)
- [YAML cheatsheet](https://quickref.me/yaml.html)
