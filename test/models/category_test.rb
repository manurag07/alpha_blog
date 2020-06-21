require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(name: 'sport')
  end

  test 'catagories should be valid' do
    assert @category.valid?
  end

  test 'name should be present' do
    @category.name = ' '
    assert_not @category.valid?
  end

  test 'name should be uniq' do
    @category.save
    @category2 = Category.new(name: 'sport')
    assert_not @category2.valid?
  end

  test 'name should not be to long ' do
    @category.name = 'a' * 26
    assert_not @category.valid?
  end

  test 'name should not be to short ' do
    @category.name = 'as'
    assert_not @category.valid?
  end

end
