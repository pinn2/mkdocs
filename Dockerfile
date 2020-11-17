FROM python:3.8-slim
RUN apt-get update
RUN pip install --upgrade pip --no-cache-dir --

RUN pip install mkdocs
RUN mkdocs new root
EXPOSE 8000
WORKDIR /root

COPY mkdockerize.sh /root/bin/mkdockerize.sh
RUN chmod +x /root/bin/mkdockerize.sh

ENTRYPOINT ["/root/bin/mkdockerize.sh"]
