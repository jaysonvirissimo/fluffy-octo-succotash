# frozen_string_literal: true
Rails.application.routes.draw do
  resources :news_weeks, only: [:index, :show]
end
