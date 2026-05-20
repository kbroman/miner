ARG GAMEMODE="creative"
ARG FORCE_GAMEMODE="true"
ARG RASPBERRY_JUICE_VER="1.12.1"

FROM mcr.microsoft.com/openjdk/jdk:25-ubuntu
LABEL org.opencontainers.image.authors="daroczig@rapporter.net"

## Prepare folder for the Minecraft stuff
RUN mkdir -p /minecraft

## need wget and git
RUN apt update && apt install -y wget git

## Download Spigot build tools
RUN wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar -P /minecraft/

## Build the Spigot server
RUN cd /minecraft && java -jar BuildTools.jar

## Symlink for the built Spigot server
RUN ln -s /minecraft/spigot*.jar /minecraft/spigot.jar

## Run once to create server.conf
RUN java -Xms512M -Xmx1G -jar spigot.jar

## Replace lines in server.conf
RUN sed -i "/gamemode=survival/gamemode=${GAMEMODE}/" server.conf
RUN sed -i "/force-gamemode=false/force-gamemode=${FORCE_GAMEMODE}/" server.conf

## Accept EULA
RUN echo "eula=true" > /minecraft/eula.txt

## Download and install the RaspberryJuice plugin for API access
RUN mkdir -p /minecraft/plugins \
    && wget https://github.com/zhuowei/RaspberryJuice/raw/master/jars/raspberryjuice-${RASPBERRY_JUICE_VER}.jar \
    && mv raspberryjuice-${RASPBERRY_JUICE_VER}.jar /minecraft/plugins/

## Open up API port
EXPOSE 4711
## Open up Game port
EXPOSE 25565

## Start the server
CMD cd /minecraft; java -Xms512M -Xmx1G -jar spigot.jar
