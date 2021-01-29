require 'rails_helper'

RSpec.describe "Cats", type: :system do
  
  let(:cat) { FactoryBot.create(:cat) }
  
  describe 'Cats関連ページ' do
    
    context 'Cats一覧ページ' do
      it 'ログインなしでも一覧ページに遷移' do
        visit cats_path
        expect(current_path).to eq(cats_path)
      end
    end
    
    context 'Cat詳細ページ' do
      it 'ログインなしでも詳細ページに遷移' do
        visit cat_path(cat)
        expect(current_path).to eq(cat_path(cat))
      end
    end
  
  end
  
end
