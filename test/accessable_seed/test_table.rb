require 'test_helper'

MiniTest::Unit.autorun

class TestTable < MiniTest::Unit::TestCase
  def setup
    @seed = AccessableSeed::Table.new(TestData::Seed::Table)
  end
  
  def test_original_seed
    assert_equal(TestData::Seed::Table, @seed.original_seed)
  end
  
  def test_records
    assert_equal(TestData::Seed::Record01, @seed.records[0])
    assert_equal(TestData::Seed::Record02, @seed.records[1])
    assert_equal(TestData::Seed::Record03, @seed.records[2])
  end
end