Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  root 'home#index'
  resources :notes do
    resources :photos do
      get 'download', to: 'photos#download'
    end
  end
  # resources :photos
  post 'check_note/:id', to: 'notes#check_note', as: 'check_note'
end
