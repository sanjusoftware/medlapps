VOSN::Application.routes.draw do
  match "voicemails/new" => "voicemails#create", :as => :new_voicemail, :via => :post
end