module CpsHelper

  def sortable_head(name, selected)
    if (name == selected)
      capture_haml do
        haml_tag 'span.sort', name
      end
    else
      link_to name, cps_path(:sort_by => name), :id=> "sort #{name}"
    end
  end
end
