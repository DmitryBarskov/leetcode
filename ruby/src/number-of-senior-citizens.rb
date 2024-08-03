# @param {String[]} details
# @return {Integer}
def count_seniors(details)
  details.count { |d| d[11] > '6' || d[11] == '6' && d[12] > '0' }
end
