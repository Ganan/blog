Blog::Application.routes.draw do
    get "welcome/index"
    resources :posts
    root 'welcome#index'

	resources :posts do
		resources :comments
	end
    #get    '/posts/:id(.:format)'  =>   'posts#show'
    #get    '/posts(.:format)'       =>   'posts#index'
end