$OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

#Imports
if ($host.Name -eq 'ConsoleHost'){
  Import-Module PSReadLine
}
Import-Module -Name Terminal-Icons
Import-Module -Name PSFzf


#history prediction
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

#oh-my-posh configs
oh-my-posh init pwsh --config 'C:\Users\barte\.config\oh-my-posh\jarsey45.omp.json'| Invoke-Expression

#Aliases
Set-Alias ll ls
Set-Alias g git
Set-Alias vi nvim
Set-Alias grep findstr
Set-Alias dh Get-FolderSize

#posh-git import after Aliases
Import-Module posh-git

#Functions
function which($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
        Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function sizeof($path) {
  $mb = [math]::Round(((Get-ChildItem $path -Recurse | Measure-Object -Property Length -Sum -ErrorAction Stop).Sum / 1MB),3)
  "{0} MB" -f $mb
}

function sudo($app = "wt") { Start-Process $app -Verb runAs }

function tail($Path, $Num = 10) {
  cat $Path -Tail $Num
}

function head($Path, $Num = 10) {
  cat $Path -Head $Num
}

function sha256sum($Path) {
  Get-FileHash $Path -Algorithm SHA256
}

function pipecmd {
    param([Parameter(ValueFromRemainingArguments=$true)][String[]]$params)
    foreach($s in $params){
      $string += "$s "
    }
    cmd.exe /c $string
}

function rex {
    taskkill /f /im explorer.exe
    start explorer.exe
}
