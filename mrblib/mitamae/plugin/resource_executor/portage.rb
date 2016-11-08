module MItamae
  module Plugin
    module ResourceExecutor
      class Portage < MItamae::ResourceExecutor::Base
        def initialize(resource, options)
          super
        end

        def apply(current, desired)
          executor = RecipeExecutor.new(@options)
          if desired.exist
            executor.execute(install_children)
          else
            executor.execute(remove_children)
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
          recipes = []
          recipes << recipe_package(:install)
          recipes
        end

        def remove_children
          [] # TBD
        end

        def recipe_package(_action)
          _name, _version, _slot, _atom = self.attributes.name, self.attributes.version, self.attributes.slot, self.attributes.atom
          _emerge_cmd, _eix_cmd = self.attributes.emerge_cmd, self.attributes.eix_cmd
          _noreplace, _oneshot = self.attributes.noreplace, self.attributes.oneshot
          Resource::PortagePackage.new(_name, recipe) do
            action _action
            version _version if _version
            slot _slot
            atom _atom

            emerge_cmd _emerge_cmd
            eix_cmd _eix_cmd

            noreplace _noreplace
            oneshot _oneshot
          end
        end
      end
    end
  end
end
