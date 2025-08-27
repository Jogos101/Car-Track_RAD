require "rails_helper"

RSpec.describe ReferenciaFipesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/referencia_fipes").to route_to("referencia_fipes#index")
    end

    it "routes to #new" do
      expect(get: "/referencia_fipes/new").to route_to("referencia_fipes#new")
    end

    it "routes to #show" do
      expect(get: "/referencia_fipes/1").to route_to("referencia_fipes#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/referencia_fipes/1/edit").to route_to("referencia_fipes#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/referencia_fipes").to route_to("referencia_fipes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/referencia_fipes/1").to route_to("referencia_fipes#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/referencia_fipes/1").to route_to("referencia_fipes#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/referencia_fipes/1").to route_to("referencia_fipes#destroy", id: "1")
    end
  end
end
