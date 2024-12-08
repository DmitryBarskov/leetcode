defmodule Solution do
  @spec get_common(nums1 :: [integer], nums2 :: [integer]) :: integer
  def get_common([], _), do: -1
  def get_common(_, []), do: -1
  def get_common([n1 | _], [n2 | _]) when n1 == n2, do: n1
  def get_common([n1 | nums1], [n2 | _] = nums2) when n1 < n2, do: get_common(nums1, nums2)
  def get_common([n1 | _] = nums1, [n2 | nums2]) when n1 > n2, do: get_common(nums1, nums2)
end
