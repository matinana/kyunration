Rails.application.routes.draw do
  devise_for :curators, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  root 'top#index'
end
