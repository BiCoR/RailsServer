# encoding: utf-8

class SessionsController < Devise::SessionsController

  # required for xml-output to apps
  def new
    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    respond_with_navigational(resource, serialize_options(resource))
  end

end
