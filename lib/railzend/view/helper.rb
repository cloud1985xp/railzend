require "railzend/view/helper/document_ready"
require "railzend/view/helper/facebook"
module Railzend
  module View
    module Helper  
      
      # def self.included(receiver)
      #   @
      # end
      # 
      # def init
      #   @test.join('_')
      # end
      
      include Railzend::View::Helper::DocumentReady
      include Railzend::View::Helper::Facebook
      def image_placehold( width , height , alt = '' )
        image_tag( "http://placehold.it/#{width.to_s}x#{height.to_s}" , { :alt => alt } )
      end      
      def head_title
        HeadTitle
      end
      def head_meta
        HeadMeta
      end
      class HeadTitle
        @@title =[]
        @@glue = " | "
        def self.append(t)
          @@title << t
          self
        end
        def self.glue(g)
          @@glue=g
        end
        def self.to_s
          s = @@title.join(@@glue)
          @@title = []
          "<title>#{s}</title>".html_safe
        end
      end
      class HeadMeta
        def self.to_s
          ""
        end
      end
      
    end
  end
end


