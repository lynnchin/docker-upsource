FROM java:openjdk-8-jre

MAINTAINER Lynn Chin <lynn@inkl.com>

ENV UPSOURCE_VERSION 2.5.4995

ENV JAVA_HOME /usr/bin/java

RUN         apt-get update -y && apt-get install -y unzip

VOLUME ["/opt/Upsource/conf", "/opt/Upsource/data", "/opt/Upsource/logs", "/opt/Upsource/backups"]

WORKDIR /opt

RUN mkdir -p /home/upsource \
	&& groupadd -g 999 upsource \
	&& useradd -u 999 -g upsource -d /home/upsource upsource \
	&& chown -R upsource:upsource /home/upsource 

ADD http://download.jetbrains.com/upsource/upsource-$UPSOURCE_VERSION.zip /opt/
	
RUN unzip upsource-$UPSOURCE_VERSION.zip \
	&& rm -rf upsource-$UPSOURCE_VERSION.zip \
	&& chown -R upsource:upsource Upsource

USER upsource

EXPOSE 8080

WORKDIR /opt/Upsource

ENTRYPOINT [“bin/upsource.sh”,”run”]

CMD ["bin/upsource.sh", "run"]
