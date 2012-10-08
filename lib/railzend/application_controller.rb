module Railzend
  module ApplicationController
    
    def self.included(receiver)
      # receiver.extend ClassMethods
      # receiver.send :include, InstanceMethods
      receiver.send 'before_filter' , :set_model
    end
    
    def index
      collection = @model.page( params[:page] )
      instance_variable_set( "@#{controller_name}" , collection )
    end

    def show
      object = @model.find( params[:id] )
      instance_variable_set("@#{controller_name.singularize}", object );
    end

    def new
      object = @model.new
      instance_variable_set("@#{controller_name.singularize}", object );
    end 

    def edit
      object = @model.find( params[:id] )
      instance_variable_set("@#{controller_name.singularize}", object );
    end

    def create
      object_name = controller_name.singularize 
      object = @model.new( params[object_name])
      instance_variable_set("@#{object_name}", object );
      if object.save
        respond_to do |format|
          format.js { render }
          format.json { render }
          format.html { return redirect_to redirect_after_create( object ) }
        end
      else
        render :action => :new
      end
    end
    
    def update
      object_name = controller_name.singularize
      object = @model.find( params[:id])
      instance_variable_set("@#{object_name}", object );
      if object.update_attributes( params[object_name] )
        
        respond_to do |format|
          format.js { render }
          format.json { render }
          format.html { return redirect_to redirect_after_update( object ) }
        end
      else
        render :action => :edit
      end
    end
    
    def destroy
      object_name = controller_name.singularize
      object = @model.find( params[:id])
      instance_variable_set("@#{object_name}", object );
      object.destroy
      respond_to do |format|
        format.js { render }
        format.json { render }
        format.html { return redirect_to redirect_after_destroy( object ) }
      end
    end
    
    # render error
    def render_403
      render_optional_error_file(403)
    end

    def render_404
      render_optional_error_file(404)
    end

    def render_405
      render_optional_error_file(405)
    end

    def render_optional_error_file( status_code )
      status = status_code.to_s
      if ["404","403","405","422","500"].include?(status)
        render :template => "/errors/#{status}.html.haml", :status => status, :layout => "application"
      else
        render :template => "/errors/unknown.html.haml", :status => status, :layout => "application"
      end
    end

    protected
    def set_model
      model_name = controller_name.classify;
      @model = model_name.constantize;
      # objects = @model.find(:all)
      # instance_variable_set("@#{controller_name}", objects );
    end
    
    def redirect_after_create object
      object_name = controller_name.singularize      
      send( object_name + '_path' , object )
    end
    
    def redirect_after_update object
      object_name = controller_name.singularize      
      send( object_name + '_path' , object )
    end
    
    def redirect_after_destroy object
      send( controller_name + '_path' )
    end
  end
end