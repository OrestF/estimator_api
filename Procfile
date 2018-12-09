estimator_api: bundle exec puma -p 3000 -C config/puma.rb
redis: bundle exec redis-server
sidekiq: bundle exec sidekiq
sneakers-workers: env WORKERS=Rabbitmq::Consumers::BrieferProjects bundle exec rake sneakers:run
