require 'coprl/presenters/dsl/components/actions/base'

module Coprl
  module Presenters
    module Plugins
      module Clipboard
        VALID_ACTIONS = %i[cut copy].freeze

        class Action < DSL::Components::Actions::Base
          attr_reader :action,
                      :element

          def initialize(action:, **attribs_, &block)
            super(type: :clipboard, **attribs_, &block)
            @action, @element = parse_action(action)
          end

          private

          # { 'copy' => :some_field } -> [:copy, :some_field]
          def parse_action(action)
            action = action.symbolize_keys if action.respond_to?(:symbolize_keys)
            action
              .keep_if { |k| VALID_ACTIONS.include?(k) }
              .first
          end
        end
      end
    end
  end
end
