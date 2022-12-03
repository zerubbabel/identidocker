FROM python:3.4
RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi 
RUN pip install Flask uWSGI requests 
WORKDIR /app
COPY app /app
EXPOSE 9090 9191 
RUN pip install redis
USER uwsgi
CMD ["uwsgi","--http","0.0.0.0:9090","--wsgi-file","/app/identidock.py"]

