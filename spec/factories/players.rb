# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :player do
    player_name "MyString"
    game_player_id 1
    world_id 1
  end
end
