#encoding:utf-8
require "railzend/view/helper/document_ready"
require "railzend/view/helper/facebook"
require "railzend/view/helper/head_title"
require "railzend/view/helper/head_script"
require "railzend/view/helper/head_meta"
module Railzend::View::Helper
  def self.included(receiver)
    receiver.extend ClassMethods
    receiver.send :include, InstanceMethods
  end
  module ClassMethods    
  end
  
  module InstanceMethods
    def image_placehold( width , height , alt = '' )
      image_tag( "http://placehold.it/#{width.to_s}x#{height.to_s}" , { :alt => alt } )
    end

    def render_body_class( class_name = nil )
      classes = ["#{controller_name}-controller","#{action_name}-action"]
      classes << class_name unless class_name.nil?
      classes.join(" ")
    end

    
    def render_body_tag
      class_attribute = ["#{controller_name}-controller","#{action_name}-action"].join(" ")
      id_attribute = (@body_id)? " id=\"#{@body_id}-page\"" : ""

      raw(%Q|<!--[if lt IE 7 ]>
<body class="#{class_attribute} ie6"><![endif]-->
<!--[if gte IE 7 ]>
<body class="#{class_attribute} ie"><![endif]-->
<!--[if !IE]>-->
<body#{id_attribute} class="#{class_attribute}">
<!--<![endif]-->|)

    end
    
    def render_if_table_empty( collection , colspan = 1 , message = nil? , type = 'info' )
      return '' if collection.length > 0
      content_tag( 'tr' , content_tag( 'td' , alert_message( message ), :colspan => colspan ) )
    end
    
    def alert_message( message , type = 'info' )
      anchor = content_tag(:a,'×',{:class=>'close','data-dismiss'=>'alert'})
      content_tag('div', (message+anchor).html_safe, :class => "alert alert-#{type} fade in" )
    end
    
    def flash_message
      message = []
      [:error , :success , :info , :notice ].each do |type|
        if flash[type].presence
          message << alert_message( flash[type] , type )
        end
      end
      if message.length > 0
        message << javascript_tag("setTimeout(function(){$('.alert').alert('close')},2000);")
      end
        flash.discard
      message.join.html_safe
    end
    
    def flash_message_js selector = '#flash-message-container'
      "$('#{selector}').prepend('#{escape_javascript(flash_message)}');".html_safe + 
      "setTimeout(function(){$('.alert').alert('close')},2000);".html_safe
    end
    
    def link_to_add_fields( name , f , association )
      new_object = f.object.class.reflect_on_association(association).klass.new
          fields = f.simple_fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
            render(association.to_s.singularize + "_fields", :f => builder)
          end
      link_to_function( name , "add_fields( this,'#{association}','#{escape_javascript(fields).html_safe}' )" )
    end
    
    
    def head_title
      Railzend::View::Helper::HeadTitle
    end
    def head_meta
      Railzend::View::Helper::HeadMeta
    end
    def head_script
      Railzend::View::Helper::HeadScript
    end
    def document_ready
      Railzend::View::Helper::DocumentReady
    end
    def facebook
      Railzend::View::Helper::Facebook
    end
  end  
end


