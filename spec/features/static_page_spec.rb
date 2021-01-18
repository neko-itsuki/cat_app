require 'rails_helper'

RSpec.feature "StaticPages", type: :feature do

  describe "Static pages" do

    expect_title = ['Home', 'About', 'Description', 'Flow', 'Action',
                    'Centers', 'Users', 'Privacy', 'Rule', 'Sitemap']
    
    it 'expect title and h1' do
      expect_title.each do |title|
        title_url = title.downcase
        visit title_url
        expect(page).to have_title full_title(title)
        expect(page).to have_content title
      end
    end

  end
  
end
