module Railzend::ActAsI18n
  extend ActiveSupport::Concern

  module ClassMethods
    def act_as_i18n( fields )

      class_eval do
        I18n.available_locales.each do |lang|
          lang = lang.to_s.underscore
          has_one lang.to_sym , :class_name => "#{self.name}Translation" , :foreign_key => self.name.foreign_key , :conditions => { :lang => lang }    
          accepts_nested_attributes_for lang.to_sym
        end      
      end
          
      fields.each do |field|
        define_method "#{field}" do | lang= I18n.default_locale |
          lang = lang.to_s.underscore
          send( "build_#{lang}") if send( lang ).nil?
          return send( lang ).send( field)
        end
      end      
      
    end
  end
  
end