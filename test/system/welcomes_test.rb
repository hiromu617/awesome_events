require "application_system_test_case"

class WelcomesTest < ApplicationSystemTestCase
  test "/ ページを表示" do
    visit root_url
  
    assert_selector "h1", text: "イベント一覧"
  end

  test "/ ページ を表示して、未来の表示、過去のイベントは非表示であること" do
    future_event = FactoryBot.create(:event, start_at: Time.zone.now + 3.days)
    past_event = FactoryBot.create(:event, start_at: Time.zone.now + 1.days)

    travel_to Time.zone.now + 2.day do
      visit root_url
      assert_selector "h5", text: future_event.name
      assert_no_selector "h5", text: past_event.name
    end
  end
end
