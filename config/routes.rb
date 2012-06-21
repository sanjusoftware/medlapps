VOSN::Application.routes.draw do
  resources :voicemails

  root :to => "voicemails#index"
  #match "voicemails/new" => "voicemails#create", :as => :new_voicemail, :via => :post
end