if($args.Count -eq 1){
    if(Test-Path $args[0]){
        $content =@()
        $content += Get-Content $args[0]
        foreach($row in $content){
            if($row -match "^[0-9a-z]{6}$"){
                Write-Host "$row is a neptune-code."
            } else{
                Write-Host "$row is not a neptune-code."
            }
        }
    } else{
        Write-Host "It is not a filename."
    }
} else{
    Write-Host "I need a filename."
}