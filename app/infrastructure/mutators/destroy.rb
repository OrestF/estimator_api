module Mutators
  class Destroy
    def self.call(record)
      new(record).call
    end

    def initialize(record)
      @record = define_record(record)
    end

    def call
      record.destroy

      record
    end

    protected

    attr_reader :record

    def define_record(record)
      return record if record.instance_of?(model)

      model.find(record)
    end
  end
end
