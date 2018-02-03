# mysshDocker #

This is a Dockerfile also build a image for using latex.

How to use it?

#docker pull njuptgggzs/mysshdocker:v2
#docker run --rm -v /path/to/dir:/mytmp njuptgggzs/mysshdocker /bin/bash -c "pdflatex test.tex"

test.tex is what you write and want to build a pdf ,/path/to/dir is where you test.tex file in.