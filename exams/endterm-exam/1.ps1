
if($args.Count -gt 2){
    Write-Host "Only two parameter/nothing was expected. Please enter correctly!"
} else{

    if($args.Count -eq 0){
        $first_number = Read-Host "Enter the first number"
        $second_number = Read-Host "Enter the second number"
     } else{
        $first_number = $args[0]
        $second_number = $args[1]
     }

    if(($first_number -match '^[0-9]+$') -and ($second_number -match '^[0-9]+$')){
        for ($i = 1; $i -le ([int] $second_number); $i++){
            Write-Host $first_number.ToString() " " -NoNewline
        }
    } else{
        Write-Host "Invalid parameter!"
    }
}