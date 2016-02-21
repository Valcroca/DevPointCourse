require 'rails_helper'

feature 'empty classroom index', js: true do
  before(:each) do
    visit root_path
  end

  scenario 'correct no classroom message' do
    no_classroom_header = page.find('#no_classroom_header')
    expect(no_classroom_header.text).to eq('No Classrooms JA RULE BABY!!')
  end

  scenario 'new classroom link exists' do
    expect(page.find_link('New Classroom')).to_not be(nil)
  end
end