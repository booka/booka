require 'test_helper'

class BokTest < ActiveSupport::TestCase
  context 'any bok' do
    should 'have properties' do
      bok = Factory.build(:bok)
      assert_not_nil bok.properties
    end
  end
end
