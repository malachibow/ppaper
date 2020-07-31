require "rails_helper"

RSpec.describe ReplyFavoritesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/reply_favorites").to route_to("reply_favorites#index")
    end

    it "routes to #new" do
      expect(get: "/reply_favorites/new").to route_to("reply_favorites#new")
    end

    it "routes to #show" do
      expect(get: "/reply_favorites/1").to route_to("reply_favorites#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/reply_favorites/1/edit").to route_to("reply_favorites#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/reply_favorites").to route_to("reply_favorites#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/reply_favorites/1").to route_to("reply_favorites#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/reply_favorites/1").to route_to("reply_favorites#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/reply_favorites/1").to route_to("reply_favorites#destroy", id: "1")
    end
  end
end
