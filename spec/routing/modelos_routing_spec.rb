require "rails_helper"

RSpec.describe ModelosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/modelos").to route_to("modelos#index")
    end

    it "routes to #new" do
      expect(get: "/modelos/new").to route_to("modelos#new")
    end

    it "routes to #show" do
      expect(get: "/modelos/1").to route_to("modelos#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/modelos/1/edit").to route_to("modelos#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/modelos").to route_to("modelos#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/modelos/1").to route_to("modelos#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/modelos/1").to route_to("modelos#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/modelos/1").to route_to("modelos#destroy", id: "1")
    end
  end
end
