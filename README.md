# PowerShell Utility Functions

This repository contains a set of PowerShell functions that can be used to make common tasks easier.

### Rename

`Rename` is a simple function that renames a file to your choice of name. It takes two arguments: the file to be renamed and the new name of the file.

### Count

`Count` is a function that allows you to count the number of files in the active directory.

### Size

`Size` is a function that shows the total size taken by the active directory.

### CheckInternet

`CheckInternet` checks for internet connectivity by pinging "www.google.com" and plays a Spotify track if an internet connection is detected.

### RandomFile

`RandomFile` serves a random file from the working directory. This function is particularly useful when you want to take a break from work and do something random. When run, it selects a random file from the current directory and prompts you to either open the file or return the name of the file.

### UwU

`UwU` is used to quickly navigate to a directory, open a random file in that directory, or open the directory in File Explorer. It has three possible parameters:

- t: changes the current working directory to "D:\Projects\python projects\sxoxgxi\うらぎり"
- r: changes the current working directory to "D:\Projects\python projects\sxoxgxi\うらぎり" and opens a random file in that directory
- any other parameter: opens "D:\Projects\python projects\sxoxgxi\うらぎり" in File Explorer

### CleanUp

`CleanUp` runs a script to clean and manage the Downloads folder. When run, it opens a batch file that performs various cleanup operations on the Downloads folder.

### Touch

`Touch` creates a new file in the current directory with the specified name. When run, it creates a new file with the name specified by the user.

### RandomPass

`RandomPass` generates a random password consisting of alphanumeric characters and copies it to the clipboard. The length of the password can be specified by the user.

### e

`e` opens File Explorer with the current directory as its location. When run, it opens a new File Explorer window with the current directory as its location.

### Lime

`Lime` opens a file in Sublime Text editor. The first argument should be the path of the file to be opened in Sublime Text editor.

### SpeedTest

`SpeedTest` opens the speed test commandline program to check the internet connection speed.

### ServeFile

`ServeFile` opens a local server to serve files in a browser.

### WhichMachie

If you don't know xD `WhichMachine` tells whether your machine is a windos, mac or linux.

### Df

`Df` is an alias for the Get-Volume command.

### Env

`Env` activates the Python environment.

### Which

`Which` is an imitation of the Linux command which, which returns the path of the command that would be executed.

### ReloadProfile

`ReloadProfile` was made to reload the profile but did not work as expected.

### FindFile

`FindFile` aids in finding a specific file by recursively searching for a file matching the given name.

### DriveStatus

`DriveStatus` checks the disk status and returns the status of the drive.

### AvailableCommands

`AvailableCommands` shows all the commands available to be executed in the PowerShell terminal.

### GuessNumber

`GuessNumber` Imports the module from `guessnumbergame.ps1` and initializes the game. It has a score and login feature.

### Get-RandomCategory

`Get-RandomCategory`is a helper function for `QuizMe` game. It returns an array of randomly selected categories for the `QuizMe` game.

### QuizMe

`QuizMe` is a terminal-based quiz game that uses the Open Trivia Database API to fetch actual questions and presents them with randomized answer choices.

## Installation

To use these functions, you can simply copy and paste them into your PowerShell profile. You can locate your PowerShell profile by typing `$PROFILE` in a PowerShell prompt.

Alternatively, you can clone this repository and import the functions using the Import-Module cmdlet.

## Usage

Once you have installed the functions, you can use them in your PowerShell session. To see the available functions, type `Get-Command -Module <ModuleName>` in the PowerShell prompt, where `<ModuleName>` is the name of the module containing the functions.

## Contributing

Feel free to use, modify, or contribute to this repository!
