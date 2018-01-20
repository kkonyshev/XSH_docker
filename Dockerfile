FROM ubuntu:17.10

RUN apt-get update

#Install Berkeley 4.8 db libs on Ubuntu 16.04
#https://cryptoandcoffee.com/mining-gems/install-berkeley-4-8-db-libs-on-ubuntu-16-04/
RUN apt-get install -y apt-utils software-properties-common python-software-properties

RUN add-apt-repository ppa:bitcoin/bitcoin

RUN apt-get install -y libdb-dev libdb++-dev build-essential libtool autotools-dev automake pkg-config libssl1.0-dev libevent-dev bsdmainutils git libboost-all-dev libminiupnpc-dev libqt5gui5 libqt5core5a libqt5webkit5-dev libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler libqrencode-dev

RUN apt-get install -y git

WORKDIR /src

RUN git clone https://github.com/ShieldCoin/SHIELD
WORKDIR /src/SHIELD

RUN ./autogen.sh
RUN ./configure --with-incompatible-bdb 
RUN make install

RUN cp /src/SHIELD/src/SHIELDd /usr/bin/

WORKDIR /
ENTRYPOINT ["/bin/sh"]
