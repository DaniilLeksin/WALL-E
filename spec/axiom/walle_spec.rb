require 'spec_helper'

describe Walle do
  let(:table) { Table.new 5, 5 }
  subject { Walle.new(table: table) }

  describe '#initialize' do
    it 'initializes with default values' do
      expect(subject.table).to be_kind_of(Table)
      expect(subject.x_pos).to be_nil
      expect(subject.y_pos).to be_nil
      expect(subject.direction).to be_nil
      expect(subject.index).to be_nil
    end
  end

  describe '#go walle defaults' do
    it 'places' do
      subject.place(opts={x_pos: 0, y_pos: 0, direction: 'NORTH'})
      expect(subject.x_pos).to eq(0)
      expect(subject.y_pos).to eq(0)
      expect(subject.index).to be(0) # North has 0-index
      expect(subject.direction).to eq(:NORTH)
    end
    
    it 'reports' do
      expect(subject.report).to eq('Hey Eva, Im not placed :(')
      subject.place(opts={x_pos: 0, y_pos: 0, direction: 'NORTH'})
      expect(subject.report).to eq('0,0,NORTH')
    end
    
    it 'turns left' do
      subject.place(opts={x_pos: 0, y_pos: 0, direction: 'NORTH'})
      subject.left
      expect(subject.x_pos).to eq(0)
      expect(subject.y_pos).to eq(0)
      expect(subject.index).to be(3) # West has 3-index
      expect(subject.direction).to eq(:WEST)
    end
    
    it 'turns right' do
      subject.place(opts={x_pos: 0, y_pos: 0, direction: 'NORTH'})
      subject.right
      expect(subject.x_pos).to eq(0)
      expect(subject.y_pos).to eq(0)
      expect(subject.index).to be(1) # East has 1-index
      expect(subject.direction).to eq(:EAST)
    end
    
    it 'moves' do
      subject.place(opts={x_pos: 0, y_pos: 0, direction: 'NORTH'})
      subject.move
      expect(subject.x_pos).to eq(0)
      expect(subject.y_pos).to eq(1)
      expect(subject.index).to be(0) # North has 0-index
      expect(subject.direction).to eq(:NORTH)
    end
  end

  describe '#go walle specials' do
    it '#Example a' do
      subject.place(opts={x_pos: 0, y_pos: 0, direction: 'NORTH'})
      subject.move
      expect(subject.report).to eq('0,1,NORTH')
    end
    
    it '#Example b' do
      subject.place(opts={x_pos: 0, y_pos: 0, direction: 'NORTH'})
      subject.left
      expect(subject.report).to eq('0,0,WEST')
    end
    
    it '#Example c' do
      subject.place(opts={x_pos: 1, y_pos: 2, direction: 'EAST'})
      subject.move
      subject.move
      subject.left
      subject.move
      expect(subject.report).to eq('3,3,NORTH')
    end
  end
end
