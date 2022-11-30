$content=@()
$content += Get-Content $args[0]

foreach($row in $content){
    $pieces = $row.split()
    Write-Host ($pieces[2] + " " + $pieces[1] + " " + $pieces[0])
}