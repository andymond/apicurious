require "rails_helper"

describe Event do
  describe "class methods" do
    it ".months displays past 3 months and years of events" do
      expect(Event.months).to eq(["March 2018", "Feb 2018", "Jan 2018"])
    end
  end
end
