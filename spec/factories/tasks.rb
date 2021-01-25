FactoryBot.define do
  factory :task do
    name {'テストを書く'}
    descroption {'RSpec&Capybara&FactoryBotを準備する'}
    user
  end
end
