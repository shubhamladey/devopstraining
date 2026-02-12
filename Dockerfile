FROM ubuntu
RUN apt update -y
RUN apt install apache -y
EXPOSE 80
CMD["apachectl2","-D","FOREGROUND"]
