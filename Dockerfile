FROM python:3.4
RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi 
RUN pip install Flask uWSGI requests 
WORKDIR /app
COPY app /app
COPY cmd.sh /
CMD ["chmod","+x","/cmd.sh"]
EXPOSE 9090 9191 
RUN pip install redis
USER uwsgi
CMD ["/cmd.sh"]

