require 'rails_admin_enum_configurable/version'

module RailsAdminEnumConfigurable
  extend ActiveSupport::Concern

  module ClassMethods
    @@enum_attribtues = {}

    def enum(definitions)
      # call super first because super deletes :_prefix and :_suffix (these are unnecessary) from definitions.
      super
      @@enum_attribtues[self.to_s.underscore] ||= []
      @@enum_attribtues[self.to_s.underscore].push(definitions.keys.first)
    end

    def enum_attributes
      @@enum_attribtues[self.to_s.underscore] || []
    end

    def enum_method?(name)
      name.to_s.end_with?('_enum') && enum_attributes.include?(name.to_s.match(/(.+)_enum/)[1].to_sym)
    end

    def method_missing(name)
      if enum_method?(name)
        attribute = name.to_s.match(/(.+)_enum/)[1]
        if self.send(attribute.pluralize).is_a?(::Hash)
          self.send(attribute.pluralize).keys.map{|k| [I18n.t("enums.#{self.to_s.underscore}.#{attribute}.#{k}", default: k), k]}.to_h
        elsif self.send(attribute.pluralize).is_a?(::Array)
          self.send(attribute.pluralize).map{|k| I18n.t("enums.#{self.to_s.underscore}.#{attribute}.#{k}", default: k)}
        else
          raise "Unknown enum type. attribute: #{attribute}, type: #{self.send(attribute.pluralize).class}"
        end
      else
        super
      end
    end

    def respond_to?(name, include_all = false)
      enum_method?(name) || super
    end

    def respond_to_missing?(name, include_all = false)
      enum_method?(name) || super
    end
  end
end
