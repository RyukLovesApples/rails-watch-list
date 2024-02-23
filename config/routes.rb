Rails.application.routes.draw do
  resources :lists do
    resources :bookmarks, only: [:new, :destroy, :create]
  end
end
