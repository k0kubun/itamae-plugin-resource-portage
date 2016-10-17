module Itamae
  module Plugin
    module ResourceExecutor
      class Portage < Itamae::ResourceExecutor::Base
        def initialize(resource, options)
          super
          @recipe_executor = RecipeExecutor.new(options)
        end

        def apply(current, desired)
          if desired.exist
            install_children.each do |recipe|
              @recipe_executor.execute(recipe)
            end
          else
            remove_children.each do |node|
              @recipe_executor.execute(recipe)
            end
          end
        end

        private

        def set_current_attributes(current, action)
          # Do argument check and dry-run?
        end

        def set_desired_attributes(desired, action)
          case action
          when :install
            desired.exist = true
          when :remove
            desired.exist = false
          end
        end

        def install_children
          [] # TBD
        end

        def remove_children
          [] # TBD
        end
      end
    end
  end
end
