$FILE=$args[0]
$PSDefaultParameterValues['*:Encoding'] = 'UTF8'

#Important scripts
# Print the MAIN MENU
function printHeader(){
    Clear-Host
    $now = Get-Date
    Write-Host "================================================="
    Write-Host "HOMEWORK 3 :: OPTION 1 "
    Write-Host "Student: MARTINS Alfredo | HEIOPO | $now"
    Write-Host "=================================================="
    Write-Host ":: WELCOME TO JOB QUERY SYSTEM ::"
    Write-Host "OPTIONS:"
        Write-Host "`t:: W - Workplaces where no violent acts have been reported ::"
        Write-Host "`t:: C - Total number of security guards ::"
        Write-Host "`t:: H - Workplaces with higher number of violent incidents ::"
        Write-Host "`t:: E - Exit::"
    
    askOption
}

function getWorkplacesNoViolentActs(){
    
    Write-Host ":: WORKPLACES WHERE NO VIOLENT ACTS HAVE BEEN REPORTED ::"
    $text = @()
    $text += Get-Content $FILE
    $result = ""
    [int]$id = 1
    foreach($line in $text){
        $array_string = @()
        $array_string += $line.split(",")

        if($array_string.Count -ne 4){
            Write-Output "??? $line ???"
            printInvalidDataMessage
        }

        [int]$number_of_violent_act = $array_string[2]

        #Write-Host $number_of_violent_act

        if($number_of_violent_act -eq 0){
            $result += ($id.ToString() + " => " + $array_string[0] + " `n")
            $id += 1
        }
    }

    if($result.Length -gt 0){
        Write-Host $result    
    } else{
        Write-Host "NONE"
    }

    closeOrNot
}

function getTotalNumberOfSecurity(){
    Write-Host ":: TOTAL NUMBER OF SECURITY ::"

    $text = @()
    $text += Get-Content $FILE
    [int] $total = [int] 0
    foreach($line in $text){
        $array_string = @()
        $array_string += $line.split(",")

        if($array_string.Count -ne 4){
            Write-Output "??? $line ???"
            printInvalidDataMessage
        }

        [int] $number_of_guards = $array_string[3]
        [int] $total += $number_of_guards
    }
    
    Write-Host ""
    Write-Host "Total number of security guards => " $total.ToString()
    Write-Host ""

    closeOrNot
}

function getHigherNumberOfViolentIncidents(){
    Write-Host ":: WORKPLACES WITH HIGHEST NUMBE OF VIOLENT INCIDENT (<NAME>, <ADDRESS>) ::"

    $text = @()
    $text += Get-Content $FILE
    [int] $maximum = [int] 0
    foreach($line in $text){
        $array_string = @()
        $array_string += $line.split(",")

        if($array_string.Count -ne 4){
            Write-Output "??? $line ???"
            printInvalidDataMessage
        }

        [int] $number_of_guards = $array_string[3]
        [int] $maximum =[math]::max($maximum, $number_of_guards)
    }
    
    Write-Host ""
    Write-Host "Highest number => " $maximum.ToString()
    Write-Host ""
    
    $text = @()
    $text += Get-Content $FILE
    $result = ""
    [int]$id = 1
    foreach($line in $text){
        $array_string = @()
        $array_string += $line.split(",")

        if($array_string.Count -ne 4){
            Write-Output "??? $line ???"
            printInvalidDataMessage
        }

        [int]$number_of_guards = $array_string[3]

        if($number_of_guards -eq $maximum){
            $result += ($id.ToString() + " => " + $array_string[0] + " `n")
            $id += 1
        }
    }

    Write-Host $result

    closeOrNot
}

function printInvalidDataMessage(){
    Write-Host "!!! ALERT !!!"
    Write-Host "==> Invalid data. Try again later! <=="
    dismiss
}

function dismiss(){
    Write-Host ""
    $now = Get-Date
    Write-Host "THANK YOU FOR USING MY SCRIPT :) $now"
    Write-Host "Copyright© ComSys ELTE 2022, Alfredo Martins (Student) & Dr. Bakonyi Viktória (Professor)"
    Exit
}

function closeOrNot(){
    [char]$OPTION = Read-Host "Would you like to close the program? Enter 'Y' to close"

    if($OPTION -eq 'Y' -or $OPTION -eq 'y'){
        dismiss
    } else{
        printHeader
    }
}


function printfInvalidOperation(){
    Write-Host "!!! ALERT !!!"
    Write-Host "==> Invalid operation <=="
}

function askOption(){

    [char]$OPTION = Read-Host "Enter the option"
    echo ""
    Clear-Host
    switch($OPTION){ 
        'W' {getWorkplacesNoViolentActs}
        'C' {getTotalNumberOfSecurity}
        'H' {getHigherNumberOfViolentIncidents} 
        'E' {dismiss}
        Default{ 
            printfInvalidOperation
            sleep 1
            printHeader
        }
    }
}

Write-Host "$FILE"

# The script execution starts here ...
#File if the file exist and if any parameter was given

if($args.Count -eq 0){
    Write-Host "Wait, you forgot to pass the parameter via terminal line. Please, do It next time. :)"
} else{
    if(Test-Path -Path $FILE){
       printHeader 
    } else{
        Write-Host "Sorry, the file was not found in the system. => $FILE!"
        dismiss 
    }
}