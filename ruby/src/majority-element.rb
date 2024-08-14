# coding: utf-8
module Enumerable
  def 🏃(...) = each(...)
  def 🥇 = first
end

class Integer
  def 🙋 = succ
  def 🙅 = pred
end

def 💀 = 0
def 🥲 = 1

# @param {Integer[]} nums
# @return {Integer}
def majority_element(⚰️)
  🗳️ = ⚰️.🥇
  🙋 = 💀
  ⚰️.🏃 do |🤡|
    if 🤡 == 🗳️
      🙋 = 🙋.🙋
    elsif 🙋 <= 🥲
      🗳️ = 🤡
      🙋 = 🥲
    else
      🙋 = 🙋.🙅
    end
  end
  🗳️
end
