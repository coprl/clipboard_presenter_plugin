require_relative 'clipboard/action'

module Coprl
  module Presenters
    module Plugins
      module Clipboard
        module DSLEventActions
          def clipboard(action, **attributes, &block)
            self << Clipboard::Action.new(action: action, parent: self, **attributes, &block)
          end
        end

        module WebClientComponents
          def view_dir_clipboard(pom)
            File.join(__dir__, '../../../..', 'views', 'components')
          end

          def render_header_clipboard(pom, render:)
            render.call :erb, :clipboard_header, views: view_dir_clipboard(pom)
          end
        end

        module WebClientActions
          def action_data_clipboard(action, parent_id, *)
            options = action.options.to_h.merge(
              __parent_id__: parent_id,
              action: action.action,
              element: action.element
            )

            # Type, URL, Options, Params (passed into javascript event/action classes)
            [action.type, nil, options, action.attributes.to_h]
          end
        end
      end
    end
  end
end
