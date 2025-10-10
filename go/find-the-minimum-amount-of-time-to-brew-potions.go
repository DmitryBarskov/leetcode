func minTime(skill []int, mana []int) int64 {
	var wizardReady []int64 = make([]int64, len(skill))
	for _, manaRequired := range mana {
		var potionReady int64 = wizardReady[0]

		for wizard, s := range skill {
			potionReady = max(potionReady, wizardReady[wizard])
			potionReady += int64(manaRequired) * int64(s)
			wizardReady[wizard] = potionReady
		}

		for i := len(skill) - 2; i >= 0; i-- {
			wizardReady[i] = wizardReady[i + 1] - int64(manaRequired) * int64(skill[i + 1])
		}
	}
	return wizardReady[len(wizardReady) - 1]
}
