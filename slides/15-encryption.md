# Practical Cryptography Demo: Hashing, GPG, and OpenSSL

## 1. Hashing Basics

### Goal

Show how one-way functions manifest as hashing tools.

### Commands

- Hash a file:
  ```sh
  sha256sum myfile.txt
  ```
- Hash a string:
  ```sh
  echo -n "hello world" | sha256sum
  ```

### Key Ideas

- Hashes are deterministic, one-way, and collision-resistant.
- Small input changes create large unpredictable hash changes (avalanche
  effect).

---

## 2. Verifying Data Integrity

### Commands

- Save hash:
  ```sh
  sha256sum large-file.iso > large-file.iso.sha256
  ```
- Verify:
  ```sh
  sha256sum -c large-file.iso.sha256
  ```

### Key Idea

Integrity ≠ authentication. You know the file wasn’t corrupted, but not *who*
created it.

---

## 3. GPG: Generating Keys

### Commands

- Create a key pair:
  ```sh
  gpg --full-generate-key
  ```
- List keys:
  ```sh
  gpg --list-keys
  gpg --list-secret-keys
  ```

### Key Idea

Public key = lock; private key = key. You can share the public key widely.

---

## 4. Encrypting and Decrypting with GPG

### Commands

- Encrypt a file for someone:
  ```sh
  gpg --encrypt --recipient "Alice Example" secrets.txt
  ```
- Decrypt:
  ```sh
  gpg --decrypt secrets.txt.gpg
  ```

### Key Idea

Only the intended recipient can decrypt using their private key.

---

## 5. Signing Files with GPG

### Commands

- Sign:
  ```sh
  gpg --sign document.pdf
  ```
- Create a detached signature:
  ```sh
  gpg --detach-sign --armor document.pdf
  ```
- Verify:
  ```sh
  gpg --verify document.pdf.asc document.pdf
  ```

### Key Idea

Signing authenticates *you* and assures integrity.

---

## 6. Sharing and Importing Public Keys

### Commands

- Export your key:

```sh
# use key id found in `gpg --list-keys` output
gpg --armor --export ABCD1234EFG567890 > my-public-key.asc

# can also use user id, if unique
gpg --armor --export "Bob" > bob.asc
```

- Attach this key to an email signature or place it on your website!

- Import someone else’s key:

```sh
curl -O https://moss.cs.iit.edu/michael.pub

gpg --import michael.pub

gpg --fingerprint

curl -O https://moss.cs.iit.edu/hello.txt.gpg

gpg --verify hello.txt.gpg
```

- Authenticity requires trust — fingerprints must be verified out-of-band.

- Try `gpg --encrypt --recipient "Michael Lee" foo.txt` --- what warning do you
  get?

- Two separate types of "trust":
  1. Do I trust that this key belongs to Michael?
  2. Do I trust Michael to certify other people's keys?

- To affirm (1), verify key fingerprint out-of-band (e.g., phone, meeting,
  official website), then:

```
gpg --edit-key "Michael Lee"

# at the prompt
gpg> sign
gpg> save
```

- To affirm (2), do:

```
gpg> trust

# at the menu: 
1 = I don't know or won't say
2 = I do NOT trust
3 = I trust marginally
4 = I trust fully
5 = I trust ultimately

Pick a trust level (e.g., 4)
```

---

## 7. Signing Git Commits with GPG

### Steps

1. Configure Git:
   ```sh
   git config --global user.signingkey YOURKEYID
   git config --global commit.gpgsign true
   ```
2. Make a commit:
   ```sh
   git commit -S -m "Signed commit"
   ```
3. Verify:
   ```sh
   git log --show-signature
   ```

### Key Idea

Signed commits help ensure repository integrity and provenance.

---

## 8. OpenSSL: Creating Key Pairs

### Commands

- Generate an RSA key:
  ```sh
  openssl genpkey -algorithm RSA -out private.pem -pkeyopt rsa_keygen_bits:2048
  ```
- Get the public key:
  ```sh
  openssl pkey -in private.pem -pubout -out public.pem
  ```

### Key Idea

Gives lower-level insight into key formats and PEM encoding.

---

## 9. Encrypting/Decrypting with OpenSSL (Hybrid Encryption)

### Commands

- Encrypt:
  ```sh
  openssl pkeyutl -encrypt -inkey public.pem -pubin -in plaintext.txt -out ciphertext.bin
  ```
- Decrypt:
  ```sh
  openssl pkeyutl -decrypt -inkey private.pem -in ciphertext.bin -out decrypted.txt
  ```

### Key Idea

Asymmetric cryptography typically protects small messages or symmetric keys.

---

## 10. Signing and Verifying with OpenSSL

### Commands

- Sign:
  ```sh
  openssl dgst -sha256 -sign private.pem -out file.sig file.txt
  ```
- Verify:
  ```sh
  openssl dgst -sha256 -verify public.pem -signature file.sig file.txt
  ```

### Key Idea

Same principles as GPG, but lower-level and closer to raw cryptographic
primitives.
