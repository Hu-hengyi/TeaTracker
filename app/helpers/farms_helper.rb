module FarmsHelper
  def sortable_header(name, selected)
    if (name == selected)
      capture_haml do
        haml_tag 'span.sort', name
      end
    else
      link_to name, farms_path(:sort_by => name), :id=> "sort #{name}"
    end
  end

  def fertilizer(bushes)
    return bushes * 3
  end
end
