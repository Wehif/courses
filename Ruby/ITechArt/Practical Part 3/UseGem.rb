#!/usr/bin/env ruby

require 'credit_card_validator'

def credit_card_validator(array_of_numbers)
number=""
array_of_numbers.flatten.each { |el| number = el.to_s }
valid = CreditCardValidator::Validator.valid?(number)
card_type = CreditCardValidator::Validator.card_type(number)
valid ? "credit card is valid, type #{card_type}":"credit card isn't valid, type #{card_type}"
end

p credit_card_validator(ARGV)
