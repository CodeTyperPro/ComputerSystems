if($args.Count -eq 3){
    $dat = $args
} else{
    $dat=@()
    foreach($x in $input){
        $dat += $x
    }

}

if($dat.Count -ne 3){
    Write-Host "Error!"
} else{
    for ($j = 1; $j -le $dat[2]; $j++){
        echo $dat[0]
        $dat[0] += $dat[1]
    }
}