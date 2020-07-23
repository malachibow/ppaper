require "rails_helper"

RSpec.describe RrepliesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/rreplies").to route_to("rreplies#index")
    end

    it "routes to #new" do
      expect(get: "/rreplies/new").to route_to("rreplies#new")
    end

    it "routes to #show" do
      expect(get: "/rreplies/1").to route_to("rreplies#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/rreplies/1/edit").to route_to("rreplies#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/rreplies").to route_to("rreplies#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/rreplies/1").to route_to("rreplies#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/rreplies/1").to route_to("rreplies#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/rreplies/1").to route_to("rreplies#destroy", id: "1")
    end
  end
end
