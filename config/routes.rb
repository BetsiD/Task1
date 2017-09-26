Rails.application.routes.draw do
	devise_for :users, controllers: { sessions: 'users/sessions' }
	resources:comments
  	resources:blogs
  	root to: 'blogs#index'
  	get '/sample', :to => 'blogs#sample'
end
