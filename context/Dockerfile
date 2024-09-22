ARG VERSION=latest
FROM andzuc/debian-base:$VERSION
RUN apt-get -y update && apt-get install -y \
    firefox-esr
RUN useradd -m surfer
USER surfer
ENV HOME=/home/surfer
WORKDIR /home/surfer
RUN chmod a+w .
ENTRYPOINT ["/usr/bin/firefox", "--no-remote", "--profile", "/home/surfer/profile"]
