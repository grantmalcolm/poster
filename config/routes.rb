Rails.application.routes.draw do
  devise_for :users
  get '/home' => 'pages#home'          # app home page
  get '/userhome' => 'pages#userhome'  # users' home page
  get '/user/:id' => 'pages#userhome'  # each user's home page
  get '/members' => 'pages#members'    # list of members
  get '/help' => 'pages#help'          # help pages
  get '/about' => 'pages#about'        # project info
  get '/posts/tag/:name' => 'posts#tags' # find tagged posts
  # get '/users/sign_out' => 'pages#home'
  resources :posts, only: [:create]

  root 'pages#home'
end
