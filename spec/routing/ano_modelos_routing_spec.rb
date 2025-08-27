require "rails_helper"

RSpec.describe AnoModelosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/ano_modelos").to route_to("ano_modelos#index")
    end

    it "routes to #new" do
      expect(get: "/ano_modelos/new").to route_to("ano_modelos#new")
    end

    it "routes to #show" do
      expect(get: "/ano_modelos/1").to route_to("ano_modelos#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/ano_modelos/1/edit").to route_to("ano_modelos#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/ano_modelos").to route_to("ano_modelos#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/ano_modelos/1").to route_to("ano_modelos#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/ano_modelos/1").to route_to("ano_modelos#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/ano_modelos/1").to route_to("ano_modelos#destroy", id: "1")
    end
  end
end
