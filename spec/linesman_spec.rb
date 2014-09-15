require 'spec_helper'
require 'linesman'

describe Linesman do
  let(:klass) {Linesman}

  describe %(.within_bounds?) do
    it 'requires :exactly or some combination of :min and :max' do
      expect {klass.within_bounds?() {}}.to raise_error(ArgumentError)
      expect {klass.within_bounds?(exactly: 1) {1}}.not_to raise_error
      expect {klass.within_bounds?(min: 1) {1}}.not_to raise_error
      expect {klass.within_bounds?(max: 1) {1}}.not_to raise_error
      expect {klass.within_bounds?(exactly: 1, min: 1, max: 1) {1}}.not_to raise_error
    end

    it 'requires a block' do
      expect {klass.within_bounds?(exactly: 1)}.to raise_error(ArgumentError)
      expect {klass.within_bounds?(exactly: 1) {0}}.not_to raise_error
    end
  end
end
