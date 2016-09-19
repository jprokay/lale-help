require 'rails_helper'

describe "Edit a working group", js: true do

  let(:circle)        { create(:circle, :with_admin) }
  let(:circle_admin)  { circle.admin }

  let(:working_group) { create(:working_group, :public, circle: circle, admin: circle_admin) }

  let(:circle_wg_page) { PageObject::Circle::WorkingGroups.new }
  let(:edit_wg_form)   { PageObject::WorkingGroup::Form.new }

  let(:inputs) { attributes_for(:working_group, :private, organizer_name: circle_admin.name) }

  before { circle_wg_page.load(circle_id: circle.id, as: circle_admin) }

  it "works" do
    circle_wg_page.when_loaded do
      circle_wg_page.edit_button.click
      edited_page = edit_wg_form.submit_with(:inputs)
      edited_page.when_loaded do
        expect(edited_page.working_groups.first.name.text).to eq(inputs[:name])
        expect(edited_page.working_groups.description.text).to eq(inputs[:description])
        expect(edited_page.working_groups.access_type.text).to eq(inputs[:access_type])
      end
    end
  end
end