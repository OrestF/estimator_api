# EstimatorAPI v0.1


### One place to manage all estimation processes 

##### Documentation: https://estimator-api-dev.herokuapp.com/api/docs

This service works in a pair with https://briefer-go.herokuapp.com/ - application
written in golang for text analysis

*REQUIREMENTS*

1. Ruby 2.5.1
1. ELASTICSEARCH_URL environment variable to be set (and service of course)
1. Redis server 
1. RabbitMQ server
1. Sidekiq

*NOTE*: ElasticSearch, Rabbitmq, Sidekiq and redis are not working on current production server!
