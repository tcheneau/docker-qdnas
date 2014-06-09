FROM debian:stable
MAINTAINER Tony Cheneau <tony.cheneau@amnesiak.org>
RUN apt-get update
RUN apt-get install -y samba samba-tools 
RUN mkdir /nas
ADD smb.conf /etc/samba/smb.conf
CMD /usr/sbin/smbd -F
