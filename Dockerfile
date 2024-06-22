FROM amd64/ubuntu:latest

# Setup packages
ENV APT_PACKAGES \
	ca-certificates steamcmd \
	libncurses6:i386 libbz2-1.0:i386 libtinfo6:i386 libcurl4t64:i386 
RUN echo steamcmd steam/license note "" | debconf-set-selections \
	&& echo steamcmd steam/question select "I AGREE" | debconf-set-selections
RUN dpkg --add-architecture i386 \
 	&& apt-get update \
	&& apt-get upgrade --yes \
 	&& apt-get install --yes ${APT_PACKAGES}
 
# Create and become user
RUN groupadd --gid 10000 teamfortress2 \
	&& useradd --create-home --uid 10000 --gid teamfortress2 teamfortress2
USER teamfortress2
WORKDIR /home/teamfortress2

# Create mountpoints to ensure appropriate permissions
RUN mkdir /home/teamfortress2/app

# Copy files and start
COPY files/start.sh /usr/libexec/teamfortress2-server.sh
CMD [ "/usr/libexec/teamfortress2-server.sh" ]
