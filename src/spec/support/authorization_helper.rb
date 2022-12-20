module AuthorizationHelper
  def authorization_moc
    # binding.b
    allow_any_instance_of(SecuredController).to receive(:authorize_request).and_return(current_user)
  end
end
