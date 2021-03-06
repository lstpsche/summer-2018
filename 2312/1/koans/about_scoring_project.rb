require File.expand_path(File.dirname(__FILE__) + '/neo')

# Greed is a dice game where you roll up to five dice to accumulate
# points.  The following "score" function will be used to calculate the
# score of a single roll of the dice.
#
# A greed roll is scored as follows:
#
# * A set of three ones is 1000 points
#
# * A set of three numbers (other than ones) is worth 100 times the
#   number. (e.g. three fives is 500 points).
#
# * A one (that is not part of a set of three) is worth 100 points.
#
# * A five (that is not part of a set of three) is worth 50 points.
#
# * Everything else is worth 0 points.
#
#
# Examples:
#
# score([1,1,1,5,1]) => 1150 points
# score([2,3,4,6,2]) => 0 points
# score([3,4,5,3,3]) => 350 points
# score([1,5,1,2,4]) => 250 points
#
# More scoring examples are given in the tests below:
#
# Your goal is to write the score method.
# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength
# :reek:ControlParameter
def cond_one(ins)
  if ins == 1
    1000
  else
    100 * i
  end
end

# :reek:TooManyStatements
# :reek:DuplicateMethodCall
# :reek:FeatureEnvy
def score(dice)
  score = 0
  totals = [0] * 7
  dice.map { |ins| totals[ins] += 1 }
  (1..6).each do |ins|
    next unless totals[ins] >= 3
    score += cond_one(ins)
    score += if ins == 1
               1000
             else
               100 * i
             end
    totals[ins] -= 3
  end
  score += totals[1] * 100 + totals[5] * 50
end
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/MethodLength

# sadasf af sf aafsf
class AboutScoringProject < Neo::Koan
  # This method smells of :reek:UncommunicativeMethodName
  # This method smells of :reek:UncommunicativeVariableName
  # This method smells of :reek:TooManyStatements
  # This method smells of :reek:FeatureEnvy
  def test_score_of_an_empty_list_is_zero
    assert_equal 0, score([])
  end

  def tstfst
    assert_equal 50, score([5])
  end

  def tstscn
    assert_equal 100, score([1])
  end

  def tstthd
    assert_equal 300, score([1, 5, 5, 1])
  end

  def tstfth
    assert_equal 0, score([2, 3, 4, 6])
  end

  def tstfvt
    assert_equal 1000, score([1, 1, 1])
  end

  def tstsix
    assert_equal 200, score([2, 2, 2])
    assert_equal 300, score([3, 3, 3])
    assert_equal 400, score([4, 4, 4])
    assert_equal 500, score([5, 5, 5])
    assert_equal 600, score([6, 6, 6])
  end

  def tstsvn
    assert_equal 250, score([2, 5, 2, 2, 3])
    assert_equal 550, score([5, 5, 5, 5])
    assert_equal 1100, score([1, 1, 1, 1])
    assert_equal 1200, score([1, 1, 1, 1, 1])
    assert_equal 1150, score([1, 1, 1, 5, 1])
  end
end
