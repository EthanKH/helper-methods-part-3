Rails.application.routes.draw do
  devise_for :users
  root "movies#index"
  
  resources :movies
  # https://learn.firstdraft.com/lessons/194-helper-methods-part-3
  # https://share.descript.com/view/mQOqBmvJmSo
  # https://grades.firstdraft.com/resources/f220b8c2-f61f-4297-9ee4-becfc532e5c9
  
  # https://getbootstrap.com/docs/5.3/components/card/
  # https://getbootstrap.com/docs/5.3/components/card/
  # https://getbootstrap.com/docs/5.3/layout/grid/

  # continue from beginning of partials with inputs
end
