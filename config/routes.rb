Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  root 'home#index'
  resources :notes
  post 'check_note/:id', to: 'notes#check_note', as: 'check_note'
end
