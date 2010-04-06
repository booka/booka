require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  context 'created projects' do
    should 'have default call and index' do
      project = Factory.build(:project)
      assert_not_nil project.parent
      assert_nil project.call
      assert_nil project.index
      project.save
      assert_not_nil project.call
      assert_not_nil project.index
    end
  end
end
