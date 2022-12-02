
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
        for($i = 1; $i -le 10; $i++){
            Write-Host $i.ToString()
            print([int] $i)
        }
    } else{
        Write-Host "Invalid parameter!"
    }
}

function print([int]$number){
    [int] $LIMIT = [int] 10
    for($i = 1; $i -le $LIMIT; $i++){
        [int] $mult = [int]($i*$number)
        [string]$line = [string] ($number.ToString() + "*" + $i.ToString() + " = " + $mult)
        Write-Host $line
    }
}