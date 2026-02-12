FROM ubuntu
RUN apt update -y
RUN apt install apache -y
RUN apt install apache2-utils -y
EXPOSE 80
CMD["apache2ctl","-D","FOREGROUND"]
