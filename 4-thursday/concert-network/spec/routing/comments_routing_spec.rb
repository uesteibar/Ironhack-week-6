require "rails_helper"

describe CommentsController do
  describe "routing" do
    before(:each) do
      @concert = Concert.create(
        band: 'Jessie J',
        venue: 'Parque Pedralbes',
        city_id: City.create(name: "Barcelona").id,
        price: 20,
        date: 1.week.from_now,
        description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
      )
    end

    it "should route to #create" do
      params = {
        post: "/concerts/#{@concert.id}/comments",
        username: "uesteibar",
        content: "COOOOOL"
      }
      expect(params).to route_to("comments#create", concert_id: @concert.id.to_s)
    end
  end
end
