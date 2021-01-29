require 'rails_helper'

RSpec.describe "Dogs", type: :system do
  
  let(:dog) { FactoryBot.create(:dog) }
  
  describe 'Dogs関連ページ' do
    
    context 'Dogs一覧ページ' do
      it 'ログインなしでも一覧ページに遷移' do
        visit dogs_path
        expect(current_path).to eq(dogs_path)
      end
    end
    
    context 'Dog詳細ページ' do
      it 'ログインなしでも詳細ページに遷移' do
        visit dog_path(dog)
        expect(current_path).to eq(dog_path(dog))
      end
    end
  
  end
  
end
