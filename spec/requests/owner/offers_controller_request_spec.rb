require 'rails_helper'

RSpec.describe 'Owner::Offers', type: :request do
  describe 'POST create' do
    it 'should create an offer' do
      User.create(
        email: 'test1@mailinator.com',
        password: 'test@mailinator.com',
        password_confirmation: 'test@mailinator.com',
        is_owner: 'true'
      )
      expect do
        User.first.offers.create(starts: Date.today, ends: Date.today + 10.days, days: 10, capacity: 100, parking_price: 100.0, discount: 0.1)
      end.to(change { Offer.count })
    end

    it 'should not create an offer' do
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

    it 'should destroy an offer' do
      User.create(
        email: 'test1@mailinator.com',
        password: 'test@mailinator.com',
        password_confirmation: 'test@mailinator.com',
        is_owner: 'true'
      )
      User.first.offers.create(starts: Date.today, ends: Date.today + 10.days, days: 10, capacity: 100, parking_price: 100.0, discount: 0.1)

      expect do
        Offer.first.destroy
      end.to(change { Offer.count })
    end

    it 'should update an offer' do
      User.create(
        email: 'test1@mailinator.com',
        password: 'test@mailinator.com',
        password_confirmation: 'test@mailinator.com',
        is_owner: 'true'
      )
      User.first.offers.create(starts: Date.today, ends: Date.today + 10.days, days: 10, capacity: 100, parking_price: 100.0, discount: 0.1)
      Offer.last.update(capacity: 200)

      expect(Offer.last.capacity).to eq 200
    end

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
