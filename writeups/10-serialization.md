# Data Serialization and Structured Data Formats

## Agenda

- Overview of Data Serialization
- JSON (JavaScript Object Notation)
- YAML (YAML Ain't Markup Language)
- Working with JSON and YAML Using `jq` and `yq`
- Other Serialization Formats

## Overview of Data Serialization

- **Definition**: Data serialization is the process of converting data
  structures or objects into a format that can be stored, transmitted, and
  reconstructed later.
- **Why It Matters**:
  - Enables data exchange between systems (APIs, configurations, logs).
  - Used in automation tools like Ansible, Kubernetes, and Terraform.
  - Common in DevOps workflows and configuration management.
- **Popular Serialization Formats**:
  - **JSON (JavaScript Object Notation)** – Common in APIs and web applications.
  - **YAML (YAML Ain’t Markup Language)** – Used in configuration management.
  - **Others**: XML, TOML, MessagePack, Protocol Buffers, Avro.

## JSON (JavaScript Object Notation)

### Basic Syntax

- JSON consists of key-value pairs.
- Uses `{}` to define objects.
- Uses `[]` to define arrays.
- String keys **must** be enclosed in double quotes.

#### Example 1: Simple JSON Object

```json
{
  "name": "Alice",
  "age": 25,
  "is_student": false
}
```

#### Example 2: JSON with Arrays

```json
{
  "name": "Alice",
  "age": 25,
  "is_student": false,
  "courses": ["Math", "Computer Science", "History"]
}
```

#### Example 3: Nested JSON Objects

```json
{
  "person": {
    "name": "Alice",
    "age": 25,
    "contact": {
      "email": "alice@example.com",
      "phone": "123-456-7890"
    }
  }
}
```

### Common Pitfalls

- **Forgetting quotes around keys** (Incorrect: `{name: "Alice"}` → Correct:
  `{"name": "Alice"}`)
- **Using single quotes instead of double quotes** (`{'name': 'Alice'}` is
  invalid in JSON).
- **Trailing commas** (JSON does not allow `{ "name": "Alice", }`).
- **Numbers and Booleans are not quoted**, but strings must be.

---

## YAML (YAML Ain’t Markup Language)

### Basic Syntax

- YAML uses indentation to define structure instead of `{}` and `[]`.
- Uses key-value pairs without quotation marks for keys.
- Arrays are represented using dashes (`-`).
- Strings, integers, booleans, and lists are supported.

#### Example 1: Simple YAML Object

```yaml
name: Alice
age: 25
is_student: false
```

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

#### Example 3: Nested YAML Structures

```yaml
person:
  name: Alice
  age: 25
  contact:
    email: alice@example.com
    phone: 123-456-7890
```

### Common Pitfalls

- **Indentation errors** (YAML is space-sensitive, no tabs allowed).
- **Boolean coercion issues** (e.g., `yes`, `no`, `on`, `off` might be
  interpreted as `true`/`false`).
- **Mixing spaces and tabs** (YAML requires consistent spacing).
- **Colons must be followed by a space** (`name:Alice` is invalid; must be
  `name: Alice`).

## Working with JSON and YAML Using `jq` and `yq`

### Extracting Data

- **Using `jq` for JSON:**
  ```sh
  echo '{"name": "Alice", "age": 25}' | jq '.name'
  ```
  Output: `"Alice"`
- **Using `yq` for YAML:**
  ```sh
  echo "name: Alice\nage: 25" | yq '.name'
  ```
  Output: `Alice`

### Converting Between JSON and YAML

- **YAML → JSON:**
  ```sh
  yq -o=json input.yaml > output.json
  ```
- **JSON → YAML:**
  ```sh
  jq -r '.' input.json > output.yaml
  ```

---

## Other Serialization Formats

### TOML (Tom’s Obvious, Minimal Language)

- Common in configuration files (`Cargo.toml`, `pyproject.toml`).
- More readable and structured than JSON for configs.
- Example:
  ```toml
  name = "Alice"
  age = 25
  is_student = false
  courses = ["Math", "Computer Science"]
  ```

### XML (Extensible Markup Language)

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

### Binary Formats (MessagePack, Protocol Buffers, Avro)

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
