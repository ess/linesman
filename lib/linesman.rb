require 'linesman/version'

module Linesman
  def self.within_bounds?(options = {}, &block)
    at_least_one = [:exactly, :min, :max]
    unless at_least_one.map {|key| options.has_key?(key)}.any? {|present| present}
      raise ArgumentError.new('At least one of the following is required: :exactly, :min, :max')
    end

    raise ArgumentError.new('a block is required') if block.nil?

    exactly = options[:exactly]
    min = options[:min]
    max = options[:max]

    under_scrutiny = block.call

    if exactly
      return under_scrutiny == exactly
    elsif min && max
      return under_scrutiny >= min && under_scrutiny <= max
    elsif min
      return under_scrutiny >= min
    else
      return under_scrutiny <= max
    end
  end
end
