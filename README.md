# Debezium playground

Start up sample cluster:
```bash
docker-compose up
```

Wait for initialization, install pipeline:
```bash
curl -H "Content-type:application/json" -X POST http://localhost:8083/connectors -d '{
 "name": "postgresql_debezium",
 "config": {
   "connector.class": "io.debezium.connector.postgresql.PostgresConnector",
   "database.hostname": "postgres",
   "database.port": "5432",
   "database.user": "debezium",
   "database.password": "debezium",
   "database.dbname": "debezium",
   "database.server.name": "debezium",
   "plugin.name": "pgoutput",
   "database.sslmode": "disable"
 }
}'
```

Now, create table:
```
docker-compose exec postgres bash
# psql -U debezium
# create table test_1 ( id serial primary key, data text );
# insert into test_1 (data) values ('hello world');
```

In separate terminal, run kafkacat:
```bash
kafkacat -b 127.0.0.1:9093 -C -t debezium.public.test_1
```

Voila.
