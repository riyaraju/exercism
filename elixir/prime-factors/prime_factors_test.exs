if System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("example.exs")
else
  Code.load_file("prime_factors.exs")
end

ExUnit.start

defmodule PrimeFactorsTest do
  use ExUnit.Case, async: true

  test "1" do
    assert PrimeFactors.factors_for(1) == []
  end

  test "2" do
    assert PrimeFactors.factors_for(2) == [2]
  end

  test "3" do
    assert PrimeFactors.factors_for(3) == [3]
  end

  test "4" do
    assert PrimeFactors.factors_for(4) == [2, 2]
  end

  test "6" do
    assert PrimeFactors.factors_for(6) == [2, 3]
  end

  test "8" do
    assert PrimeFactors.factors_for(8) == [2, 2, 2]
  end

  test "9" do
    assert PrimeFactors.factors_for(9) == [3, 3]
  end

  test "27" do
    assert PrimeFactors.factors_for(27) == [3, 3, 3]
  end

  test "625" do
    assert PrimeFactors.factors_for(625) == [5, 5, 5, 5]
  end

  test "901255" do
    assert PrimeFactors.factors_for(901255) == [5, 17, 23, 461]
  end

  test "93819012551" do
    assert PrimeFactors.factors_for(93819012551) == [11, 9539, 894119]
  end

  test "2993819012551" do
    assert PrimeFactors.factors_for(2993819012551) == [41801, 71620751]
  end

  test "big prime number" do
    assert PrimeFactors.factors_for(413158511) == [413158511]
  end

  test "big not-quite-prime number" do
    assert PrimeFactors.factors_for(2 * 413158511) == [2, 413158511]
  end

  test "lots of 2s" do
    big_number = round(:math.pow(2, 100))
    assert PrimeFactors.factors_for(big_number) == List.duplicate(2, 100)
  end

end
