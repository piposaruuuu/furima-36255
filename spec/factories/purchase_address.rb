FactoryBot.define do
  factory :purchase_address do
    postal_code        { '123-4567' }
    prefecture_id      { 2 }
    city               { '金沢市' }
    block              { '鞍月1-1' }
    building_name      { '東京ハイツ' }
    phone_number       { '09012341234' }
    token              { 'tok_abcdefghijk00000000000000000' }
  end
end
