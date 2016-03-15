Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  root 'home#index'
  resources :notes do
    resources :attachments
  end
  get 'download_attachment/:note_id/:id', to: 'attachments#download', as: 'download_attachment'
  # resources :photos
  post 'check_note/:id', to: 'notes#check_note', as: 'check_note'
end
