FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive TZ="America/Toronto"

WORKDIR /VascuSynth

COPY Source ./Source

RUN apt-get update && apt-get install -y \ 
    cmake \ 
    libinsighttoolkit4-dev \
    python3 \
    python3-pip && \
    pip install --no-cache-dir -r Source/requirements.txt && \
    mkdir Build && mkdir HT_Trees 

CMD cd Build &&\
    cmake ../Source &&\
    make &&\
    cd ../Source && python3 generate_config_files.py && \
    cd ../HT_Trees && ../Build/VascuSynth paramFiles.txt imageNames.txt 0.04
