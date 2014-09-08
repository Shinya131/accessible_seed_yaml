module TestData
  module Seed
    Record01 =
    [
      "data1:\n",
      "  id: 1\n",
      "  name: \"coffee\"\n"
    ].join
    
    Record02 =
    [
      "data2:\n",
      "  id: 2\n",
      "  name: \"tea\"\n"
    ].join
    
    Record03 =
    [
      "data3:\n",
      "  id: 3\n",
      "  name: \"water\"\n"
    ].join
      
    Table =
    [
      Record01,
      Record02,
      Record03
    ].join
  end
end