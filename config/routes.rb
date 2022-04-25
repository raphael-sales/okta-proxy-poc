Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post "/okta-auth", to: "okta#index", :defaults => { :format => 'json' }
end
