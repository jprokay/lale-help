module PageObject
  module Circle
    class WorkingGroups < PageObject::Page

      set_url '/circles/{circle_id}/admin/working_groups'

      sections :working_groups, '.wg-table:nth-of-type(1) tbody tr' do
        element :name, '.name a'
        elements :organizers, '.admins li'
      end

      element :deactivate_button, 'a.button', text: 'Deactivate'
      element :delete_button, 'a.button', text: 'Delete'
      element :edit_button, 'a.button-primary', text: 'Edit'
      element :reactivate_button, 'a.button', text: 'Reactivate'
    end
  end
end