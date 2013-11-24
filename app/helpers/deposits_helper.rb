module DepositsHelper
  def deposit_header(name, selected)
    if (name == selected)
      capture_haml do
        haml_tag 'span.sort', name
      end
    else
      link_to name, deposits_path(:sort_by => name), :id=> "sort #{name}"
    end
  end
end
