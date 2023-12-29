FROM ubuntu:22.04
# [...]
ENV DEBIAN_FRONTEND="noninteractive"
RUN apt-get update && apt-get install -y git
RUN git clone --recurse-submodules -j8 https://github.com/hukkelas/Dotfiles ~/.dotfiles 
RUN rm ~/.dotfiles/setup.sh
COPY setup.sh /root/.dotfiles/
RUN chmod +x ~/.dotfiles/setup.sh && ~/.dotfiles/setup.sh


