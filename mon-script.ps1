param (
    [string]$param1,
    [int]$param2
)

Write-Host "Param1: $param1"
Write-Host "Param2: $param2"

# Example usage:
# .\mon-script.ps1 -param1 "Hello" -param2 42

function ExampleFunctionWithDefault {
    param (
        [string]$inputString = "Default Value"
    )
    
    Write-Host "Input String: $inputString"
}

function ExampleFunction {
    param (
        [string]$inputString
    )
    
    Write-Host "Input String: $inputString"
}