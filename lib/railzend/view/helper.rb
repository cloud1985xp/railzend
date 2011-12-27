require "railzend/view/helper/document_ready"
module Railzend
  module View
    module Helper  
      include Railzend::View::Helper::DocumentReady
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
        @@title = []
        def self.append title
          @@title << title
          self
        end
        def self.to_s
          "<title>#{@@title.join(' | ')}</title>".html_safe
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


