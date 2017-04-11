module UserHelpers

  # Get public data from user and send it to api
  def send_public_data(resource)
    return {
      id: resource.id,
      email: resource.email,
      name: resource.name,
      phone: resource.phone
    }
  end

end
