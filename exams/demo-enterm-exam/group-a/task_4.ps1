
if($args.Count -ne 2){
    Write-Host "Exactly two parameters were expected. Please enter correctly!"
} else{
    
    $FILE_NAME = $args[0]
    $DEFAULT_LENGTH = $args[1]
    
    if((Test-Path $FILE_NAME) -and ($DEFAULT_LENGTH -match '^[0-9]+$')){

        $file_content = @()
        $file_content += Get-Content $FILE_NAME
        $result = @()
        [int] $counter = 1
        foreach($line in $file_content){
            #Write-Host $line
            if($line -match "[0-9]$"){
                Write-Host "Invalid name while processing."
                Exit
            } else{
                if(($line | Measure-Object -Character -Word).Words -gt $DEFAULT_LENGTH){
                    $array_string = @()
                    $array_string += $line.split(" ")
                    [string] $result += [string] ($counter.ToString() + " -> " + $array_string[0] + "`n")
                    $counter += 1
                }
            }
        }

        Write-Host $result

    } else{
        Write-Host "File not found/Invalid default length."
    }
}