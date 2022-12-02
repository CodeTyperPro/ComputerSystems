
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
        $result = binary ([int] $number)
        #Write-Host $result
        Write-Host "(" $number ")10 = " -NoNewline
        Write-Host "(" -NoNewline
        for ([int]$i = [int] 0; $i -lt $result.Count; $i++){
            Write-Host $result[$i].ToString() -NoNewline
        }
        Write-Host ")2" -NoNewline
    } else{
        Write-Host "Invalid parameter!"
    }
}

function binary([int]$number){
    $result = @()

    while($number -gt ([int] 0)){
        [int]$rem = [int] $number % 2
        $result += $rem
        $number = $number / ([int] 2)
    }
    
    [array]::Reverse($result)

    return $result
}