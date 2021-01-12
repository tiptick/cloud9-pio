# ------------------------------------------------------------------------------
# Pull base image.
FROM linuxserver/cloud9
MAINTAINER tiptick

# ------------------------------------------------------------------------------
# Install platformIO
RUN apt-get update
RUN apt-get install -y python3 python3-dev python3-pip curl openssh-client
RUN sudo pip3 install -U platformio

# ------------------------------------------------------------------------------
# cleanup
RUN apt-get autoclean && \
 rm -rf \
	/var/lib/apt/lists/* \
	/var/tmp/* \
	/tmp/*


# ------------------------------------------------------------------------------
