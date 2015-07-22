require "rails_helper"

describe SitesController do
  describe "routing" do
    it "should route to #home" do
      expect({:get => "/"}).to route_to("sites#home")
    end
  end
end
