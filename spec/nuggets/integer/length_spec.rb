require 'nuggets/integer/length'

describe Integer, 'when extended by', Nuggets::Integer::LengthMixin do

  it { Integer.ancestors.should include(Nuggets::Integer::LengthMixin) }

  {
    0           => [1, 1],
    123         => [3, 3],
    -123        => [4, 3],
    1_000_000   => [7, 7],
    -1_000_000  => [8, 7],
    10 ** 48    => [49, 49],
    -(10 ** 48) => [50, 49]
  }.each { |int, (len, cnt)|
    example { int.length.should == len }
    example { int.digit_count.should == cnt }
  }

end
