param([int]$number)

$fact = 1
for ($i = 1; $i -le $number; $i++){
    $fact *= $i
}

Write-Host "$number ! = $fact"