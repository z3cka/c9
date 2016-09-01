FROM z3cka/debianvm:latest
MAINTAINER Casey Grzecka <c@sey.gr>

RUN apt update && apt install -y git 
# load nvm
ENV NVM_DIR "/root/.nvm"
# RUN export NVM_DIR="$HOME/.nvm"
RUN nvm install 0.12