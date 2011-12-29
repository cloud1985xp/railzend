require "railzend/view/helper/document_ready"
require "railzend/view/helper/facebook"
require "railzend/view/helper/head_title"
module Railzend::View::Helper
  def self.included(receiver)
    receiver.extend ClassMethods
    receiver.send :include, InstanceMethods
  end
  # 
  # def init
  #   @test.join('_')
  # end
  
  # include Railzend::View::Helper::DocumentReady
  # include Railzend::View::Helper::Facebook

  module ClassMethods
    def image_placehold( width , height , alt = '' )
      image_tag( "http://placehold.it/#{width.to_s}x#{height.to_s}" , { :alt => alt } )
    end
  end
  module InstanceMethods
  end
        
  def head_title
    Railzend::View::Helper::HeadTitle
  end
  def head_meta
    # Railzend::View::Helper::HeadMeta
  end
  def document_ready
    Railzend::View::Helper::DocumentReady
  end
  def facebook
    Railzend::View::Helper::Facebook
  end
  
  
end


