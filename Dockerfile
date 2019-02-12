FROM ubuntu

RUN apt-get update -yqq && apt-get install -yqq wget

RUN wget ftp://public.dhe.ibm.com/storage/tivoli-storage-management/maintenance/client/v7r1/Linux/LinuxX86_DEB/BA/v716/7.1.6.0-TIV-TSMBAC-LinuxX86_DEB.tar
RUN tar xvf 7.1.6.0-TIV-TSMBAC-LinuxX86_DEB.tar
RUN dpkg -i gskcrypt64_8.0-50.66.linux.x86_64.deb
RUN dpkg -i gskssl64_8.0-50.66.linux.x86_64.deb
RUN dpkg -i tivsm-api64.amd64.deb
RUN dpkg -i tivsm-ba.amd64.deb
RUN cp /opt/tivoli/tsm/client/ba/bin/dsm.sys.smp /opt/tivoli/tsm/client/ba/bin/dsm.sys
RUN chmod +w /opt/tivoli/tsm/client/ba/bin/dsm.sys
RUN cp /opt/tivoli/tsm/client/ba/bin/dsm.opt.smp /opt/tivoli/tsm/client/ba/bin/dsm.opt
RUN chmod +w /opt/tivoli/tsm/client/ba/bin/dsm.opt
EXPOSE 1500:1500
CMD bash

