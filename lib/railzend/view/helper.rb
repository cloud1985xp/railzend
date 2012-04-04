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


