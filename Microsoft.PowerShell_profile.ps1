function Rename {
    <#
    .SYNOPSIS
    Renames a file to your choice of name.
    #>

    Rename-Item $args[0] $args[1]
}


function Count {
    <#
    .SYNOPSIS
    Counts number of items in the active directory.
    #>
    $items = Get-ChildItem -Path . | Measure-Object
    Write-Output "$($items.Count) items in the current directory."
}

function RandomFile{
    <#
    .SYNOPSIS
    Serves a random file from the working directory.
    #>

    [CmdletBinding()]
    param(
        [switch]$WhatIf,
        [switch]$Verbose
    )
    $file = Get-Random(Get-Childitem)
    Write-Verbose "Selected file: $file"
    $validInput = $false
    do{
        $choice = Read-Host -Prompt "Do you want to open the file (y/n)"
        switch($choice){
            y {if(Test-Path $file){start "$file" -WhatIf:$WhatIf; $validInput = $true}}
            n {$validInput = $true; Write-Output "$file"}
            default {Write-Output "Invalid choice. Please try again.`n"}
        }
    }while(-not $validInput)
}

function UwU {
    <#
    .SYNOPSIS
    Changes the current working directory to the specified directory, opens a random file in that directory, or opens the directory in File Explorer.

    .DESCRIPTION
    The uwu func is used to quickly navigate to a directory, open a random file in that directory, or open the directory in File Explorer. When the func is called with the parameter "t", it changes the current working directory to "D:\Projects\python projects\sxoxgxi\うらぎり". When the func is called with the parameter "r", it changes the current working directory to "D:\Projects\python projects\sxoxgxi\うらぎり" and opens a random file in that directory. When the func is called with any other parameter, it opens "D:\Projects\python projects\sxoxgxi\うらぎり" in File Explorer.

    .PARAMETER query
    Specifies the action to perform. Valid values are "t", "r", or any other string.

    .EXAMPLE
    uwu -query "t"
    Changes the current working directory to "D:\Projects\python projects\sxoxgxi\うらぎり".

    .EXAMPLE
    uwu -query "r"
    Changes the current working directory to "D:\Projects\python projects\sxoxgxi\うらぎり" and opens a random file in that directory.

    .EXAMPLE
    uwu -query "foo"
    Opens "D:\Projects\python projects\sxoxgxi\うらぎり" in File Explorer.

    #>
    [CmdletBinding()]
    param(
        [string]$query
    )
    
    switch ($query) {
        "t" {
            Set-Location "D:\Projects\python projects\sxoxgxi\うらぎり"
        }
        "r" {
            Set-Location "D:\Projects\python projects\sxoxgxi\うらぎり"
            $file = Get-Random(Get-ChildItem)
            Start "$file"
        }
        default {
            ii "D:\Projects\python projects\sxoxgxi\うらぎり"
        }
    }
}


function CleanUp {
    <#
    .SYNOPSIS
    Runs a script to clean and manage downloads folder.
    #>

    start "C:\Users\sxoxgxi\Downloads\Executables\clean.bat"
}

Function Touch {
    <#
    .SYNOPSIS
    Creates a new file in the current directory.
    
    .DESCRIPTION
    This func creates a new file in the current directory with the specified name.
    
    .PARAMETER Name
    The name of the new file.
    
    .EXAMPLE
    PS C:\> touch "test.txt"
    
    This example creates a new file called "test.txt" in the current directory.
    #>
    
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory=$True, Position=0)]
        [ValidateNotNullOrEmpty()]
        [String]$Name
    )
    
    New-Item -ItemType File -Name $Name
}


function RandomPass {
    <#
    .SYNOPSIS
    Generates a random password consisting of alphanumeric characters and also copies it in your clipboard.
    #>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$false)]
        [int]$length = 12
    )
    $password = -join(48..57+65..90+97..122|ForEach-Object{[char]$_}|Get-Random -C $length)
    $password | clip;
    
    Write-Output "Your new password is: $password. It has been copied to the clipboard.";
}


function e {
    <#
    .SYNOPSIS
        Opens File Explorer with the current directory.
    #>

    ii . 
}

