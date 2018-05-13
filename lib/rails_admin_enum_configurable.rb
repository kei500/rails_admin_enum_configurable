require "rails_admin_enum_configurable/version"

module RailsAdminEnumConfigurable
  extend ActiveSupport::Concern

  module ClassMethods
    def method_missing(name)
      if name.to_s.end_with?('_enum') && respond_to?(name.to_s.match(/(.+)_enum/)[1].pluralize)
        attribute = name.to_s.match(/(.+)_enum/)[1]
        if self.send(attribute.pluralize).is_a?(::Hash)
          self.send(attribute.pluralize).keys.map{|k| [I18n.t("enums.#{self.to_s.underscore}.#{attribute}.#{k}"), k]}.to_h
        elsif self.send(attribute.pluralize).is_a?(::Array)
          self.send(attribute.pluralize).map{|k| I18n.t("enums.#{self.to_s.underscore}.#{attribute}.#{k}")}
        else
          raise "Unknown enum type. attribute: #{attribute}, type: #{self.send(attribute.pluralize).class}"
        end
      else
        super
      end
    end

    def respond_to?(name, include_all = false)
      if name.to_s.end_with?('_enum') && respond_to?(name.to_s.match(/(.+)_enum/)[1].pluralize)
        true
      else
        super
      end
    end

    def respond_to_missing?(name, include_all = false)
      if name.to_s.end_with?('_enum') && respond_to?(name.to_s.match(/(.+)_enum/)[1].pluralize)
        true
      else
        super
      end
    end
  end
end
