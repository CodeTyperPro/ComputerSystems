
if($args.Count -ne 1){
    Write-Host "Exactly one parameters was expected. Please enter correctly!"
} else{
    
    $FILE_NAME = $args[0]
    
    if((Test-Path $FILE_NAME)){

        $file_content = @()
        $file_content += Get-Content $FILE_NAME
        [int] $sum = 0
        foreach($line in $file_content){

            if($line -match "^[0-9]+$"){
                [int] $x = $line
                if($x % 2 -eq 0){
                    $sum += $x
                }
            } 
        }

        Write-Host "SUM =" $sum.ToString()

    } else{
        Write-Host "File not found."
    }
}