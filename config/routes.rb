Rails.application.routes.draw do
  #get 'jobsjson/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get('/', {to: 'welcome#index', as: 'root'})
  get('/openvss',{to:'welcome#openvss', as: :openvss})
  get('/choosefile',{to:'welcome#choosefile', as: :choosefile})
  get('/writecode',{to:'welcome#writecode', as: :writecode})
  get('/runcode',{to:'welcome#runcode', as: :runcode})
  get('/navigate',{to:'welcome#navigate', as: :navigate})

  get('/goodbye',{to:'welcome#goodbye', as: :goodbye})
  get('/form_example',{to:'welcome#form_example'})
  #get('/geo',{to:'welcome#geo'})
  get('/geo',{to:'map#geo'})
  get('/jobsmap',{to:'map#jobsmap' } )

  get('/jobs_get',{to:'jobs#jobs_get', as: :jobs_get})
  get('/front',{to:'welcome#front', as: :front})
  resources :jobs , only:[:index,  :show, :edit, :update, :destroy]   

  resources :jobsjson, only: [:index]

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :jobsum, only:[:index ] do

      end  
      resources :jobsplacesum, only:[:index ]       
      resources :jobsdaysum, only:[:index ]  do
          resources :job 
      end
      resources :jobswaitforcheck, only:[:index ]  
    end
  end
end
