FROM python:3.9-alpine
VOLUME /var/run/docker.sock
EXPOSE 80
RUN apk update && apk upgrade
ADD ./ /app
RUN pip install -r /app/requirements.txt && find /app -type f -not -name 'healthchecker' -delete
CMD ["/app/healthchecker"]
