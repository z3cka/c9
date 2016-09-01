FROM z3cka/debianvm:latest
MAINTAINER Casey Grzecka <c@sey.gr>

RUN apt update && apt install -y build-essential gcc git make python2.7
# load nvm & desired node version
ENV NVM_DIR=/root/.nvm
RUN . /root/.nvm/nvm.sh && nvm install 4.5.0

RUN git clone git://github.com/c9/core.git /c9 && \
    cd /c9 && \
    scripts/install-sdk.sh

RUN mkdir /workspace
WORKDIR /workspace

CMD /root/.nvm/versions/node/v4.5.0/bin/node /c9/server.js -p 8080 -a : --listen 0.0.0.0 -w /workspace