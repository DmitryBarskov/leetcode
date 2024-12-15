defmodule Solution do
  @spec max_two_events(events :: [[integer]]) :: integer
  def max_two_events(events) do
    arr = Enum.sort_by(events, fn [s, _e, _v] -> s end) |> List.to_tuple
    recur(arr, Map.new(), 0, 0) |> Map.get({0, 0})
  end

  def recur(_, memo, i, 2), do: Map.put(memo, {i, 2}, 0)
  def recur(events, memo, i, count) when i >= tuple_size(events), do: Map.put(memo, {i, count}, 0)
  def recur(events, memo, i, count) do
    if Map.has_key?(memo, {i, count}) do
      memo
    else
      [_start_time, end_time, value] = events |> elem(i)
      next_event = binary_search(
        i,
        tuple_size(events),
        fn j -> (events |> elem(j) |> hd) > end_time end
      )
      included = recur(events, memo, next_event, count + 1)
      excluded = recur(events, included, i + 1, count)
      Map.put(
        excluded,
        {i, count},
        max(
          value + included[{next_event, count + 1}],
          excluded[{i + 1, count}]
        )
      )
    end
  end

  def binary_search(from, to, _) when from >= to, do: from
  def binary_search(from, to, predicate) do
    mi = div(from + to, 2)
    if predicate.(mi) do
      binary_search(from, mi, predicate)
    else
      binary_search(mi + 1, to, predicate)
    end
  end
end
