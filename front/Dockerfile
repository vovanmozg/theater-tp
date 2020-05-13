FROM bitnami/express

#ENV DISABLE_WELCOME_MESSAGE=1

#ENV NODE_ENV=production \
#    PORT=3000


USER root

WORKDIR /app
COPY package.json ./app
RUN yarn

COPY . /app
RUN ./node_modules/.bin/react-scripts build

EXPOSE 3000

CMD ["./start.sh"]

