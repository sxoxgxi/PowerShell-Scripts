$UserDataFile = "$HOME/guessNumberScores.json"
$MinNumber = 1
$MaxNumber = 100
$MaxGuesses = 5

function Get-RandomNumber {
    return Get-Random -Minimum $MinNumber -Maximum $MaxNumber
}


function Get-Scores {
    if (-not (Test-Path -Path "$HOME/guessNumberScores.json")) {
        Write-Error "File not found: "$HOME/guessNumberScores.json""
        return
    }

    $scores = Get-Content -Path "$HOME/guessNumberScores.json" | ConvertFrom-Json

    $scores | Sort-Object -Property Score -Descending | Format-Table -AutoSize
}

function Play-Round {
    $NumberToGuess = Get-RandomNumber
    Write-Host 'I am thinking of a number between' $MinNumber 'and' $MaxNumber '.'
    $GuessCount = 0
    while ($GuessCount -lt $MaxGuesses) {
        $Guess = Read-Host 'What is your guess?'
        if ($Guess -match '^\d+$') {
            $Guess = [int]$Guess
            if ($Guess -lt $NumberToGuess) {
                Write-Host 'Aim higher. 😊'
            }
            elseif ($Guess -gt $NumberToGuess) {
                Write-Host 'Aim lower. 😊'
            }
            else {
                Write-Host 'Correct! 🍀'
                return ($MaxGuesses - $GuessCount)*3
            }
            $GuessCount++
        }
        else {
            Write-Host 'Invalid input. Please enter a number. ❌'
        }
    }
    Write-Host `n'Sorry, you did not guess the number. It was' $NumberToGuess '. 😩'
    return 0
}

function Update-Score {
    param([string]$Username, [int]$Score)
    $UserData = Get-Content $UserDataFile -Raw | ConvertFrom-Json
    if ($UserData.$Username) {
        if ($Score -gt $UserData.$Username) {
            $UserData.$Username = $Score
            Write-Host 'Congratulations, you beat your high score! 🥳' -ForegroundColor Green -BackgroundColor Black
        }
        else {
            Write-Host 'Your score is not higher than your high score. 😞' -ForegroundColor Red -BackgroundColor Black
        }
    }
    else {
        $UserData | Add-Member -MemberType NoteProperty -Name $Username -Value $Score
        Write-Host ('' * $position + "I have saved your score.😊") -ForegroundColor Red -BackgroundColor Black
    }
    $UserData | ConvertTo-Json | Set-Content $UserDataFile
}

# Start the game
Clear-Host
$consoleWidth = $Host.UI.RawUI.WindowSize.Width
$text = "Welcome to the Guess the Number game!`n"
$padding = [Math]::Max(0, ($consoleWidth - $text.Length) / 2)
$position = [Math]::Max(0, $padding)
Write-Host (' ' * $position + $text) -ForegroundColor Red -BackgroundColor Black
$Username = Read-Host "What is your name?"
$PseudoUserData = Get-Content $UserDataFile -Raw | ConvertFrom-Json
Clear-Host
if ($PseudoUserData.$Username){
    Write-Host (' ' * $position + "Welcome back $Username! 😍") -ForegroundColor Green -BackgroundColor Black
}
else {
    Write-Host (' ' * $position + "Welcome $Username! 😀") -ForegroundColor Green -BackgroundColor Black
}
$Score = Play-Round
Write-Host `n'Your score is' $Score
Write-Host (' ' * $position + "Following are top scores by the players:")
Get-Scores
Update-Score $Username $Score
# Get-Scores

