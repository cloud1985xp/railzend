module Railzend::View::Helper
  class Facebook
    def self.like( url = '', class_name = "FacebookLikeButton")
      "<p class=\"#{class_name}\"><iframe src=\"http://www.facebook.com/plugins/like.php?href=#{url}&layout=standard&show_faces=true&width=450&action=like&colorscheme=light&locale=zh_TW\" scrolling=\"no\" frameborder=\"0\" allowTransparency=\"true\" style=\"border:none; overflow:hidden; width:450px; height: 30px\"></iframe></p>".html_safe;
    end
    
    def self.comment( url = '', num = 10 , width = 500 )
      script = <<-eos
                  (function(d, s, id) {
                  var js, fjs = d.getElementsByTagName(s)[0];
                  if (d.getElementById(id)) {return;}
                  js = d.createElement(s); js.id = id;
                  js.src = "//connect.facebook.net/zh_TW/all.js#xfbml=1";
                  fjs.parentNode.insertBefore(js, fjs);
                  }(document, 'script', 'facebook-jssdk'));
      eos
      head_script.append( script.html_safe )
      "<div class='fb-comments' data-href='#{url}' data-num-post='#{num}' data-width='#{width}'></div>".html_safe
    end
    
    # def self.comment( url , num = 10 , width = 500 )
    #       script = <<-eos
    #                   (function(d, s, id) {
    #                   var js, fjs = d.getElementsByTagName(s)[0];
    #                   if (d.getElementById(id)) {return;}
    #                   js = d.createElement(s); js.id = id;
    #                   js.src = "//connect.facebook.net/zh_TW/all.js#xfbml=1";
    #                   fjs.parentNode.insertBefore(js, fjs);
    #                   }(document, 'script', 'facebook-jssdk'));
    #       eos
    #       head_script.append('alert(1);')
    #       "<div class='fb-comments' data-href='#{url}' data-num-post='#{num}' data-width='#{width}'></div>"
    #         # - content_for :head do
    #         #           :javascript
    #         #             (function(d, s, id) {
    #         #             var js, fjs = d.getElementsByTagName(s)[0];
    #         #             if (d.getElementById(id)) {return;}
    #         #             js = d.createElement(s); js.id = id;
    #         #             js.src = "//connect.facebook.net/zh_TW/all.js#xfbml=1";
    #         #             fjs.parentNode.insertBefore(js, fjs);
    #         #             }(document, 'script', 'facebook-jssdk'));
    #     end
  end
end