function Lime ($file) {
    <#
    .SYNOPSIS
    Opens a file in Sublime Text editor.

    .DESCRIPTION
    This command opens a file in Sublime Text editor. The first argument should be the path of the file you want to open.

    .PARAMETER file
    The path of the file to open in Sublime Text editor.

    .EXAMPLE
    lime "C:\Users\sxoxgxi\sxripts\uwu.py"
    This example opens "uwu.py" file in Sublime Text editor.
    #>

    Start "C:\Program Files\Sublime Text\subl.exe" $file
}

Function SpeedTest {
    <#
    .SYNOPSIS
        Starts the SpeedTest CLI application.
    #>

    Start "D:\speedtest.exe"
}



function ServeFile {
    <#
    .SYNOPSIS
    File serving server.
    #>

    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [string]$FilePath
    )

    if (!(Get-Command python -ErrorAction SilentlyContinue)) {
        Write-Host "Python is not installed on this system. Please install Python and try again."
        return
    }

    # Start Python server in the background
    $serverProcess = Start-Process python -ArgumentList "-m http.server 8000" -PassThru
    Start-Sleep -Seconds 2
    $url = "http://localhost:8000/$FilePath"
    Start-Process $url
}


function WhichMachine {
    <#
    .SYNOPSIS
    Funky command.
    #>

    if ($IsLinux) {
        return "Linux";
    };

    if ($IsOSX) {
        return "macOS";
    }

    return "Windows";
}

function Df {
    <#
    .SYNOPSIS
    Just a alias.
    #>

	get-volume
}

function Env {
    <#
    .SYNOPSIS
    Activates the python environment.
    #>

    env/scripts/activate
}

function Which($name) {
    <#
    .SYNOPSIS
    Imitation of linux command "Which"
    #>

	Get-Command $name | Select-Object -ExpandProperty Definition
}

function ReloadProfile {
    <#
    .SYNOPSIS
    Was made to reload the profile but did not work as expected.
    #>

    . $PROFILE
}

# function Test {
#     $consoleWidth = $Host.UI.RawUI.WindowSize.Width
#     $text = "Hello world"
#     $padding = [Math]::Max(0, ($consoleWidth - $text.Length) / 2)
#     $position = [Math]::Max(0, $padding)
#     Write-Host (' ' * $position + $text) -ForegroundColor Blue -BackgroundColor Black

# }

function FindFile($name) {
    <#
    .SYNOPSIS
    Aids in finding the a specific file.
    #>
    if ($name -ne $null){
        get-childitem -recurse -filter "*${name}*" -ErrorAction SilentlyContinue | foreach-object {
            write-output($PSItem.FullName)

    }}
    else{
        Write-Output "Please provide a file name."
    }
}


function DriveStatus {
    <#
    .SYNOPSIS
    Checks the disk status and returns the status of the drive.
    #>

    $computer = $env:COMPUTERNAME
    $drive = Read-Host -Prompt "Which drive status to display?"
    $threshold = 20 # Percentage of free space

    $psdrive = Get-PSDrive $drive
    if ($psdrive -and $psdrive.Provider.Name -eq 'FileSystem' -and $psdrive.Root -ne $null) {
        $freeSpace = [math]::Round($psdrive.Free/1GB)
        $totalSpace = [math]::Round($psdrive.Used/1GB + $psdrive.Free/1GB)
        $percentFree = [math]::Round(($freeSpace/$totalSpace)*100)

        if ($percentFree -lt $threshold) {
            $title = "Low Disk Space Alert on $computer"
            $message = "The free space on drive $drive is less than $threshold%. Current free space: $freeSpace GB"
            Write-Output "$title`n$message"
        } else {
            $title = "Disk Space Status on $computer"
            $message = "The free space on drive $drive is currently at $percentFree%. Current free space: $freeSpace GB"
            Write-Output "$title`n$message"

        }
    } else {
        Write-Output "Drive $drive is not available or not a file system drive."
    }
}

