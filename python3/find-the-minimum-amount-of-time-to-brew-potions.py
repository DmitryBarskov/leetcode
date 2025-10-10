class Solution:
    def minTime(self, skill: list[int], mana: list[int]) -> int:
        wizard_ready = [0] * len(skill)
        for mana_required in mana:
            potion_ready = wizard_ready[0]

            for wizard, s in enumerate(skill):
                potion_ready = max(potion_ready, wizard_ready[wizard])
                potion_ready += s * mana_required
                wizard_ready[wizard] = potion_ready

            # adjust actual time when each wizard finished with this potion
            for i in range(len(skill) - 2, -1, -1):
                wizard_ready[i] = wizard_ready[i + 1] - mana_required * skill[i + 1]
        return wizard_ready[-1]
