# frozen_string_literal: true

require 'forwardable'
require 'dry-struct'
require 'dry-schema'

module LingutestClient
  class Base < Dry::Struct
    extend Forwardable

    def_delegator :to_hash, :to_json

    def to_hash(object = self, type = self.class) # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
      type.schema.each_with_object({}) do |key, res|
        name = key.name
        attr = key.type
        if array?(attr)
          values = ::Array.wrap(object.public_send(name))
          res[name] = values.map do |value_item|
            serialize(value_item, attr.member)
          end
        elsif bool?(attr)
          value = object.public_send("#{name}?")
          res[name] = value
        else
          value = object.public_send(name)
          res[name] = serialize(value, attr)
        end
      end
    end

    private

    def serialize(object, type)
      complex?(type) ? to_hash(object, type) : object
    end

    def complex?(attribute)
      attribute.respond_to?(:<) && attribute < Base
    end

    def bool?(attribute)
      attribute.primitive?(true)
    end

    def array?(attribute)
      attribute.primitive?([])
    end
  end
end
