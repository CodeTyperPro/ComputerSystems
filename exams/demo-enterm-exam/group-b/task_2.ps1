$ROMAN_NUMBER = Read-Host "Enter the roman number"

if($ROMAN_NUMBER -match "^[A-Z]+$"){
    # ???
} else{
    Write-Host "Invalid input."
}