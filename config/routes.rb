# frozen_string_literal: true

Rails.application.routes.draw do
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get    '/',        to: 'homes#top'
  delete '/logout',  to: 'sessions#destroy'
end
