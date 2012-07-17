module Railzend
  module Generators
    class CrudViewsGenerator < Rails::Generators::NamedBase
      source_root File.expand_path('../templates', __FILE__)
      def copy_crud_views_file
        template "index.html.erb", "app/views/#{file_path}/index.html.haml"
        template "show.html.erb", "app/views/#{file_path}/show.html.haml"
        template "new.html.erb", "app/views/#{file_path}/new.html.haml"
        template "edit.html.erb", "app/views/#{file_path}/edit.html.haml"
        template "_form.html.erb", "app/views/#{file_path}/_form.html.haml"
        # copy_file "show.html.haml", "app/views/#{file_path}/show.html.haml"
      end
  
      private
      def resource_name
        file_name.singularize
      end
    end
  end
end