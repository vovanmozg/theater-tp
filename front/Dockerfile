FROM bitnami/express

USER root

WORKDIR /app
COPY package.json /app
RUN yarn
RUN yarn global add serve
COPY . /app
RUN cat /app/.env >> /etc/environment
RUN ./node_modules/.bin/react-scripts build

CMD ["./start.sh"]
