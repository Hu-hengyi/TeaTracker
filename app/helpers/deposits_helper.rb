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

  def since_previous(days_since)
    if days_since == -1
      return "No previous deposit"
    elsif days_since == 1
      return "1 day ago"
    else
      return days_since.to_s << " days ago"
      #return next_td.weighed_at.to_formatted_s(:long_ordinal)
    end
  end

  def change_farm_totals(days_since, farm)
    if days_since < 0
      return
    end
    if @farm_totals.has_key?(farm)
      @farm_totals[farm] = @farm_totals[farm] + days_since
      @farm_deps[farm] = @farm_deps[farm] + 1
    else
      @farm_totals[farm] = days_since
      @farm_deps[farm] = 1
    end
  end

  def calc_farm_totals
      bracket_a = 0
      bracket_b = 0
      bracket_c = 0
      @farm_totals.each do |key, value|
        avg = value.to_f/@farm_deps[key]
        if avg < @cut_a
          bracket_a += 1
        elsif avg < @cut_b
          bracket_b += 1
        else
          bracket_c += 1
        end
      end
      total = (bracket_a + bracket_b + bracket_c).to_f
      calc = Hash.new
      calc[:bracket_a] = bracket_a/total
      calc[:bracket_b] = bracket_b/total
      calc[:bracket_c] = bracket_c/total
      return calc
  end

end
