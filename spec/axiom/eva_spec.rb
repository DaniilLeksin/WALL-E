require 'spec_helper'

describe Eva do
  let!(:table) { Table.new(5,5) }
  let!(:walle) { Walle.new({table: table}) }
  let!(:subject) { Eva.new(walle) }

  describe '#create' do
    it { expect(subject).to be_kind_of(Eva) }
  end
  
  describe '#commands' do
    it 'returns nil if no command' do
      expect(subject.give_order(nil)).to be_nil
    end
    
    it 'returns error message if command not found' do
      msg = Answers::INVALID_INPUT
      expect(subject.give_order('fake_comand')).to eq(msg)
    end

    it 'returns error message if command is crazy' do
      msg = Answers::INVALID_INPUT
      expect(subject.give_order('place 0,0,0')).to eq(msg)
    end
    
    it 'returns error message when exception' do
      msg = Answers::IDN
      allow_any_instance_of(Walle).to receive(:report).and_raise(StandardError)
      expect(subject.give_order('report')).to eq(msg)
    end
    
    it 'parse args' do
      msg = Answers::GOOD_JOB
      expect(subject.give_order('PLACE 1,2,EAST')).to eq(msg)
    end
  end
end
