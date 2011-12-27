require "railzend/version"

module Railzend
  # Your code goes here...
  # require "railzend/engine"
  # require "railzend/helper"
  # ActionView::Base.send :include, Railzend::Helper
  module Rails
    require "railzend/engine"
  end
end
