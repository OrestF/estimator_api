Redis.current = Redis.new(url: Creds.fetch(:redis_url))