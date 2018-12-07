module Mutators
  class Update
    def self.call(record, params)
      new(record, params).call
    end

    def initialize(record, params)
      @record = define_record(record)
      @params = params
    end

    def call
      record.update(params)

      record
    end

    protected

    attr_reader :record, :params

    def define_record(record)
      return record if record.instance_of?(repo)

      repo.find(record)
    end
  end
end
