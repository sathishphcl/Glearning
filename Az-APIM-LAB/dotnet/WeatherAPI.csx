#r "Newtonsoft.Json"
#r "System.Net.Http"

using System.Net.Http;
using Newtonsoft.Json;
using Microsoft.AspNetCore.Mvc;

public static async Task<IActionResult> Run(HttpRequest req, ILogger log)
{
    // Get the API key from environment variables (Application Settings in Azure)
    string apiKey = Environment.GetEnvironmentVariable("WEATHER_API_KEY");

    // If the API key is not found in the environment variables
    if (string.IsNullOrEmpty(apiKey))
    {
        log.LogError("Weather API key is missing.");
        return new BadRequestObjectResult("Weather API key is missing.");
    }

    // Default location if not provided in the query
    string defaultLocationCityCountry = "Toronto, Canada";
    string location = req.Query["location"];

    log.LogInformation($"Requested location: {location}");

    string locationCityCountry = string.IsNullOrEmpty(location) ? defaultLocationCityCountry : location;

    // Construct the API request URL using the environment-secured API key
    string url = $"http://api.weatherstack.com/current?access_key={apiKey}&query={locationCityCountry}";
    log.LogInformation($"API Request URL: {url}");

    // Initiate HTTP call to the Weather API
    var client = new HttpClient();
    var response = await client.GetAsync(url);

    // Handle the HTTP response
    if (!response.IsSuccessStatusCode)
    {
        log.LogError($"Error calling Weather API: {response.StatusCode}");
        return new StatusCodeResult(500);  // Internal Server Error
    }

    var json = await response.Content.ReadAsStringAsync();
    dynamic responseData = JsonConvert.DeserializeObject(json);

    string responseMessage = string.IsNullOrEmpty(json)
        ? "This HTTP triggered function executed successfully!"
        : $"This HTTP triggered function executed successfully! \nWeather API response: \n{json}";

    return new OkObjectResult(responseMessage);
}
