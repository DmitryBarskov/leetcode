func numWaterBottles(numBottles int, numExchange int) int {
	drank := 0
	empty := 0
	full := numBottles
	for ; full > 0; {
		drank += full
		empty += full

		full = empty / numExchange
		empty %= numExchange
	}

	return drank
}
