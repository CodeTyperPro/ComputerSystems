if($args.Count -ne 1){
    Write-Host "I need a number."
} else{

    $fact = 1
    $number = $args[0]
    for ($i = 1; $i -le $number; $i++){
        $fact *= $i
    }

    Write-Host "$number ! = $fact"
}
