<#
.SYNOPSIS
Gets the current location's weather forecast.

.DESCRIPTION
The `Get-WeatherForecast` cmdlet sends an HTTP GET request to https://wttr.in
to fetch a detailed weather forecast for the selected location. The forecast
is printed in the CLI.

Powershell 3.0 (or later) is required.

.PARAMETER Location
Specifies the location of the requested forecast. Using ASCII characters is
recommended. The Location parameter can refer to the area of a weather station
or airport IATA codes. If the given string does not correspond to any valid
weather stations, a weather forecast for Oymyakon will be returned. Combine
multiple words with "+".

.INPUTS
None

.OUTPUTS
Text-based weather forecast.

.NOTES 
In Poweshell 7.0.0 (or later), UTF-8 strings can be accepted as valid locations.

.EXAMPLE
Get-WeatherForecast
Get the weather forecast for current location

.EXAMPLE
Get-WeatherForecast -Location Eiffel+Tower
Get the weather forecast for the Eiffel Tower, Paris (FR) 

.EXAMPLE
Get-WeatherForecast -Location JFK
Get the weather for J. F. Kennedy Intl. Airport, NYC (U.S.A.)

.LINK
Invoke-WebRequest

.LINK
https://wttr.in
#>
Function Get-WeatherForecast {

    [CmdletBinding()]

    param (

        [Parameter(Mandatory = $false,
                    ValueFromPipeline = $false,
                    ParameterSetName = 'Location',
                    HelpMessage = "Location to get weather forecast.")]
        [string]
        $Location

    )
    
    Process
    {
        (Invoke-WebRequest https://wttr.in/$Location).content
    }
}

Export-ModuleMember -Function 'Get-WeatherForecast'