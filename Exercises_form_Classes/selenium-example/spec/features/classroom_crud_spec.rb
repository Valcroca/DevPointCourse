require 'rails_helper'

feature 'classroom crud action', js: true do 
  let(:classroom) {FactoryGirl.create(:classroom)}

  scenario 'create a classroom' do
    #go to home page
    visit root_path
    #have a classroom name
    new_classroom_text = 'First Classroom'
    #have a classroom code
    new_classroom_code = '1'
    #click the create classroom link
    page.find_link('new_classroom_link').click
    #fill in name taxt box
    fill_in('classroom_name', with: new_classroom_text)
    #fill in code taxt box
    fill_in('classroom_code', with: new_classroom_code)
    #click create button
    page.find_button('create_classroom_button').click
    expect(current_path).to eq(classrooms_path)
    expect(page).to have_content(new_classroom_text)
    expect(page).to have_content(new_classroom_code)
  end 

  context 'seeded classroom' do
    let(:classroom) {FactoryGirl.create(:classroom)}
    before(:each) do
      classroom
      visit root_path
    end
   

    scenario 'update a classroom' do
      edited_name = 'New name'
      edited_code = 'New Code'
      page.find_button('Edit').click
      fill_in('classroom_name', with: edited_name)
      fill_in('classroom_code', with: edited_code)
      page.find_button('create_classroom_button').click
      expect(page).to have_content(edited_name)
      expect(page).to have_content(edited_code)
      expect(page).to_not have_content(classroom.name)
    end

    scenario 'show a classroom' do
      page.find_link(classroom.name).click
      expect(current_path).to eq(classroom_path(classroom))
      expect(page).to have_content(classroom.name)
      expect(page).to have_content(classroom.code)
    end

    scenario 'destroy a classroom' do
      page.find_button('Destroy').click
      accept_confirm
      expect(current_path).to eq(classrooms_path)
      expect(page).to_not have_content(classroom.name)
      expect(page).to_not have_content(classroom.code)
    end
  end
end
