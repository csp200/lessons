Encryption

# Pushing an image to docker

docker build -t <DOCKER_USERNAME>/getting-started-todo-app .

OR

docker tag

docker push <DOCKER_USERNAME>/getting-started-todo-app

# Sending files back/forth

receiver

    nc -l -p 9000 > bar

sender:

    nc -q 0 receiver 9000 < foo

or set up a shared volume!

# Symmetric key encryption

gpg --symmetric filename

gpg --decrypt filename.gpg

# Public / Assymetric key encryption

1. Motivation: Why Cryptography Matters

   - “How can I send a secret to someone I’ve never met before?”
   - Real-world problems:
   - Sending sensitive info over insecure channels (e.g., Wi-Fi, internet)
     - Authenticating identity in a digital world

2. Basics of Public Key Encryption

- Conceptual Foundations

  - Every user has:
    - A public key (shared)
    - A private key (kept secret)
    - Encrypt with the public key → only decryptable with private key
      - Theoretical basis: Trapdoor one-way functions

  - Analogy: Lockbox and key
    - RSA simplified: multiplying primes is easy, factoring is hard

4. Applications and Use Cases (30 min)

5. Role of Certificate Authorities (CAs)

   ssh-keygen ssh-copy-id user@server

6. Pitfalls and Attacks (10–15 min)

   - Man-in-the-middle attack
   - Fake certificates / bad CAs
   - Weak key sizes (e.g., deprecated 1024-bit RSA)
   - Social engineering (e.g., tricking users into trusting malicious keys)

# Encrypting a Message for a Peer

Goal: Learn how to encrypt data so only a specific user can read it.

1. Generate a key pair:

   gpg --full-generate-key

2. Export your public key and share it

   gpg --export -a "Your Name" > yourname_pubkey.asc

3. Import a peer’s public key:

   gpg --import friend_pubkey.asc

4. Encrypt a message:

   echo "Secret launch codes: 12345" > secret.txt

   gpg --encrypt --recipient "Friend Name" secret.txt

5. Friend decrypts it:

   gpg --decrypt secret.txt.gpg

# Signing a Message

Goal: Show how to prove authorship of a message.

1. Create a text file

   echo "I, Alice, approve this transaction." > statement.txt

2. Sign it

   gpg --clearsign statement.txt

3. Verify the signature

gpg --verify statement.txt.asc

# Verifying the Authenticity of a File

Goal: Validate that a file was signed by a trusted person.

Scenario: You’ve downloaded a script and want to verify its signature.

1. Download both script.sh and script.sh.asc.

2. Import the author’s public key.

3. Verify the signature:

   gpg --verify script.sh.asc script.sh

# Creating a Detached Signature

Goal: Allow verification of a file without modifying it.

1. Create a file:

   echo "Version 1.2.3 release notes" > release.txt

2. Sign with a detached signature:

   gpg --output release.txt.sig --detach-sign release.txt

3. Distribute both release.txt and release.txt.sig.

# Encrypting and Signing a File (Hybrid)

Goal: Ensure confidentiality and authenticity.

1. Encrypt and sign a file in one step:

   gpg --encrypt --sign --recipient "Friend Name" secret.txt
