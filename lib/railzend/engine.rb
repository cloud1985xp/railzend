require "railzend/view/helper"

module Railzend
  class Engine < Rails::Engine
    initializer "railzend.view_helpers" do
      ActionView::Base.send :include, Railzend::View::Helper
    end
  end
  # module Rails
  #   class Engine < ::Rails::Engine
  #     initializer "railzend.view_helpers" do
  #       ActionView::Base.send :include, Railzend::View::Helper
  #     end
  #       # config.to_prepare do
  #       #   ApplicationController.send :include, BootstrapHelper::Breadcrumb
  #       # end
  #   end
  # end
end