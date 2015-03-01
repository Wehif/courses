require 'capybara'
require 'selenium-webdriver'

Given(/^I'm on "(.*?)" page$/) { |page| visit page }

When(/^I input "(.*?)", "(.*?)", "(.*?)", "(.*?)"$/) do |name, email, password, confirm_password|
  fill_in 'username', :with => name
  fill_in 'Vd1fdf105319509f350aab2e38e765c3d', :with => email
  fill_in 'V5f22e9ddba89be84b2f465dee8993b3e', :with => password
  fill_in 'Vcde48ba5f1239b9763a1ea9893a3fc6d', :with => confirm_password
end

When(/^check I agree with conditions$/) do
  check ''
end

And(/^I wait for (\d+) seconds$/) do |sec|
  sleep(sec.to_i)
end

And(/^click button Submit$/) do
  click_button 'mainoption'
end

Then(/^I should be successfuly registrated$/) do
  expect(page).to have_content 'Вернуться к списку форумов'
end

#http://nnm-club.me/forum/profile.php
