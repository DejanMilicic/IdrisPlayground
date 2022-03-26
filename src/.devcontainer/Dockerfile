FROM ubuntu:22.04 as build

RUN apt update
ARG DEBIAN_FRONTEND=noninteractive
RUN apt install -y racket
RUN apt install -y git libgmp3-dev make gcc
RUN git clone https://github.com/idris-lang/Idris2 /opt/idris2

WORKDIR /opt/idris2

ENV IDRIS2_CG=racket
RUN make bootstrap-racket
RUN make install




FROM ubuntu:22.04
WORKDIR /opt/idris2
COPY --from=build /root/.idris2 /root/.idris2

RUN ln -s /root/.idris2/bin/idris2 /bin/idris

ENV PATH="/root/.idris2/bin:${PATH}"
ENV LD_LIBRARY_PATH="/root/.idris2/lib:${LD_LIBRARY_PATH}"

RUN apt-get update && \
    apt-get install -y racket

ENV SCHEME=scheme
RUN apt-get update && apt-get -y install chezscheme
RUN echo 'export PATH="/root/.idris2/bin/:${PATH}"' >> "${HOME}/.bashrc" && echo 'alias idris=idris2' >> "${HOME}/.bashrc"
ENTRYPOINT ["/root/.idris2/bin/idris2"]