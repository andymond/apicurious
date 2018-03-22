require "rails_helper"

describe Event do
  describe "instance methods" do
    it "#month displays month and year of displayed events" do
      attributes = JSON.parse(File.read("./spec/fixtures/event_info.json"), symbolize_names: true)
      event = Event.new(attributes)

      expect(event.month).to eq("March 2018")
    end
  end
end
