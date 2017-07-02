Rails.application.routes.draw do
  get '/home' => 'pages#home'          # app home page
  get '/userhome' => 'pages#userhome'  # users' home page
  get '/members' => 'pages#members'    # list of members
  get '/help' => 'pages#help'          # help pages
  get '/about' => 'pages#about'        # project info

  root 'pages#home'
end
