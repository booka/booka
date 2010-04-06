require 'test_helper'

class SiteTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  context 'any site' do
    should 'not have parent' do
      site = Factory(:site)
      assert_nil site.parent
    end
  end
end
