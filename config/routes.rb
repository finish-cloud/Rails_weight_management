Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  root 'graphs#index'
  # resource「s」ではない！（updateに「:id」は不要だから）
  resource :graphs, only: %i[index create update]

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
end
