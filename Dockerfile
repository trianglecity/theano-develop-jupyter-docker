FROM ubuntu:14.04

RUN	apt-get update && \
	apt-get install -y build-essential && \
 	apt-get install -y apt-utils && \
	apt-get install -y automake && \
	apt-get install -y cmake && \
	apt-get install -y curl && \
	apt-get install -y libprotobuf-dev && \
	apt-get install -y gcc && \
	apt-get install -y gcc-4.9 && \
	apt-get install -y g++ && \
	apt-get install -y git && \
	apt-get install -y iptables && \
	apt-get install -y less && \
	apt-get install -y vim && \
	apt-get install -y vim-common && \
	apt-get install -y pkg-config && \
	apt-get install -y python-dev && \
	apt-get install -y python-pip && \
	apt-get install -y tar && \
	apt-get install -y zip && \
	apt-get install -y unzip && \
	apt-get install -y python-numpy && \
	apt-get install -y python-matplotlib && \
	apt-get install -y libblas-dev && \
	apt-get install -y python-nose && \
	apt-get install -y sphinx-common && \
	apt-get install -y python-sphinx && \
	apt-get install -y python-pydot && \
	apt-get install -y ipython && \
	apt-get install -y ipython-notebook && \
	apt-get install -y libblas-dev liblapack-dev && \
	apt-get install -y gfortran && \
	apt-get install -y libatlas-dev && \
	apt-get install -y firefox
        
RUN     pip install setuptools==33.1.1 && \
	pip install packaging && \
	pip install jupyter

