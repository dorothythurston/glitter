FactoryGirl.define do
  factory :activity do
    user_id 1
    type "ItemActivity"
    subject_id 1
    subject_type "Item"
    actor_id 2
    target_id 1
    target_type "Item"
  end
end
