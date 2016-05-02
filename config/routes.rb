Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
  root 'main#index'
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
  get 'login/' => 'login#identify', as: :login
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
  get 'ets/' => 'ets#index', as: :ets
  get 'ets/:id' => 'ets#update', as: :ets_update
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
  get 'professor/:id' => 'professor#index', as: :professor
  get 'professor/:id/profile_update' => 'professor#update', as: :professor_profile
  get 'professor/:id/update/:course_id' => 'professor#update', as: :professor_update
  get 'professor/:id/new/' => 'professor#create', as: :professor_create
  get 'professor/:id/delete/:course_id' => 'professor#destroy', as: :professor_destroy
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #

end
