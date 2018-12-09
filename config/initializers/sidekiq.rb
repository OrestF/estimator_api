require 'sidekiq'

redis_conn = proc {
  Redis.current
}

Sidekiq.configure_server do |config|
  config.redis = ConnectionPool.new(size: 7, network_timeout: 5, &redis_conn)
end

Sidekiq.configure_client do |config|
  config.redis = ConnectionPool.new(size: 7, network_timeout: 5, &redis_conn)
end
