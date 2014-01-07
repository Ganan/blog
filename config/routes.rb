Blog::Application.routes.draw do
    get "welcome/index"
    resources :posts
    root 'welcome#index'
    #get    '/posts/:id(.:format)'  =>   'posts#show'
    #get    '/posts(.:format)'       =>   'posts#index'
end