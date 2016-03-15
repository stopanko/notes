Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  root 'home#index'
  resources :notes do
    resources :photos
    resources :videos
  end
  get 'download_photo/:note_id/:id', to: 'photos#download', as: 'download_photo'
  get 'download_video/:note_id/:id', to: 'videos#download', as: 'download_video'
  # resources :photos
  post 'check_note/:id', to: 'notes#check_note', as: 'check_note'
end
