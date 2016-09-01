FROM z3cka/debianvm:latest
MAINTAINER Casey Grzecka <c@sey.gr>

RUN apt update && apt install -y git 
# load nvm
ENV NVM_DIR=/root/.nvm
RUN . $HOME/.nvm/nvm.sh && nvm install 0.12