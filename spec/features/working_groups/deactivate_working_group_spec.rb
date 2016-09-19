require 'rails_helper'

describe "Deactivate a working group", js: true do

  let(:circle) { create(:circle, :with_admin) }
  let(:circle_admin) { circle.admin }

  let(:working_group) { create(:working_group, :public, circle: circle, admin: circle_admin) }

  let(:circle_wg_page) { PageObject::Circle::WorkingGroups.new }
  let(:edit_wg_form)   { PageObject::WorkingGroup::Form.new }

  let(:inputs) { attributes_for(:working_group, :private, organizer_name: circle_admin.name) }

  before { circle_wg_page.load(circle_id: circle.id, as: working_group.circle.admin.id) }

  it "works" do
    circle_wg_page.deactivate_button.click
    # Check that it appears in inactive groups
  end

  context "working group has incomplete supply" do

    let(:supply) { create(:supply, working_group: working_group)}
    it "cannot be deactivated" do
      circle_wg_page.deactivate_button.click
      expect(page.driver.browser.switch_to.alert.text).to eq("The group still contains incomplete tasks or supplies. Please complete them first, then try again.")
    end
  end
end