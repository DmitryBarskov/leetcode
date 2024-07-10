# @param {String[]} logs
# @return {Integer}
def min_operations(logs)
  logs.reduce(0) do |dist, dir|
    case dir
    when "../" then [dist - 1, 0].max
    when "./"  then dist
    else root_dist + 1
    end
  end
end
