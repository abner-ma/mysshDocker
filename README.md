# mysshDocker
This is a Dockerfile to build a ssh docker,it is used by myself,other people also can use it.

How to use it?
#docker pull njuptgggzs/mysshdocker:latest
#docker run -p 2222:22 -d njuptgggzs/mysshdocker
#ssh test@127.0.0.1 -p 2222
It will use test to login the container,the password is 123456,you also can find it in Dockerfile,the root's password also can be find in the file.
