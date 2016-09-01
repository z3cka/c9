FROM z3cka/debianvm:latest
MAINTAINER Casey Grzecka <c@sey.gr>

RUN apt update && apt install -y build-essential gcc git make python2.7
# load nvm & desired node version
ENV NVM_DIR=/root/.nvm
RUN . $HOME/.nvm/nvm.sh && nvm install 0.12

RUN git clone git://github.com/c9/core.git /c9 && \
    cd /c9 && \
    scripts/install-sdk.sh