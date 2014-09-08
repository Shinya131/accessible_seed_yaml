require 'test_helper'

MiniTest::Unit.autorun

class TestSeed < MiniTest::Unit::TestCase
  def setup
    @seed = AccessableSeed::Table.new(TestData::SeedString)
  end
  
  def test_seed
    assert_equal(TestData::SeedString, @seed.seed)
  end
  
  def test_records
    assert_equal(TestData::SeedStringRecord01, @seed.split_by_record[0])
    assert_equal(TestData::SeedStringRecord02, @seed.split_by_record[1])
    assert_equal(TestData::SeedStringRecord03, @seed.split_by_record[2])
  end
end