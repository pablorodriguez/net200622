# frozen_string_literal: true

Redis.current =
  Redis.new(url: Rails.application.secrets.rails_redis_url)
