class Creds
  class << self
    def fetch(*keys)
      new(keys).send(:fetch)
    end
  end

  def initialize(keys)
    @keys = keys
  end

  private

  attr_reader :keys

  def fetch
    cred = Rails.application.credentials.dig(Rails.env.to_sym, *keys)
    return cred if cred.present?

    ENV[keys.join('_').upcase]
  end
end
