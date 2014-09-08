require 'test_helper'

MiniTest::Unit.autorun

class TestSeed < MiniTest::Unit::TestCase
  def setup
    @seed = Seed.new(TestData::SeedString)
  end
  
  def test_seed
    assert_equal(TestData::SeedString, @seed.seed)
  end
end