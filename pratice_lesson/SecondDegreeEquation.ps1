[double] $a_value = Read-Host "Enter first number"
[double] $b_value = Read-Host "Enter second number"
[double] $c_value = Read-Host "Enter third number"

if($a_value -eq 0){
    Write-Host "Invalid input!"
} else {
    $delta = $b_value*$b_value - 4*$a_value*$c_value
    
    if($delta -lt 0){
        Write-Host "No solution."
    } else {
        if($delta -eq 0){
            $unique_solution = -$b_value/4*$a_value 
            Write-Host "Result = $unique_solution"
        } else{
            $delta = [math]::sqrt($delta)
            $x1 = (-$b_value+$delta)/(2*$a_value)
            $x2 = (-$b_value-$delta)/(2*$a_value)

            Write-Host "x1 = $x1"
            Write-Host "x2 = $x2"
        }
    }
}