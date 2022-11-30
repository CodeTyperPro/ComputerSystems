param([string]$FILE_NAME)

if(Test-Path $FILE_NAME){
    if(Test-Path even.txt){
        Remove-Item even.txt
    }

    if(Test-Path odd.txt){
        Remove-Item odd.txt
    }

    $file_content = Get-Content $FILE_NAME
    $index = 1
    foreach($row in $file_content){
        if($index % 2 -eq 0){
            Write-Output $row >> even.txt
        } else{
            Write-Output $row >> odd.txt
        } $index++
    }

} else{
    Write-Host "File not found."
}