require 'test_helper'

MiniTest::Unit.autorun

class TestRecord < MiniTest::Unit::TestCase
  def setup
    @record = AccessibleSeedYaml::Record.new(TestData::Seed::Record01)
  end
  
  def test_initialize
    assert_raises(ArgumentError){ AccessibleSeedYaml::Record.new(TestData::Seed::Table) }
  end
  
  def test_original_seed
    assert_equal(TestData::Seed::Record01, @record.original_seed)
  end
  
  def test_attributes
    assert_equal(1,        @record.attributes["id"])
    assert_equal("coffee", @record.attributes["name"])
  end
  
  def test_key
    assert_equal("data1",  @record.key)
  end
end