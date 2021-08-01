#JAVA JDK IMAGE
FROM amazoncorretto:8

RUN yum -y update
RUN yum -y install yum-utils
RUN yum -y install wget
RUN yum -y groupinstall development

RUN yum list python3*
RUN yum -y install python3 python3-dev python3-pip python3-virtualenv

ENV PYSPARK_DRIVER_PYTHON python3
ENV PYSPARK_PYTHON python3

WORKDIR /workdirectory
# COPY spark-3.1.2-bin-hadoop2.7 ./spark-3.1.2-bin-hadoop2.7/
RUN wget -q https://archive.apache.org/dist/spark/spark-3.1.2/spark-3.1.2-bin-hadoop2.7.tgz
RUN tar xzvf spark-3.1.2-bin-hadoop2.7.tgz
ENV SPARK_HOME /workdirectory/spark-3.1.2-bin-hadoop2.7
RUN export SPARK_HOME

COPY requirements.txt ./
RUN pip3 install --upgrade pip
RUN pip3 install --no-cache-dir -r requirements.txt

copy . .