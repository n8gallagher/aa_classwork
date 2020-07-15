FactoryBot.define do
  factory :user do
   username { Faker::Beer.brand }
   password { "strongpass" }

   factory :fattire do
     username {"fattire"}
   end
  end

end
