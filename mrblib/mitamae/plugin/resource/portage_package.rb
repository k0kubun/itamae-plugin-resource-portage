module MItamae
  module Plugin
    module Resource
      class PortagePackage < MItamae::Resource::Base
        define_attribute :name, type: String, default_name: true

        define_attribute :version, type: String
        define_attribute :slot, type: String
        define_attribute :atom, type: String

        define_attribute :action, default: :install
        define_attribute :emerge_cmd, type: String, default: '/usr/bin/emerge'
        define_attribute :eix_cmd, type: String, default: '/usr/bin/eix'
        # define_attribute :eix_update_cmd, type: String, default: '/usr/bin/eix-update'

        define_attribute :noreplace, type: [TrueClass, FalseClass], default: true
        define_attribute :oneshot, type: [TrueClass, FalseClass], default: false

        self.available_actions = [:unmerge, :remove, :update, :install]
      end
    end
  end
end
