module Mutators
  class Create
    def self.call(params)
      new(params).call
    end

    def initialize(params)
      @params = params
    end

    def call
      record.save

      record
    end

    protected

    attr_reader :params

    def record
      @record ||= model.new(params)
    end
  end
end
