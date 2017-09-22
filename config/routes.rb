Rails.application.routes.draw do
	resources:comments
  	resources:blogs
  	resources:users

  	get '/sample', :to => 'blogs#sample'
end
