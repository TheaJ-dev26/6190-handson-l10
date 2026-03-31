FROM eclipse-temurin:17-jdk

# Install Python 3.10
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-venv curl && \
    apt-get clean

# Install Spark 3.5.1
RUN curl -L https://dlcdn.apache.org/spark/spark-3.5.1/spark-3.5.1-bin-hadoop3.tgz \
    -o spark.tgz && \
    tar -xzf spark.tgz -C /opt && \
    rm spark.tgz

ENV SPARK_HOME=/opt/spark-3.5.1-bin-hadoop3
ENV PATH="$SPARK_HOME/bin:$PATH"

# Install Python dependencies
RUN pip3 install pyspark==3.5.1 faker

# Copy your project
WORKDIR /app
COPY . /app

CMD ["/bin/bash"]
