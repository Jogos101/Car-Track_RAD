require "rails_helper"

RSpec.describe PrecoVeiculosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/preco_veiculos").to route_to("preco_veiculos#index")
    end

    it "routes to #new" do
      expect(get: "/preco_veiculos/new").to route_to("preco_veiculos#new")
    end

    it "routes to #show" do
      expect(get: "/preco_veiculos/1").to route_to("preco_veiculos#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/preco_veiculos/1/edit").to route_to("preco_veiculos#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/preco_veiculos").to route_to("preco_veiculos#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/preco_veiculos/1").to route_to("preco_veiculos#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/preco_veiculos/1").to route_to("preco_veiculos#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/preco_veiculos/1").to route_to("preco_veiculos#destroy", id: "1")
    end
  end
end
