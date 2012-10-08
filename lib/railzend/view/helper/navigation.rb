# module Railzend
#   module View
#     module Helper
#       class Navigation
#         @@title =[]
#         @@glue = " | "
#         def self.append(t)
#           @@title << t
#           self
#         end
#         def self.glue(g)
#           @@glue=g
#           self
#         end
#         def self.to_s
#           s = @@title.join(@@glue)
#           @@title = []
#           "<title>#{s}</title>".html_safe
#         end
#       end
#     end
#   end
# end