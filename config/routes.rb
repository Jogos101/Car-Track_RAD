Rails.application.routes.draw do
  resources :preco_veiculos
  resources :ano_modelos
  resources :modelos
  resources :marcas, only: [:index]
  resources :referencia_fipes
  get "home/index"
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check

  # Página do comparador
  get "/comparador", to: "comparador#index", as: :comparador

  # JSON p/ selects e gráfico (fixando formato)
  get "/marcas/:marca_codigo/modelos", to: "catalogo#modelos_por_marca", as: :modelos_por_marca

  get "/modelos/:modelo_codigo/anos", to: "catalogo#anos_do_modelo", as: :anos_do_modelo
  get "/anosModelo/:modelo_codigo", to: "catalogo#anos_do_modelo" # alias compatível

  get "/veiculos_modelo/:modelo_codigo", to: "catalogo#veiculos_por_modelo", as: :precos_por_modelo
  get "/veiculosModelo/:modelo_codigo", to: "catalogo#veiculos_por_modelo" # alias compatível

  # Defines the root path route ("/")
  root "home#index"
end
