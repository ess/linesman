require 'linesman/version'

module Linesman
  def self.within_bounds?(options = {}, &block)
    at_least_one = [:exactly, :min, :max]
    unless at_least_one.map {|key| options.has_key?(key)}.any? {|present| present}
      raise ArgumentError.new('At least one of the following is required: :exactly, :min, :max')
    end

    raise ArgumentError.new('a block is required') if block.nil?

    
  end

  
end
