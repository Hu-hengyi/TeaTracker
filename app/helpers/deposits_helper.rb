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

  def since_previous(deposit)
    next_td = Deposit.find(:first, :order => "weighed_at DESC", :conditions => [ "farm_id = ? AND weighed_at < ?", deposit.farm_id, deposit.weighed_at])
    if next_td == nil
      return "No previous deposit"
    else
      days_btwn = (deposit.weighed_at - next_td.weighed_at).to_i / 1.day
      if days_btwn < 7
        @groupA = @groupA + 1
      elsif days_btwn < 13
        @groupB = @groupB + 1
      else
        @groupC = @groupC + 1
      end
      return days_btwn.to_s << " day(s) ago"
      #return next_td.weighed_at.to_formatted_s(:long_ordinal)
    end
  end

end
