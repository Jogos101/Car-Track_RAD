require "rails_helper"

RSpec.describe MarcasController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/marcas").to route_to("marcas#index")
    end

    it "routes to #new" do
      expect(get: "/marcas/new").to route_to("marcas#new")
    end

    it "routes to #show" do
      expect(get: "/marcas/1").to route_to("marcas#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/marcas/1/edit").to route_to("marcas#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/marcas").to route_to("marcas#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/marcas/1").to route_to("marcas#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/marcas/1").to route_to("marcas#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/marcas/1").to route_to("marcas#destroy", id: "1")
    end
  end
end
