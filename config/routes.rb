Rails.application.routes.draw do
  devise_for :curators
  root 'top#index'
end
