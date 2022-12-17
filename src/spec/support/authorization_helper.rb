module AuthorizationHelper
  def authorization_moc
    @current_user = FactoryBot.create(:user)
    allow_any_instance_of(SecuredController).to receive(:authorize_request).and_return(@current_user)
    # allow_any_instance_of(SecuredController).to receive(:current_user).and_return(@current_user)
    # secured_controller_mock = instance_double(SecuredController)
    # allow(secured_controller_mock).to receive(:authorize_request).and_return(current_user)
    # allow(secured_controller_mock).to receive(:current_user).and_return(current_user)
  end
end
