FROM ubuntu:22.04
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -yq unzip apt-utils wget binutils gosu && \
    groupadd -g 1000 tk5 && \
    useradd -u 1000 -g 1000 -m -s /bin/bash tk5 && \
    mkdir /tk5 && \
    cd /tk5 && \
    wget -O tk5_current.zip https://github.com/bigdale123/tk5-docker/releases/download/update-5/mvs-tk5.zip && \
    unzip tk5_current.zip -d /tk5/ && \
    rm -f /tk5/tk5_current.zip && \
    # Remove unused OS platform binaries bundled in the archive
    rm -rf /tk5/hercules/darwin && \
    rm -rf /tk5/hercules/windows && \
    rm -rf /tk5/hercules/source && \
    apt-get -y purge wget unzip && \
    apt-get -y autoclean && apt-get -y autoremove && \
    apt-get -y purge $(dpkg --get-selections | grep deinstall | sed s/deinstall//g) && \
    rm -rf /var/lib/apt/lists/* && \
    # Keep copy of default files to seed volume mounts on first container run
    mkdir -p /tk5-defaults && \
    cp -r /tk5/conf /tk5/local_conf /tk5/local_scripts /tk5/prt /tk5/dasd /tk5/pch /tk5/jcl /tk5/log /tk5-defaults/
    # Grant full execution permissions and ownership across the entire install tree
    chmod -R +x /tk5 /tk5-defaults && \
    chown -R 1000:1000 /tk5 /tk5-defaults && \
    apt-get -y purge wget unzip && \

WORKDIR /tk5/
VOLUME [ "/tk5/conf", "/tk5/local_conf", "/tk5/local_scripts", "/tk5/prt", "/tk5/dasd", "/tk5/pch", "/tk5/jcl", "/tk5/log" ]
EXPOSE 3270 8038

COPY entrypoint.sh /tk5/entrypoint.sh
RUN chmod +x /tk5/entrypoint.sh
ENTRYPOINT ["/tk5/entrypoint.sh"]
