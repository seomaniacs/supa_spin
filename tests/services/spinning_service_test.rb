require File.expand_path('../../test_helper.rb', __FILE__)
require File.expand_path('../../../lib/services/spinning_service.rb', __FILE__)

class SpinningServiceTest < MiniTest::Unit::TestCase
  include Rack::Test::Methods

  def test_spin_results
    spinning = SpinningService.new('this is an awesome {spinning|feature}')
    assert_equal spinning.spin.size, 2
    assert_equal spinning.spin[0][:text], 'this is an awesome spinning'
    assert_equal spinning.spin[1][:text], 'this is an awesome feature'
  end

  def test_spin_results_with_max_count
    spinning = SpinningService.new('this is an awesome {spinning|feature}, {limited|cutted} to 2 results instead of 4', 2)
    assert_equal spinning.spin.size, 2
    assert_equal spinning.spin[0][:text], 'this is an awesome spinning, limited to 2 results instead of 4'
    assert_equal spinning.spin[1][:text], 'this is an awesome spinning, cutted to 2 results instead of 4'
  end

  def test_spin_results_with_max_characters
    spinning = SpinningService.new('this is an awesome spinning, with {too many|some} characters', 0, 50)
    assert_equal spinning.spin.size, 1
    assert_equal spinning.spin[0][:text], 'this is an awesome spinning, with some characters'
  end
  
  def test_spin_results_with_max_characters_and_max_count
    spinning = SpinningService.new('this is an awesome spinning, with {too many|some} characters', 0, 50)
    assert_equal spinning.spin.size, 1
    assert_equal spinning.spin[0][:text], 'this is an awesome spinning, with some characters'
  end
end
