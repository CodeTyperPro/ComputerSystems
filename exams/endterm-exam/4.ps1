
if($args.Count -ne 2){
    Write-Host "Exactly two parameters were expected. Please enter correctly!"
} else{
    
    $FILE_NAME = $args[0]
    $DEFAULT_LENGTH = $args[1]
    
    if((Test-Path $FILE_NAME) -and ($DEFAULT_LENGTH -match '^[0-9]+$')){

        $file_content = @()
        $file_content += Get-Content $FILE_NAME

        foreach($line in $file_content){
            [int]$lenght = ($line | Measure-Object -Line -Word).Words

            if($lenght -gt ([int] $DEFAULT_LENGTH)){
                Write-Host $line "=>" $line 
            } else{
                 Write-Host $line "=> -"  
            }
        }

    } else{
        Write-Host "File not found/Invalid default length."
    }
}