function AvailableCommands {
    <#
    .SYNOPSIS
    SHows all the commands available to be executed in powershell terminal.
    #>

    $fileContent = Get-Content -Path "C:\Users\sxoxgxi\OneDrive\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" -Raw
    $functionNames = [regex]::Matches($fileContent, '\bfunction\s+(\w+)') | ForEach-Object { $_.Groups[1].Value }
    Write-Host "Available commands are:"
    foreach ($func in $functionNames) {
    $i++
    Write-Host "$i. -> $func"
    
    }
}

function GuessNumber{
    <#
    .SYNOPSIS
    Imports the module  and initialize the game.
    #>

    D:\Projects\scripts\guessnumbergame.ps1
}


function Get-RandomCategory {
    <#
    .SYNOPSIS
    Func returns a array of randomly selected category for the QuizMe gaem.
    #>

    $categories = @(
        @{ id = 9; name = "General Knowledge" },
        @{ id = 10; name = "Entertainment: Books" },
        @{ id = 11; name = "Entertainment: Film" },
        @{ id = 12; name = "Entertainment: Music" },
        @{ id = 13; name = "Entertainment: Musicals & Theatres" },
        @{ id = 14; name = "Entertainment: Television" },
        @{ id = 15; name = "Entertainment: Video Games" },
        @{ id = 16; name = "Entertainment: Board Games" },
        @{ id = 17; name = "Science & Nature" },
        @{ id = 18; name = "Science: Computers" },
        @{ id = 19; name = "Science: Mathematics" },
        @{ id = 20; name = "Mythology" },
        @{ id = 21; name = "Sports" },
        @{ id = 22; name = "Geography" },
        @{ id = 23; name = "History" },
        @{ id = 24; name = "Politics" },
        @{ id = 25; name = "Art" },
        @{ id = 26; name = "Celebrities" },
        @{ id = 27; name = "Animals" },
        @{ id = 28; name = "Vehicles" },
        @{ id = 29; name = "Entertainment: Comics" },
        @{ id = 30; name = "Science: Gadgets" },
        @{ id = 31; name = "Entertainment: Japanese Anime & Manga" },
        @{ id = 32; name = "Entertainment: Cartoon & Animations" }
    )

    $randomCategory = $categories | Get-Random
    return @{
        id = $randomCategory.id
        name = $randomCategory.name
    }
}


function QuizMe{
    <#
    .SYNOPSIS
    A terminal Quiz game with actual questions.
    #>

    $category = Get-RandomCategory
    $url = "https://opentdb.com/api.php?amount=5&category=$($category.id)&type=multiple"
    
    $headers = @{
        "Content-Type" = "application/json"
    }

    $response = Invoke-RestMethod -Uri $url -Method GET -Headers $headers
    $quiz = foreach ($q in $response.results) {
        $answers = $q.incorrect_answers + $q.correct_answer
        $answers = $answers | Get-Random -Count $answers.Count
        @{
            Question = $q.question
            Answers = $answers
            CorrectAnswer = $q.correct_answer
        }
    }

    $score = 0
    foreach ($q in $quiz) {
        CLear-Host
        Write-Host "Selected category: $($category.name) (ID: $($category.id))"
        Write-Host $q.Question
        $options = 'A', 'B', 'C', 'D'
        for ($i = 0; $i -lt $q.Answers.Count; $i++) {
            Write-Host "$($options[$i]). $($q.Answers[$i])"
        }
        $answer = Read-Host "Your answer (A, B, C, or D)"
        $countdown = 5
        if ($answer.ToLower() -eq ($options[[array]::IndexOf($q.Answers, $q.CorrectAnswer)]).ToLower()) {
            Write-Host "Correct!" -ForegroundColor Green
            $score++
            # Start-Sleep -Seconds 2
            while ($countdown -ge 0) {
                Write-Host -NoNewline "Next question in: $countdown seconds`r"
                Start-Sleep -Seconds 1
                $countdown--
            }
        } else {
            Write-Host "Incorrect. The correct answer is $($q.CorrectAnswer)." -ForegroundColor Red
            while ($countdown -ge 0) {
                Write-Host -NoNewline "Next question in: $countdown seconds`r"
                Start-Sleep -Seconds 1
                $countdown--
            }
            # Start-Sleep -Seconds 2

        }
        
    }
    Write-Host "`nYou scored $($score) out of $($quiz.Count)." -ForegroundColor Cyan
}
