FROM ubuntu
RUN apt update -y
RUN apt install apache -y
EXPOSE 80
CMD["apache2ctl","-D","FOREGROUND"]
