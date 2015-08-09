param ( [string]$projectPath )
$ErrorActionPreference= 'silentlycontinue'
# repeat this process until the user decides to exit at the prompt
$case = "CurrentCultureIgnoreCase"
$continueChoice = "m"
DO {
    if($continueChoice.StartsWith("m",$case)) {# create a new folder
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
    } elseif($continueChoice.StartsWith("c",$case)) {# copy contents of last folder's pull into the push folder
        Copy-Item $pullFolder\* $pushFolder -Recurse
    }
    DO {
        $continueChoice = Read-Host 'Type m to add another working folder, c to copy pull contents to push folder, or x to exit'
    } Until ($continueChoice.StartsWith("m",$case) -or $continueChoice.StartsWith("x",$case) -or $continueChoice.StartsWith("c",$case))
} Until ($continueChoice.StartsWith("x",$case))
