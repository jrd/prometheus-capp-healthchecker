FROM python:3.9-alpine
EXPOSE 80
RUN apk update && apk upgrade
ADD ./ /app
RUN mkdir -p /var/run && \
    pip install -r /app/requirements.txt && \
    find /app -type f -not -name 'healthchecker' -delete
CMD ["/app/healthchecker"]
