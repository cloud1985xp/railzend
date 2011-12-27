# require "railzend/view_helpers"

module Railzend
  module Rails
      class Engine < ::Rails::Engine
        # initializer "railzend.view_helpers" do
        #           ActionView::Base.send :include, Railzend::ViewHelper
        #         end
        # config.to_prepare do
        #   ApplicationController.send :include, BootstrapHelper::Breadcrumb
        # end
      end
    end
end