FROM java
MAINTAINER daroczig@rapporter.net

## Download Spigot build tools
RUN wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar

## Build the Spigot server
RUN java -jar BuildTools.jar

## Symlink for the built Spigot server
RUN ln -s spigot*.jar spigot.jar

## Accept EULA
RUN echo "eula=true" > eula.txt

## Download and install the RaspberryJuice plugin for API access
RUN mkdir -p plugins \
    && wget https://github.com/zhuowei/RaspberryJuice/archive/master.zip \
    && unzip -p master.zip RaspberryJuice-master/jars/raspberryjuice-1.9.jar > plugins/raspberryjuice-1.9.jar

## Open up API port
EXPOSE 4711
## Open up Game port
EXPOSE 25565

## Start the server
CMD java -Xms512M -Xmx1G -XX:MaxPermSize=128M -XX:+UseConcMarkSweepGC -jar spigot.jar
