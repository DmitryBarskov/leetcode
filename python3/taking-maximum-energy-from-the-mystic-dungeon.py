import math


class Solution:
    def maximumEnergy(self, energy: list[int], k: int) -> int:
        max_energy = -math.inf
        for last_magician in range(len(energy) - k, len(energy)):
            energy_consumed = 0
            for i in range(last_magician, -1, -k):
                energy_consumed += energy[i]
                max_energy = max(energy_consumed, max_energy)
        return max_energy
