
if($args.Count -gt 1){
    Write-Host "Only one parameter/nothing was expected. Please enter correctly!"
} else{

    if($args.Count -eq 0){
        $number = Read-Host "Enter the number"    
     } else{
        $number = $args[0]
     }

    Write-Host $number

    if($number -match '^[0-9]+$'){

        $result = fibonnaci ([int] $number)
        for ($i = 1; $i -lt $result.Count; $i++){
            if($i -eq 1){
                Write-Host $result[$i] -NoNewline
            } else{
                Write-Host ", " $result[$i] -NoNewline
            }
        }
    } else{
        Write-Host "Invalid parameter!"
    }
}

function fibonnaci([int]$number){
    $result = @()
    $result += 0 # Here fib starts fo
    $result += 1

    for ([int]$i = [int] 2; $i -le $number; $i++){
        $result += [int] ($result[-1] + $result[-2])
    }

    return $result
}