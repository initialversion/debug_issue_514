Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root :to => "test_somets#index"
  # Routes for the Test_somet resource:
  # CREATE
  get "/test_somets/new", :controller => "test_somets", :action => "new"
  post "/create_test_somet", :controller => "test_somets", :action => "create"

  # READ
  get "/test_somets", :controller => "test_somets", :action => "index"
  get "/test_somets/:id", :controller => "test_somets", :action => "show"

  # UPDATE
  get "/test_somets/:id/edit", :controller => "test_somets", :action => "edit"
  post "/update_test_somet/:id", :controller => "test_somets", :action => "update"

  # DELETE
  get "/delete_test_somet/:id", :controller => "test_somets", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
