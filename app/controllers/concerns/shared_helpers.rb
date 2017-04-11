module SharedHelpers

  # Send success message
  def success_message
    return { success: 'Successful' }
  end

  # Set error message for api
  def set_errors(resource)
    return { errors: resource.errors, full_errors: resource.errors.full_messages }
  end

  # Set is_active value to true
  def activate(resource)
    resource.update_attribute(:is_active, true)
  end

  # Set is_active value to false
  def deactivate(resource)
    resource.update_attribute(:is_active, false)
  end

  # Send nested as Json
  def jsonify(data)
    return JSON.parse(data)
  end

end
