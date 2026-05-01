Rails.application.routes.draw do
  get "presets/index"
  get "presets/show"
  get "presets/new"
  get "presets/edit"
  root "editors#show"
  resource :editor, only: [:show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"

  # GET /presets            # プリセット一覧画面
  # GET /presets/new        # 新規作成
  # GET /presets/:id/edit   # 編集（あのタグ選択UI）
  # PATCH /presets/:id      # 保存
  # DELETE /presets/:id     # 削除

end
