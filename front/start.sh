#!/bin/bash
if [ "$APP_ENV" == "production" ]; then
    serve -s build -l $PORT
fi

if [ "$APP_ENV" == "development" ]; then
    ./node_modules/.bin/react-scripts start
fi
