
if($args.Count -ne 1){
    Write-Host "Only one parameter was expected. Please enter correctly!"
} else {
    $number = $args[0]
    if($number -match "^[+-]\?[0-9]\+\(\.[0-9]\+\)\?$"){
        $result = fibonnaci ([int] $number)
        for ([int]$i = [int] 0; $i -lt $result.Count; $i++){
            if($i -eq 0){
                Write-Host $result[$i]
            } else{
                Write-Host ", " + $result[$i]
            }
        }
    } else{
        Write-Host "Invalid parameters!"
    }
}

function fibonnaci([int]$number){
    $result = @()
    $result += 0
    $result += 1

    for ([int]$i = [int] 2; $i -le $number; $i++){
        $result += [int] ($result[-1] + $result[-2])
    }

    return $result
}