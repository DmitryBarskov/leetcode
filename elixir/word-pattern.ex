defmodule Solution do
  @spec word_pattern(pattern :: String.t, s :: String.t) :: boolean
  def word_pattern(pattern, s), do: word_pattern(String.graphemes(pattern), String.split(s), %{}, %{})
  def word_pattern([], [], _, _), do: true
  def word_pattern([p | ps], [s | ss], p_to_s, s_to_p) do
    cond do
      Map.has_key?(p_to_s, p) != Map.has_key?(s_to_p, s) -> false
      Map.has_key?(p_to_s, p) -> Map.get(p_to_s, p) == s and Map.get(s_to_p, s) == p and
        word_pattern(ps, ss, p_to_s, s_to_p)
      true -> word_pattern(ps, ss, Map.put(p_to_s, p, s), Map.put(s_to_p, s, p))
    end
  end
  def word_pattern(_, _, _, _), do: false
end
