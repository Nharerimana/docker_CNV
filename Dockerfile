FROM debian:buster-slim
RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y make wget unzip git g++ zlib1g-dev bwa samtools msitools cabextract \
  mono-devel libgdiplus libicu67 libbz2-dev libssl-dev liblzma-dev libcurl4-openssl-dev \
  autoconf libdeflate-dev 
RUN wget https://github.com/samtools/htslib/releases/download/1.13/htslib-1.13.tar.bz2 && \
  tar -xf htslib-1.13.tar.bz2 && \
  cd htslib-1.13/ && \
  autoreconf -i && \
  ./configure && \
  make && \
  make install && \
  cd .. && \
  rm -rf htslib-1.13 htslib-1.13.tar.bz2
RUN git clone --branch=develop git://github.com/samtools/bcftools.git && \
  wget -P bcftools/plugins https://raw.githubusercontent.com/freeseek/gtc2vcf/master/{gtc2vcf.{c,h},affy2vcf.c} && \
  cd bcftools && \
  make && \
  make install && \
  cd .. && rm -rf bcftools
ENTRYPOINT ["bcftools"]
