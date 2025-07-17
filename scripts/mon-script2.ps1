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

function ExampleFunction 
    param (
        [string]$inputBoolean = $true,
        [int]$inputNumber = 10,
        [string]$inputString = "Hello, World!"
    )

    Write-Host "Input Boolean: $inputBoolean"
    Write-Host "Input Number: $inputNumber"
    Write-Host "Input String: $inputString"
}

function ExampleFunctionWithSwitch {
    param (
        [switch]$verbose
    
    
    if ($verbose) {
        Write-Host "Verbose mode is ON"
    } else {
        Write-Host "Verbose mode is OFF"
    }
}