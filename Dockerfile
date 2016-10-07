# c9
FROM z3cka/debianvm:latest
MAINTAINER Casey Grzecka <c@sey.gr>

RUN apt update && apt install -y build-essential gcc git make python2.7
# load nvm & desired node version
ENV NVM_DIR=/root/.nvm
RUN . /root/.nvm/nvm.sh && nvm install --lts && nvm use stable

# get c9 and checkout temp fix for missing plugin
RUN git clone https://github.com/z3cka/core.git /c9 && \
    cd /c9 && \
    git checkout -b wrong-refspecs remotes/origin/wrong-refspecs && \
    scripts/install-sdk.sh

# use bash during build
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
# install some extra dev goodies like
# * apache support for older versions of php in apache via phpbrew
# * pip for installing CodeIntel in c9
RUN apt install -y apache2-dev apt python-setuptools
RUN easy_install pip
RUN pip install -U pip
RUN pip install -U virtualenv && \
    virtualenv --python=python2 $HOME/.c9/python2 && \
    source $HOME/.c9/python2/bin/activate
RUN apt update && apt install -y python-dev
RUN mkdir /tmp/codeintel && pip install --download /tmp/codeintel codeintel==0.9.3

RUN mkdir /workspace

ARG c9port=80
ARG user=c9
ARG pass=rules
ARG workspace="/workspace"

ENV c9port $c9port
ENV user $user
ENV pass $pass
ENV workspace $workspace

EXPOSE 80

CMD /root/.nvm/versions/node/v4.6.0/bin/node /c9/server.js -p $c9port -a $user:$pass --listen 0.0.0.0 -w $workspace