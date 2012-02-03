module Railzend
  module View
    module Helper
      class DocumentReady
        @@scripts = []
        def self.append( script )
          @@scripts << script
          self
        end
        def self.to_s
          s = @@scripts.join("\n")
          @@scripts = []
          "<script>$(document).ready(function(){#{s}})</script>".html_safe
        end
      end
    end
  end
end
