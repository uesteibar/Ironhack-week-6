require "rails_helper"

describe UsersController do
  describe "routing" do
    it "should route to #index" do
      expect({:get => "/users"}).to route_to("users#index")
    end

    it "should route to #show" do
      user = User.create(name: "superuser", email: "root@example.com")
      expect({:get => "/users/#{user.id}"}).to route_to("users#show", id: user.id.to_s)
    end

    it "should route to #create" do
      params = {
        post: "/users",
        user: {
          name: "superuser",
          email: "root@example.com"
        }
      }
      expect(params).to route_to("users#create")
    end
  end
end
