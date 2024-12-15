defmodule Solution do
  @spec to_lower_case(s :: String.t) :: String.t
  def to_lower_case(s),
    do: s
      |> String.to_charlist
      |> Enum.map(
          fn
            char_code when 65 <= char_code and char_code <= 90 -> char_code + 32
            char_code -> char_code
          end
      )
      |> List.to_string
end
