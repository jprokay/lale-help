require 'rails_helper'

describe "Delete a working group", js: true do

  let(:circle) { create(:circle, :with_admin) }
  let(:circle_admin) { circle.admin }

  let(:working_group) { create(:working_group, :public, circle: circle, admin: circle_admin) }

  let(:circle_wg_page) { PageObject::Circle::WorkingGroups.new }
  let(:edit_wg_form)   { PageObject::WorkingGroup::Form.new }

  let(:inputs) { attributes_for(:working_group, :private, organizer_name: circle_admin.name) }

  before { circle_wg_page.load(circle_id: circle.id, as: working_group.circle.admin.id) }

  context "deactivated working group" do
  
    it "can be deleted" do
      circle_wg_page.deactivate_button.click
      circle_wg_page.delete_button.click
    end
  end

  context "active working group" do
  
    it "cannot be deleted" do
      expect(circle_wg_page).not_to have_delete_button
    end
  end
end