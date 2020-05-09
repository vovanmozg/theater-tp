FROM bitnami/express

ENV DISABLE_WELCOME_MESSAGE=1

ENV NODE_ENV=production \
    PORT=3000

USER root
COPY . /app
WORKDIR /app

EXPOSE 3000

CMD ["./start.sh"]

