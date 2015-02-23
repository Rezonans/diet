class ApplicationController < ActionController::API
  include CanCan::ControllerAdditions

  def render_resource_or_errors(resource, options = {})
    if resource.errors.empty?
      render_resource_data(resource, options)
    else
      render_resource_errors(resource)
    end
  end

  def render_resource_data(resource, options = {})
    render options.merge({ json: { resource: resource } })
  end

  def render_resource_errors(resource)
    render json: { errors: resource.errors }, status: 422
  end

  rescue_from CanCan::AccessDenied do |exception|
    render json: { errors: exception.message }, status: :forbidden
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { errors: exception.message }, status: :not_found
  end
end
