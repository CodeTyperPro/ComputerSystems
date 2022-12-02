
if($args.Count -ne 2){
    Write-Host "Only two parameter was expected. Please enter correctly!"
} else{

    $word = $args[0]

    if(($args[1] -match '^[0-9]+$')){
        $number = $args[1]
        cutword($number, $word)
    } else{
        Write-Host "Invalid parameter!"
    }
}


function cutword(){

    if($word.ToString().Length -gt ([int]$number)){
        [string] $x = [string] $word.ToString().Substring(0,  ([int] $number))
        for($i = 0; $i -lt ([int] $number); $i++){
            Write-Host $x
        }
    }
}

#apple 3