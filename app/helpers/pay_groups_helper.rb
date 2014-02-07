module PayGroupsHelper
  def pay_group_header(name, selected)
    if (name == selected)
      capture_haml do
        haml_tag 'span.sort', name
      end
    else
      link_to name, pay_groups_path(:sort_by => name), :id=> "sort #{name}"
    end
  end

end
