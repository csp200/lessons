# Information Security with Containers

## Dockerfile

- You can use the official
  [CSP200 Dockerfile](https://github.com/csp200/docker), which installs all
  packages needed for the commands used in the following demos.

  - Note that our Dockerfile creates a non-root user and drops you into the
    container as that user by default. In order to run privileged commands as
    that user, you'll need to use `sudo` (which we cover in the demos).

## Hands-On Demos

1. Understand local file permissions, access protection, and privilege
   escalation with `sudo`. Packages needed: `sudo`.

   - Create a regular user account with `adduser` in a running container and
     switch to that user with `su - USERNAME`.

   - View, alter, and understand the effects of file permissions:

     ```bash
     touch foo
     ls -l
     cat foo
     echo hello > foo
     cat foo
     ./foo
     chmod 755 foo
     ls -l
     echo -en '\07\05\05' | xxd -b # to convert octal to binary
     ./foo
     chmod 400 foo
     ls -l
     cat foo
     echo bye > foo
     rm foo
     chmod 000 foo
     cat foo
     ```

   - Alter the default file creation mode mask:

     ```bash
     umask
     touch baa
     ls -l
     umask 000
     touch bab
     ls -l
     umask 077
     touch bac
     ls -l
     umask 777
     touch bad
     ls -l
     umask 027 # a good default
     touch bae
     ls -l
     ```

   - Create another regular user account with `adduser`.

   - Add both users to group "users":

     ```bash
     usermod -a -G users USERNAME1
     usermod -a -G users USERNAME2
     ```

   - View the permissions of the home directories using `ls -l`. What operations
     do these permissions permit?

   - Switch to the users and try adjusting the permissions of their home
     directories and accessing their content from other user accounts:

     ```bash
     chmod 750 ~
     chgrp users ~
     ```

2. Create a network and manually attach two containers to the network. Packages
   needed: `iputils-ping`.

   ```bash
   docker network create csp200net

   # run the following in two separate terminals
   docker run --rm --name csp200-1 --network csp200net -it csp200
   docker run --rm --name csp200-2 --network csp200net -it csp200

   # confirm that they are able to reach each other
   ping csp200-2 # run on csp200-1
   ping csp200-1 # run on csp200-2

   # exit and stop containers
   docker stop csp200-1
   docker stop csp200-2
   docker network rm csp200net
   ```

3. Create a "docker-compose.yaml" to simplify this setup:

   ```yaml
   services:
     csp200-1:
       container_name: csp200-1
       image: csp200
       networks:
         - csp200net
       tty: true

     csp200-2:
       container_name: csp200-2
       image: csp200
       networks:
         - csp200net
       tty: true

   networks:
     csp200net:
       driver: bridge
   ```

   To start the containers, do `docker-compose up -d`

   To get terminal access to the containers, do:

   ```bash
   # in separate terminals
   docker exec -it csp200-1 bash
   docker exec -it csp200-2 bash
   ```

4. Create a user and set up SSH (in `csp200-1`):

   ```bash
   # follow the interactive prompts after the following command
   adduser USERNAME

   service ssh start
   ```

   SSH from one container into the other (run in `csp200-2`):

   ```bash
   ssh USERNAME@csp200-1
   ```

5. Scanning network ports. Packages needed: `nmap`, `iproute2`, `lsof`.

   - Scan for open network ports in a container (run in `csp200-1`):

     ```bash
     ss -tnlp
     lsof -i
     ```

   - Run another network application and run the above commands again:

     ```bash
     python3 -m http.server 8888 &
     ```

   - Scan one container from another (run in `csp200-2`):

     ```bash
     nmap csp200-1
     ```

6. Try to crack a password. Packages needed: `hydra`.

   - Be sure to set a password for the user on the machine to be hacked
     (csp200-1):

     ```bash
     passwd
     ```

   - Download a wordlist on the "hacking" machine (csp200-2):

     ```bash
     curl -LO https://github.com/praetorian-inc/Hob0Rules/raw/refs/heads/master/wordlists/rockyou.txt.gz
     gunzip rockyou.txt.gz
     ```

   - Try to brute force the password:

     ```bash
     hydra -l USERNAME -P rockyou.txt ssh://csp200-1 -f
     ```

7. Log activities and inspect logfiles. Packaged needed: `rsyslog`.

   - Start logging:

     ```bash
     service rsyslog start
     ```

   - Run hydra on the "hacking" system, then view the authentication log:

     ```bash
     tail -f /var/log/auth.log
     ```

8. Circumvent clear-text passwords using key-pair authentication.

   - Generate a key pair on the client machine (csp200-2) and copy it onto the
     server:

     ```bash
     ssh-keygen
     ssh-copy-id USERNAME@csp200-1
     ```

   - Log in to the server without clear-text password:

     ```bash
     ssh USERNAME@csp200-1
     ```

   - Disable clear-text password by editing "/etc/ssh/sshd_config" on the server
     (csp200-1), uncommenting and changing the following line:

     ```
     PasswordAuthentication no
     ```

     then restart the ssh service:

     ```bash
     service ssh restart
     ```

   - Attempting a non key-pair based login from the client shouldn't work:

     ```bash
     ssh OTHERUSER@csp200-1
     ```
