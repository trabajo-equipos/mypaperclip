Escuela::Application.routes.draw do

  get "studiantes/index"

  resources :ubicaciones

  resources :cursos do
  resources :estudiantes
  end
  get "pages/index"
  get "studiantes/index"
  resources :studiantes
  resources :curso
  resources :pages
  resources :estudiante
  resources :horarios
  resources :materias
  resources :instructores
  root :to => 'pages#index'


 
end


