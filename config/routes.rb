Rails.application.routes.draw do

  root 'users#home'
  resources :slots
  resources :videos
  resources :users
  resources :profiles

  # USERS
  get  'users/select/:user_id'   =>  'users#select'
  post 'users/logged_in_fb'      =>  'users#logged_in_fb'
  post 'users/logged_out_fb'     =>  'users#logged_out_fb'
  get  'logout'                  =>  'users#logout_fb'
  get  'login_fb'                =>  'users#login_fb'
  post 'users/toggle_admin'      =>  'users#toggle_admin'

  # SLOTS
  get 'slots/:id/video/edit'    =>  'slots#video_edit'
  get 'slots/:id/video/update'  =>  'slots#video_update'
  post 'slots/:id/like'         =>  'slots#like'
  post 'slots/:id/dislike'      =>  'slots#dislike'

  # VIDEOS
  # get 'upload/upload'
  get 'my_videos'               =>  'videos#my_videos'
  get 'videos/:id/slot/edit'    =>  'videos#slot_update'
  post 'videos/:id/approve'     =>  'videos#approve'
  post 'videos/:id/disapprove'  =>  'videos#disapprove'
  post 'videos/:id/like'        =>  'videos#like'
  post 'videos/:id/dislike'     =>  'videos#dislike'

  # profiles
  match 'profile'               =>  'profiles#show', via: :get
  match 'profile/edit'          =>  'profiles#edit', via: :patch

end
