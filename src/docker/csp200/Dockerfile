FROM ubuntu:22.04

# variables used in later commands (customize these!)
ARG USERNAME=csp200dev
ARG GIT_NAME="CSP200 Student"
ARG GIT_EMAIL="csp200@iit.edu"

# install packages
RUN apt-get update \ 
    && apt-get install -y --no-install-recommends \ 
        ca-certificates \ 
        gnupg2 \ 
        software-properties-common \ 
    && add-apt-repository -y ppa:maveonair/helix-editor \ 
    && apt-get update \ 
    && apt-get install -y --no-install-recommends \ 
        bat \ 
        build-essential \ 
        curl \ 
        fortune-mod \ 
        fortunes \ 
        gdb \ 
        git \ 
        helix \ 
        htop \ 
        hydra \ 
        iproute2 \ 
        iputils-ping \ 
        jq \ 
        locate \ 
        lsof \ 
        net-tools \ 
        netcat \ 
        nmap \ 
        python3 \ 
        python3-pip \ 
        rsyslog \ 
        ssh \ 
        sudo \ 
        tmux \ 
        tree \ 
        xxd \ 
    && apt-get clean \ 
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# create symlinks for some programs
RUN ln -s /usr/games/fortune /usr/local/bin \ 
    && ln -s /usr/bin/batcat /usr/local/bin/bat

# add a user and allow them to sudo
RUN useradd -m $USERNAME \ 
    && mkdir -p /etc/sudoers.d \ 
    && echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USERNAME \ 
    && chmod 0440 /etc/sudoers.d/$USERNAME

# run following commands as the added user
USER $USERNAME

# configure git
RUN git config --global user.email "$GIT_EMAIL" \  
    && git config --global user.name "$GIT_NAME" \ 
    && git config --global init.defaultBranch main

# create and use this as the workdir
WORKDIR "/work"

# default command to execute when running the container
CMD ["/bin/bash"]
