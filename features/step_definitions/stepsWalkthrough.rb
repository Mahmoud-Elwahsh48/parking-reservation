require 'selenium-webdriver'
require 'rubygems'
require 'rspec'

driver = Selenium::WebDriver.for:chrome # webdriver with chromedriver

Given('open parking reservation app') do
  driver.navigate.to 'http://localhost:3000/users/sign_up' # direct to site
end

Then('owner signup') do
  driver.find_element(:id, 'user_email').send_keys "test#{rand(100)}@mailinator#{rand(100)}.com"
  driver.find_element(:id, 'user_password').send_keys 'test@mailinator.com'
  driver.find_element(:id, 'user_password_confirmation').send_keys 'test@mailinator.com'
  driver.find_element(:css, '.btn-primary').click
  sleep(2)
end

Then('validate owner signup') do
  url_nya = driver.current_url
  log(url_nya)
  expect(url_nya).to include('offers')
end

Then('create offer') do
  # breadcrumb-item active
  driver.find_elements(:css, '.breadcrumb-item')[-1].click
  sleep(2)

  url_nya = driver.current_url
  log(url_nya)
  expect(url_nya).to include('new')

  driver.find_element(:id, 'offer_starts').send_keys '05/12/2020'
  driver.find_element(:id, 'offer_ends').send_keys '06/12/2020'
  driver.find_element(:id, 'offer_days').send_keys '12'
  driver.find_element(:id, 'offer_capacity').send_keys '12'
  driver.find_element(:id, 'offer_parking_price').send_keys '1212'
  driver.find_element(:id, 'offer_discount').send_keys '10'
  driver.find_element(:id, 'offer_discount').send_keys '10'
  driver.find_element(:css, '.btn-primary').click

  sleep(2)

  url_nya = driver.current_url
  log(url_nya)
  expect(url_nya).to include('offers')
end

Then('delete offer') do
  driver.find_elements(:css, '.delete-offer')[-1].click
  sleep(2)

  url_nya = driver.current_url
  log(url_nya)
  expect(url_nya).to include('offers')
end

Then('owner log out') do
  driver.find_elements(:css, '.nav-link')[0].click
  sleep(2)

  url_nya = driver.current_url
  log(url_nya)
  expect(url_nya).to include('sign_in')
end

Then('visitor log in') do
  driver.find_elements(:css, '.btn-secondary')[0].click
  sleep(2)

  url_nya = driver.current_url
  log(url_nya)
  expect(url_nya).to include('sign_in')

  driver.find_elements(:css, '.btn-primary')[1].click
  sleep(2)
  url_nya = driver.current_url
  log(url_nya)
  expect(url_nya).to include('sign_up')
end

Then('visitor signup') do
  driver.find_element(:id, 'visitor_email').send_keys "test#{rand(100)}@mailinator#{rand(100)}.com"
  driver.find_element(:id, 'visitor_password').send_keys 'test@mailinator.com'
  driver.find_element(:id, 'visitor_password_confirmation').send_keys 'test@mailinator.com'
  driver.find_element(:css, '.btn-primary').click
  sleep(2)
end

Then('validate visitor signup') do
  url_nya = driver.current_url
  log(url_nya)
  expect(url_nya).to include('offers')
end

Then('select offer') do
  driver.find_elements(:css, 'a')[4].click
  sleep(2)
  url_nya = driver.current_url
  log(url_nya)
  expect(url_nya).to include('offers')
end

Then('visitor log out') do
  driver.find_elements(:css, '.nav-link')[0].click
  sleep(2)

  url_nya = driver.current_url
  log(url_nya)
  expect(url_nya).to include('sign_in')
end
