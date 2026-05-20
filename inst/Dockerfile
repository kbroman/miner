FROM mcr.microsoft.com/openjdk/jdk:25-ubuntu
LABEL org.opencontainers.image.authors="daroczig@rapporter.net"

ARG GAMEMODE="creative"
ARG FORCE_GAMEMODE="true"
ARG RASPBERRY_JUICE_VER="1.12.1"
ARG SPIGOT_VER="26.1.2"

## Prepare folder for the Minecraft stuff
RUN mkdir -p /minecraft

## need wget and git
RUN apt update && apt install -y wget git

## Download Spigot build tools
RUN wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar -P /minecraft/

## Build the Spigot server
RUN cd /minecraft && java -jar BuildTools.jar --rev ${SPIGOT_VER}

## Symlink for the built Spigot server
RUN ln -s /minecraft/spigot-${SPIGOT_VER}.jar /minecraft/spigot.jar

## Run once
#RUN java -jar -Xms512M -Xmx1G spigot.jar nogui

## Accept EULA
RUN echo "eula=true" > /minecraft/eula.txt

## Replace lines in server.properties
RUN sed -i "s/gamemode=survival/gamemode=${GAMEMODE}/" /minecraft/server.properties
RUN sed -i "s/force-gamemode=false/force-gamemode=${FORCE_GAMEMODE}/" /minecraft/server.properties

## Download and install the RaspberryJuice plugin for API access
RUN mkdir -p /minecraft/plugins \
    && wget https://github.com/zhuowei/RaspberryJuice/raw/master/jars/raspberryjuice-${RASPBERRY_JUICE_VER}.jar \
    && mv raspberryjuice-${RASPBERRY_JUICE_VER}.jar /minecraft/plugins/

## Open up API port
EXPOSE 4711
## Open up Game port
EXPOSE 25565

## Start the server
CMD cd /minecraft; java -Xms512M -Xmx1G -jar spigot.jar nogui
