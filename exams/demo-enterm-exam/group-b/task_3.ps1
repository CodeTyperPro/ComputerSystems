if($args.Count -ne 1){
    Write-Host "Exactly one parameter was expected. Please enter correctly!"
} else{
    
    $FILE_NAME = $args[0]
   
    if(Test-Path $FILE_NAME){

        $file_content = @()
        $file_content += Get-Content $FILE_NAME

        [int] $count_words = [int] 0
        [int] $sum_lengths = [int] 0

        foreach($line in $file_content){
            [int] $sum_lengths += ($file_content | Measure-Object -Character -IgnoreWhiteSpace).Characters
            [int] $count_words += ($file_content | Measure-Object -Word -IgnoreWhiteSpace).Words
        }

        [double] $average = [double] ($sum_lengths / $count_words)
        $answer = [string] ("Average = " + $average.ToString())

        Write-Host $answer
    } else{
        Write-Host "File not found."
    }
}