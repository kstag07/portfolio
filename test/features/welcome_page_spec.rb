require "test_helper"

  describe "portfolio app welcome page" do
    it "has a welcome title" do
      visit "/"
      puts page.current_url
      puts page.body
      page.text.must_include "Kevin Staiger"
    end
end
