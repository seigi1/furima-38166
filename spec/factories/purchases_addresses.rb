FactoryBot.define do
  factory :purchase_address do
    postal_code     { '111-2222' }
    prefecture_id   { '1' }
    city            { '市町村' }
    house_number    { '1-2' }
    building_name   { '建物名' }
    phone_number    { '09011112222' }
    token           { 'tok_abcdefghijk00000000000000000' }
  end
end
