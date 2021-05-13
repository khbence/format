FROM ubuntu

RUN apt update
RUN apt install -y clang-format
RUN apt install -y pip
RUN pip install cmakelang
COPY Makefile .
COPY .clang-format /

ENTRYPOINT [ "make", "format" ]
