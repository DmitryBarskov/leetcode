func maxBottlesDrunk(numBottles int, numExchange int) int {
	var drank int = 0
	var full int = numBottles
	var empty int = 0
	for ; full > 0; {
		drank += full
		empty += full
		full = 0

		for ; empty >= numExchange; numExchange++ {
			empty -= numExchange
			full++
		}
	}
	return drank
}
