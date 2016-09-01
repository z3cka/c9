FROM z3cka/debianvm:latest
MAINTAINER Casey Grzecka <c@sey.gr>

RUN apt update && install -y git 

RUN nvm install 0.12

