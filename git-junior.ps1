param ( [string]$projectName )
DO
{
$date = Get-Date
$filePrefix = $date.Month.ToString() + "-" + $date.Day.ToString() + "--"
$fileSuffixNum = 1
$folder = $filePrefix + $fileSuffixNum.ToString()
while(Test-Path .\$projectName\$folder)
{$fileSuffixNum++;$folder = $filePrefix + $fileSuffixNum.ToString();}
md .\$projectName\$folder
$pullFolder = ".\$projectName\$folder\Pull"
$pushFolder = ".\$projectName\$folder\Push"
md $pullFolder
md $pushFolder
DO {
    $continueChoice = Read-Host 'Type m or M to add another working folder or X or x to exit'
} Until ($continueChoice.StartsWith("m") -or $continueChoice.StartsWith("M") -or $continueChoice.StartsWith("x") -or $continueChoice.StartsWith("X"))
} Until ($continueChoice.StartsWith("x") -or $continueChoice.StartsWith("X"))
