require 'spec_helper'

describe 'enumerator_comparable' do

  def seq(s)
    s.each_char
  end

  describe 'spaceship' do
    describe 'both empty' do
      let(:a){seq('')}
      let(:b){seq('')}
      it 'should be 0' do
        (a <=> b).should == 0
      end
    end
    describe 'single and equal' do
      let(:a){seq('c')}
      let(:b){seq('c')}
      it 'should be 0' do
        (a <=> b).should == 0
      end
    end
    describe 'double and equal' do
      let(:a){seq('xy')}
      let(:b){seq('xy')}
      it 'should be 0' do
        (a <=> b).should == 0
      end
    end
    describe 'left shorter' do
      let(:a){seq('')}
      let(:b){seq('a')}
      it 'should be 0' do
        (a <=> b).should == -1
      end
    end
    describe 'right shorter' do
      let(:a){seq('a')}
      let(:b){seq('')}
      it 'should be 0' do
        (a <=> b).should == 1
      end
    end
    describe 'left less' do
      let(:a){seq('a')}
      let(:b){seq('b')}
      it 'should be 0' do
        (a <=> b).should == -1
      end
    end
    describe 'right less' do
      let(:a){seq('b')}
      let(:b){seq('a')}
      it 'should be 0' do
        (a <=> b).should == 1
      end
    end
    describe 'left less in second position' do
      let(:a){seq('ba')}
      let(:b){seq('bb')}
      it 'should be 0' do
        (a <=> b).should == -1
      end
    end
    describe 'right less in second position' do
      let(:a){seq('bb')}
      let(:b){seq('ba')}
      it 'should be 0' do
        (a <=> b).should == 1
      end
    end

    describe 'equality' do
      describe 'both empty' do
        let(:a){seq('')}
        let(:b){seq('')}
        it 'should be equal' do
          a.should == b
        end
      end
      describe 'same length 1' do
        let(:a){seq('c')}
        let(:b){seq('c')}
        it 'should be equal' do
          a.should == b
        end
      end
      describe 'unequal, length 1' do
        let(:a){seq('c')}
        let(:b){seq('d')}
        it 'should not be equal' do
          a.should_not == b
        end
      end
    end
  end

end
