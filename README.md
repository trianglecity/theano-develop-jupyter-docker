
Theano-develop-mode using jupyter and Docker

This work is based on the work of https://docs.docker.com/opensource/project/set-up-dev-env.
Please refer to https://docs.docker.com/opensource/project/set-up-dev-env/ for more information.


How to setup the Theano-develop-mode using jupyter and Docker.

[1] download (or git clone )  this source code folder.

[2] cd source-code-folder

[3] sudo make BIND_DIR=. shell

[4] wait... wait ... then a bash shell (root@f05a5efccbcf:/#) will be ready (the Docker image name is theano-dev-jupyter:01)

[5]  root@f05a5efccbcf:/# cd home/develop

[6]  root@f05a5efccbcf:/home/develop# apt-get remove -y python-numpy

[7]  root@f05a5efccbcf:/home/develop# pip install numpy

[8]  root@f05a5efccbcf:/home/develop# python setup.py develop

[9]  open an editor on the local machine and go to the line 28 in ./theano/__init__.py in the downloaded source code folder.

[10] delete # to enable the line 28 and save the file
 
	print ("... working in Docker from the souce code ...")

[11] root@f05a5efccbcf:/home/develop#cd notebook

[12] root@f05a5efccbcf:/home/develop/notebook#jupyter notebook --ip=0.0.0.0  --no-browser

	Copy/paste this URL into your browser when you connect for the first time,
        to login with a token:
        http://0.0.0.0:8888/?token=0a7fa3b7338c601ec9c8a2ce81e93f494b6319fb97595d55


[13] open a web browser on the local machine

[14] copy "http://0.0.0.0:8888/?token=0a7fa3b7338c601ec9c8a2ce81e93f494b6319fb97595d55"  from the Docker bash shell and paste it in the web browser

[15] type in " import theano " in the jupyter code cell and run it


			... working in Docker from the souce code ...



You can see the souce code change in Theano on the fly in the jupyter notebook.


