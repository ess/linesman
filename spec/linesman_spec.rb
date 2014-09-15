require 'spec_helper'
require 'linesman'

describe Linesman do
  let(:klass) {Linesman}

  describe '.within_bounds?' do
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

    context 'with :exactly specified' do
      it 'ignores :min and :max' do
        expect(klass.within_bounds?(exactly: 1, min: 2) {1}).to be_true
        expect(klass.within_bounds?(exactly: 1, max: 0) {1}).to be_true
      end

      it 'is true if the block value is exactly as specified' do
        expect(klass.within_bounds?(exactly: 1) {1}).to be_true
      end

      it 'is false if the block value is not exactly as specified' do
        expect(klass.within_bounds?(exactly: 1) {0}).to be_false
      end
    end

    context 'with :min specified' do
      it 'is true if the block value is at least as specified' do
        expect(klass.within_bounds?(min: 1) {1}).to be_true
        expect(klass.within_bounds?(min: 1) {2}).to be_true
      end

      it 'is false if the block value is less than as specified' do
        expect(klass.within_bounds?(min: 1) {0}).to be_false
      end
    end

    context 'with :max specified' do
      it 'is true if the block value is at most as specified' do
        expect(klass.within_bounds?(max: 10) {10}).to be_true
        expect(klass.within_bounds?(max: 10) {9}).to be_true
      end

      it 'is false if the block value is more than as specified' do
        expect(klass.within_bounds?(max: 10) {11}).to be_false
        expect(klass.within_bounds?(max: 10) {100}).to be_false
      end
    end

    context 'with :min and :max specified' do
      it 'is true if the block value is within the inclusive range min..max' do
        min = 1
        max = 10
        (min..max).each do |value|
          expect(klass.within_bounds?(min: min, max: max) {value}).to be_true
        end
      end

      it 'is false if the block value is outside the inclusive range min..max' do
        min = 10
        max = 20
        expect(klass.within_bounds?(min: min, max: max) {min - 1}).to be_false
        expect(klass.within_bounds?(min: min, max: max) {max + 1}).to be_false
      end
    end
  end
end
