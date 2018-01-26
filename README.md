# mysshDocker #

This is a Dockerfile to build a image for using plantuml.

How to use it?

```
#docker pull njuptgggzs/mysshdocker:latest
#docker run --rm -v /path/to/dir:/mytmp njuptgggzs/mysshdocker /bin/bash -c "java -jar /plantuml.jar testuml"
```

testuml is waht you write and want to build a picture ,/path/to/dir is where you testuml file in.
