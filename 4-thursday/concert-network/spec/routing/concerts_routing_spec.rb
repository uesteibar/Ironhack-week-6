require "rails_helper"

describe ConcertsController do
  describe "routing" do
    it "should route to #index" do
      expect({:get => "/concerts"}).to route_to("concerts#index")
    end

    it "should route to #show" do
      city = City.create(name: "Barcelona")
      concert = Concert.create(
        band: 'Jessie J',
        venue: 'Parque Pedralbes',
        city_id: city.id,
        price: 20,
        date: 1.week.from_now,
        description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
      )
      expect({:get => "/concerts/#{concert.id}"}).to route_to("concerts#show", id: concert.id.to_s)
    end

    it "should route to #new" do
      expect({:get => "/concerts/new"}).to route_to("concerts#new")
    end

    it "should route to #create" do
      city = City.create(name: "Barcelona")
      params = {
        post: "/concerts",
        band: 'Jessie J',
        venue: 'Parque Pedralbes',
        city_id: city.id,
        price: 20,
        date: 1.week.from_now,
        description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
      }
      expect(params).to route_to("concerts#create")
    end

    it "should route to #budget" do
      expect({:get => "/concerts/budget"}).to route_to("concerts#budget")
    end

    it "should route to #search" do
      expect({:get => "/concerts/budget/search"}).to route_to("concerts#search")
    end

    it "should route to #most_commented" do
      expect({:get => "/concerts/most-commented"}).to route_to("concerts#most_commented")
    end
  end
end
