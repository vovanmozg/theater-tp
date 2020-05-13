# REST API for the theater
Create, view, edit and delete events for the theater.

## Install and run

```
git clone https://github.com/vovanmozg/theater-tp.git
cd theater-tp
docker-compose up -d
```

## Basic usage
### With React Admin panel

Go to http://localhost:3000

### Direct REST requests

```
# get events
curl http://localhost:3001/events

# get specific event
curl http://localhost:3001/events/1

# create event
curl -d '{"title":"Title", "date_start":"2020-02-01", "date_end":"2020-02-03"}' -H "Content-Type: application/json" -X POST http://localhost:3001/events 
```

## Details
`docker-compose up` runs 4 docker containers:

```
theater-tp_front_1    3000/tcp
theater-tp_api_1      3001/tcp
theater-tp_adminer_1  3002/tcp
theater-tp_db_1
```

### REST API
http://localhost:3001

container: `theater-tp_api_1`

### React Admin panel
http://localhost:3000

container: `theater-tp_front_1`

### PostgreSQL Admin panel
http://localhost:3002


- DB: `theater_prod`

- user: `rails`

- password: `rails`

container: `theater-tp_adminer_1`


### PostgreSQL
container: `theater-tp_db_1`


## TODO
- add authentication 
### api
- configure RuboCop rules (see output of `rubocop`)
### front
- add jest
- link backend error with fields
- move errors to translate and add russian translates


