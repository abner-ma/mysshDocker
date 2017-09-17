# mysshDocker
This is a Dockerfile to build a docker for sending mail,it is used by myself,other people also can use it.

How to use it?
```
#docker pull njuptgggzs/mysshdocker:latest
```


not work now!

It will use test to login the container,the password is 123456,you also can find it in Dockerfile,the root's password also can be find in the file.

How to use plantuml.jar to plant you uml?
1.Edit you umlscripi,it could be a file which named testuml

2.Create a directory to be mounted,and move testuml to this directory.For example:mkdir /root/dock && mv testuml /root/dock

3.Start the docker like this:
docker run -v /root/dock/:/mnt njuptgggzs/mysshdocker java -jar plantuml.jar /mnt/testuml

After this,it will be a file named "testuml.png" in /root/dock .
