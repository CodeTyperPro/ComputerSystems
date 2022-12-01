$FILE=$args[0]

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
    $text = Get-Content $FILE
    $result = ""
    foreach($line in $text){
        $array_string = @()
        $array_string += $line.split(",")
        Write-Host "Length = " + $array_string.Lenght # To be fixed.

        if($array_string.Lenght -ne 4){
            Write-Host "??? $line ???"
            printInvalidDataMessage
        }

        $number_of_violent_act = $array_string[2]

        if($number_of_violent_act -eq 0){
            $result += $array_string[0] + " `n"
        }
    }

    Write-Host $result

    closeOrNot
}

function getTotalNumberOfSecurity(){
    Write-Host ":: TOTAL NUMBER OF SECURITY ::"

    closeOrNot
}

function getHigherNumberOfViolentIncidents(){
    Write-Host ":: WORKPLACES WITH HIGHEST NUMBE OF VIOLENT INCIDENT (<NAME>, <ADDRESS>) ::"

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
    Write-Host "Copyright© ComSys ELTE 2022, Alfredo Martins (Student) & Dr. Bakonyi Viktória (Teacher)"
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