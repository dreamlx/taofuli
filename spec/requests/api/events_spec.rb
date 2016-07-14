require 'rails_helper'

RSpec.describe "events" do
  describe "GET #index" do
    it "get all valid events" do
      Event.delete_all
      event = create(:event, state: "有效")
      get "/api/events"
      expect(response).to be_success
      expect(response).to have_http_status(200)
      json = JSON.parse(response.body)["events"].first
      expect(json["id"]).to eq event.id
      expect(json["title"]).to eq event.title
      expect(json["url"]).to eq event.url
      expect(json["image_url"]).to eq event.image_url
      expect(json["amount"]).to eq event.amount
      expect(json["state"]).to eq event.state
      expect(json["effective_date"]).to eq event.effective_date.to_s
      expect(json["expire_date"]).to eq event.expire_date.to_s
    end
  end
end