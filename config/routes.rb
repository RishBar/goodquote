Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'quote#new'

  get '/newquote' => 'quote#new_quote'


end
