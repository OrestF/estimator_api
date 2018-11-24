module Serialization
  extend ActiveSupport::Concern

  def crud_response(record, view = nil)
    hash = serialize_record(record, view)

    status = if record.errors.none?
               :ok
             else
               hash[:errors] = record.errors.messages
               :bad_request
             end

    render_json(hash, status)
  end

  def collection_response(collection, view = nil)
    paginate json: serialize_collection(collection, view), status: :ok
  end

  def render_json(message, status)
    render json: message, status: status
  end

  def serialize_collection(collection, view = nil)
    collection.klass.name.constantize.serializer.render_as_hash(collection, view: view)
  end

  def serialize_record(record, view = nil)
    record.class.name.constantize.serializer.render_as_hash(record, view: view)
  end

  def render_response
    result = yield
    status = :ok
  rescue ActiveRecord::RecordNotFound => e
    result = e
    status = :bad_request
  ensure
    render_json(result, status)
  end
end
