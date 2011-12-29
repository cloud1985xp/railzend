module Railzend::View::Helper
  class Facebook
    def self.like( url = '', class_name = "FacebookLikeButton")
      "<p class=\"#{class_name}\"><iframe src=\"http://www.facebook.com/plugins/like.php?href=#{url}&layout=standard&show_faces=true&width=450&action=like&colorscheme=light&locale=zh_TW\" scrolling=\"no\" frameborder=\"0\" allowTransparency=\"true\" style=\"border:none; overflow:hidden; width:450px; height: 30px\"></iframe></p>".html_safe;
    end
  end
end