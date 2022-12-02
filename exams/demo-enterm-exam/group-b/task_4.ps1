if($args.Count -ne 2){
    Write-Host "Exactly two parameter were expected. Please enter correctly!"
} else{
    
    $FILE_NAME = $args[0]
    [string] $DEFAULT_LAST_NAME = [string] $args[1]
    $OUTPUT_FILE = "output_file.txt"
   
    if(Test-Path $FILE_NAME -and ($DEFAULT_LAST_NAME.Trim().Length -gt 0)){

        $file_content = @()
        $file_content += Get-Content $FILE_NAME

        foreach($line in $file_content){
            $array_string = @()
            $array_string += $line.split(" ")
            if($array_string.Count -ne 2){
                Write-Host "Error detected while processing data."
            } else{
                $text = $array_string[1] + " " + $DEFAULT_LAST_NAME
                Write-Output $text >> $OUTPUT_FILE
            }
        }
    } else{
        Write-Host "File not found/Invalid name!"
    }
}