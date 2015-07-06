param ( [string]$projectPath )
# repeat this process until the user decides to exit at the prompt
DO {
    # get the date part of the folder name
    $date = Get-Date
    $filePrefix = $date.Month.ToString() + "-" + $date.Day.ToString() + "--"
    $fileSuffixNum = 1
    $folder = $filePrefix + $fileSuffixNum.ToString()
    # get the numerical part of the folder name
    while(Test-Path $projectPath\$folder) {
        $fileSuffixNum++;$folder = $filePrefix + $fileSuffixNum.ToString();
    }
    # create the folders
    $dateFolder = "$projectPath\$folder"
    md $dateFolder
    $pullFolder = "$dateFolder\Pull"
    $pushFolder = "$dateFolder\Push"
    md $pullFolder
    md $pushFolder
    # prompt user until a valid option is chosen.
    DO {
        $continueChoice = Read-Host 'Type m or M to add another working folder or X or x to exit'
    } Until ($continueChoice.StartsWith("m") -or $continueChoice.StartsWith("M") -or $continueChoice.StartsWith("x") -or $continueChoice.StartsWith("X"))
} Until ($continueChoice.StartsWith("x") -or $continueChoice.StartsWith("X"))
