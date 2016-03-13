Rails.application.routes.draw do
<<<<<<< HEAD
  mount Ckeditor::Engine => '/ckeditor'
=======
>>>>>>> cd077592a63523601f07ea278d86f8177cdcd11b
  devise_for :users
  root 'home#index'
  resources :notes
end
