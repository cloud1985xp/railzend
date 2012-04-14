require "railzend/version"
require "railzend/application_controller"
module Railzend
  # Your code goes here...
  # require "railzend/engine"
  # require "railzend/helper"
  # ActionView::Base.send :include, Railzend::Helper
  module Rails
    require "railzend/engine"
  end
end
