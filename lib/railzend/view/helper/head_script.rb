module Railzend
  module View
    module Helper
      class HeadScript
        @@scripts =[]
        def self.append(s)
          @@scripts << s
          self
        end
        def self.to_s
          s = @@scripts.join("\n")
          @@scripts = []
          "<script>#{s}</script>".html_safe
        end
      end
    end
  end
end