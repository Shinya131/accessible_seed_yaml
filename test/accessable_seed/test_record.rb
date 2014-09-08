require 'test_helper'

MiniTest::Unit.autorun

class TestRecord < MiniTest::Unit::TestCase
  def setup
    @record = AccessableSeed::Record.new(TestData::SeedStringRecord01)
  end
  
  def test_original_seed
    assert_equal(TestData::SeedStringRecord01, @record.original_seed)
  end
  
  def test_records
    assert_equal(1,        @record.attributes["id"])
    assert_equal("coffee", @record.attributes["name"])
  end
end