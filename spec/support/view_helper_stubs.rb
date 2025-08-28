# congela helpers que as views chamam diretamente
module ViewHelperStubs
  def stub_devise_for(view, signed_in: false, user: nil)
    allow(view).to receive(:user_signed_in?).and_return(signed_in)
    allow(view).to receive(:current_user).and_return(user)
  end

  # Para views do Devise (resource/resource_name/devise_mapping)
  def stub_devise_resource(view, resource_class, resource: nil)
    resource ||= resource_class.new
    allow(view).to receive(:resource).and_return(resource)
    allow(view).to receive(:resource_name).and_return(resource_class.model_name.singular.to_sym)
    allow(view).to receive(:devise_mapping).and_return(Devise.mappings[resource_class.model_name.singular.to_sym])
  end
end

RSpec.configure do |config|
  config.include ViewHelperStubs, type: :view
end
