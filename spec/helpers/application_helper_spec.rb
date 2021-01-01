require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe 'full_title test' do
    it { expect(full_title('')).to eq '保護犬、保護猫の譲渡里親マッチングサイト' }
    it { expect(full_title('About')).to eq 'About|保護犬、保護猫の譲渡里親マッチングサイト' }
  end
end