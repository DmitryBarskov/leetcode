func maximumEnergy(energy []int, k int) int {
	var maxEnergy int = energy[len(energy) - 1]

	for lastMagician := len(energy) - k; lastMagician < len(energy); lastMagician++ {
		var energyConsumed int = 0
		for m := lastMagician; m >= 0; m -= k {
			energyConsumed += energy[m]
			maxEnergy = max(maxEnergy, energyConsumed)
		}
	}
	return maxEnergy
}
