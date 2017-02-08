
Theano develop mode using Docker

This Makefile is based on the work of https://docs.docker.com/opensource/project/set-up-dev-env/
Please refer to https://docs.docker.com/opensource/project/set-up-dev-env/ for more information.

How to setup the Theano develop mode using Docker.

[1] download (or git clone) this source code folder.
[2] cd source-code-folder
[3] sudo make BIND_DIR=. shell
[4] wait... wait ... then a bash shell (root@60cddc014353:/#) will be ready (the Docker image name is theano-dev:01)
[5] (in the bash sehll) root@60cddc014353:/# cd home/develop
[6] (in the bash shell) root@60cddc014353:/home/develop# apt-get remove -y python-numpy
[6] (in the bash shell) root@60cddc014353:/home/develop# pip install nump
[7] (in the bash shell) root@60cddc014353:/home/develop# python setup.py develop

[8] go to the line 28 in ./theano/__init__.py in the downloaded source code folder.
[9] delete # to enable the line 28 
	print ("... working in Docker from the souce code ...")

[10] (in the shell) root@60cddc014353:/home/develop# python
[11] (in the shell) >>> import theano
			... working in Docker from the souce code ...

You can see the souce code chanage in Theano on the fly in Docker.


