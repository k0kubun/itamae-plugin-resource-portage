module MItamae
  module Plugin
    module ResourceExecutor
      class PortagePackage < MItamae::ResourceExecutor::Base
        def apply(current, desired)
          # TBD
        end

        private

        def set_current_attributes(current, action)
          # TBD
        end

        def set_desired_attributes(desired, action)
          case action
          when :unmerge, :remove
            desired.installed = false
          when :update, :install
            desired.installed = true
          end
        end
      end
    end
  end
end
