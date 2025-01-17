# frozen_string_literal: true

module LingutestClient
  module API
    module Operations
      module List
        class << self
          def module(list_type)
            Module.new do
              class_methods_module = Module.new
              class_methods_module.define_method :list do
                list_type.new(Client.get(resource_url).body)
              end
              define_singleton_method :included do |base|
                base.extend class_methods_module
              end
            end
          end
        end
      end
    end
  end
end
