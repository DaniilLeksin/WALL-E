# frozen_string_literal: true

require 'spec_helper'

describe Table do
  let!(:subject) { Table }

  describe '#create' do
    it 'creates table' do
      expect(subject.new(5, 15).x_axis).to eq(5)
      expect(subject.new(5, 15).y_axis).to eq(15)
    end
  end
end
