package cars

// CalculateWorkingCarsPerHour calculates how many working cars are
// produced by the assembly line every hour.
func CalculateWorkingCarsPerHour(productionRate int, successRate float64) float64 {
	return float64(productionRate) * (successRate / 100)
}

// CalculateWorkingCarsPerMinute calculates how many working cars are
// produced by the assembly line every minute.
func CalculateWorkingCarsPerMinute(productionRate int, successRate float64) int {
	prodPerMin := float64(productionRate / 60)
	return int(prodPerMin * (successRate / 100))
}

// CalculateCost works out the cost of producing the given number of cars.
func CalculateCost(carsCount int) uint {
	//groups of 10 cars can be produced more cheaply
	tenCount := carsCount / 10
	remainder := carsCount % 10
	return uint(tenCount)*95000 + uint(remainder)*10000
}
