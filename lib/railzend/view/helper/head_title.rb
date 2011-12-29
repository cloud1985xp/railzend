module Railzend::View::Helper
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
end