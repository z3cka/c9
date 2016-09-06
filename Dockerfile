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
ARG c9port=80
ARG user=c9
ARG pass=rules
ENV c9port $c9port
ENV user $user
ENV pass $pass
EXPOSE 80
CMD /root/.nvm/versions/node/v4.5.0/bin/node /c9/server.js -p $c9port -a $user:$pass --listen 0.0.0.0 -w /workspace