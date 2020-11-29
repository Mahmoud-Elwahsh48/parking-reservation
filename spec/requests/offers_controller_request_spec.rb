require 'rails_helper'

RSpec.describe 'Offers', type: :request do
  describe 'POST create' do
    it 'should enlist all the offers' do
      user = User.create(
        email: 'test2@mailinator.com',
        password: 'test@mailinator.com',
        password_confirmation: 'test@mailinator.com',
        is_owner: 'true'
      )

      user.offers.create(starts: Date.today, ends: Date.today + 10.days, days: 10, capacity: 100, parking_price: 100.0, discount: 0.1)
      user.offers.create(starts: Date.today, ends: Date.today + 10.days, days: 10, capacity: 100, parking_price: 100.0, discount: 0.1)
      user.offers.create(starts: Date.today, ends: Date.today + 10.days, days: 10, capacity: 100, parking_price: 100.0, discount: 0.1)
      user.offers.create(starts: Date.today, ends: Date.today + 10.days, days: 10, capacity: 100, parking_price: 100.0, discount: 0.1)

      expect(Offer.count).to eq 4
    end
  end
end
