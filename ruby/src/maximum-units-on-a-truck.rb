# @param {Integer[][]} box_types
# @param {Integer} truck_size
# @return {Integer}
def maximum_units(box_types, truck_size)
  # larger numberOfUnitsPerBox goes first
  box_types.sort! { |a, b| b[1] <=> a[1] }
  
  total_boxes = 0
  total_units = 0
  box_types.each do |boxes, units|
    break if total_boxes >= truck_size
    
    taken_boxes = [boxes, truck_size - total_boxes].min
    total_units += taken_boxes * units
    total_boxes += taken_boxes
  end
  total_units
end
