// Package weather provides tools for generating
// weather forecasts.
package weather

// CurrentCondition represents the current weather conditions.
var CurrentCondition string

// CurrentLocation represents the location of a weather forecast.
var CurrentLocation string

// Forecast returns a string describing the weather at a provided location.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
