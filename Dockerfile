FROM python:3.10

# Install Java 17 from a reliable source
RUN apt-get update && \
    apt-get install -y wget gnupg && \
    wget -O- https://packages.adoptium.net/artifactory/api/gpg/key/public | apt-key add - && \
    echo "deb https://packages.adoptium.net/artifactory/deb $(lsb_release -cs) main" \
        > /etc/apt/sources.list.d/adoptium.list && \
    apt-get update && \
    apt-get install -y temurin-17-jdk && \
    apt-get clean

ENV JAVA_HOME=/usr/lib/jvm/temurin-17-jdk-amd64
ENV PATH="$JAVA_HOME/bin:$PATH"

# Install Spark 3.5.1
RUN wget https://dlcdn.apache.org/spark/spark-3.5.1/spark-3.5.1-bin-hadoop3.tgz && \
    tar -xzf spark-3.5.1-bin-hadoop3.tgz -C /opt && \
    rm spark-3.5.1-bin-hadoop3.tgz

ENV SPARK_HOME=/opt/spark-3.5.1-bin-hadoop3
ENV PATH="$SPARK_HOME/bin:$PATH"

# Install Python dependencies
RUN pip install pyspark==3.5.1 faker

WORKDIR /app
COPY . /app

CMD ["/bin/bash"]
