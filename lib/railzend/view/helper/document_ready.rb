module Railzend::View::Helper::DocumentReady
  @@scripts = []
  def scripts
    @@scripts
  end
  def document_ready( script )
    scripts << script
  end
  def render_document_ready
    s = scripts.join("\n")
    "<script>$(document).ready(function(){#{s}})</script>".html_safe
  end
end


