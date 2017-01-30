class Hamming
  def self.compute(a, b, type = Strand)
    self.new(a, b, type).count
  end

  def initialize(a, b, type)
    self.one = type.parse(a)
    self.two = type.parse(b)
  end

  def count
    difference.count
  end

  def difference
    one.zip(two).select {|pair| Comparison.different?(pair)}
  end

  class Comparison
    def self.different?(couple)
      couple.first != couple.last &&
      !couple.last.nil? &&
      !couple.first.nil?
    end
  end

  private

  attr_accessor :one, :two
end

require 'delegate'
class Strand < SimpleDelegator
  def self.parse(strand_string)
    self.new(strand_string.chars)
  end
end