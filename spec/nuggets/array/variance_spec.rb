require 'nuggets/array/variance'

describe Array, 'when extended by', Nuggets::Array::VarianceMixin do

  it { Array.ancestors.should include(Nuggets::Array::VarianceMixin) }

  example do
    [].variance.should == 0.0
  end

  example do
    [1].variance.should == 0.0
  end

  example do
    [1, 1, 1].variance.should == 0.0
  end

  example do
    [1, 2, 3].variance.should == 2 / 3.0
  end

  example do
    [3, 2, 1].variance.should == 2 / 3.0
  end

  example do
    [-3, -2, -1].variance.should == [3, 2, 1].variance
  end

  example do
    [1, -2, 1, 2, 3, -4, 0, 3, 1, 2, 1, 0, 24].variance.should equal_float(42.0946745562130218)
  end

  example do
    [].covariance.should == 0.0
  end

  example do
    [1].covariance.should == 0.0
  end

  example do
    [1, 1, 1].covariance.should == 0.0
  end

  example do
    [1, 2, 3].covariance.should == 2 / 3.0
  end

  example do
    [3, 2, 1].covariance.should == -2 / 3.0
  end

  example do
    [-3, -2, -1].covariance.should == -[3, 2, 1].covariance
  end

  example do
    [1, -2, 1, 2, 3, -4, 0, 3, 1, 2, 1, 0, 24].covariance.should equal_float(11.615384615384615)
  end

  example do
    a = [1, -2, 1, 2, 3, -4, 0, 3, 1, 2, 1, 0, 24]
    a.zip(Array.new(a.size) { 42 }).covariance.should == 0.0
  end

  example do
    a = [1, -2, 1, 2, 3, -4, 0, 3, 1, 2, 1, 0, 24]
    a.zip(a).covariance.should == a.variance
  end

  example do
    a, b = [1, -2, 1, 2, 3, -4], [3, 1, 2, 1, 0, 24]
    a.zip(b).covariance.should == b.zip(a).covariance
  end

  example do
    a, b = [1, -2, 1, 2, 3, -4], [3, 1, 2, 1, 0, 24]
    m, n = 23, 42

    a.map { |i| m * i }.zip(b.map { |i| n * i }).covariance.should == m * n * a.zip(b).covariance
  end

  example do
    a, b = [1, -2, 1, 2, 3, -4], [3, 1, 2, 1, 0, 24]
    m, n = 23, 42

    a.map { |i| i + m }.zip(b.map { |i| i + n }).covariance.should equal_float(a.zip(b).covariance, 1.0e-13)
  end

end
