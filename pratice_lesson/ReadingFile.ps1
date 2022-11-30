param([string]$FILE_NAME)

$file_content = Get-Content $FILE_NAME
$index = 1
foreach($row in $file_content){
    if($index % 2 -eq 0){
        Write-Output $row >> even.txt
    } else{
        Write-Output $row >> odd.txt
    } $index++
}