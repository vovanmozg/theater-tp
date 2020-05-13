#!/bin/bash
if [ "$APP_ENV" == "production" ]; then
    npm run start-prod
fi

if [ "$APP_ENV" == "development" ]; then
    npm run start-dev
fi
