FROM alpine:3.14
RUN mkdir setup
RUN apk add --no-cache g++ gcc make cmake bzip2-dev zlib-dev ncurses-dev \
  xz-dev autoconf curl-dev openssl-dev git wget
RUN cd setup
RUN wget https://github.com/samtools/htslib/releases/download/1.13/htslib-1.13.tar.bz2 && \
  tar -xf htslib-1.13.tar.bz2 && \
  cd htslib-1.13/ && \
  autoreconf -i && \
  ./configure && \
  make && \
  make install && \
  cd ..
RUN git clone https://github.com/statgen/ruth.git && \
  cd ruth && mkdir build && cd build && \
  cmake .. && \
  make && \
  cd .. && \
  cp bin/ruth /usr/local/bin/ && \
  cd ..
RUN cd .. && rm -rf setup
ENTRYPOINT ["ruth"]
