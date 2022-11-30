param([int]$lower, [int]$higher)

function isPrime($number){
    $i = 2
    while(($i -lt $number) -and ($number % $i -ne 0)){
        $i++
    } return $i -eq $number
}

for ($i = $lower; $i -le $higher; $i++){
    if(isPrime $i){
        Write-Host $i
    }
}