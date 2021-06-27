. "./library.ps1"

try {
    Write-Host "Configuring execution policy..."
    Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process -WarningAction Ignore -ErrorAction Ignore 
}
catch {
}

$config = Import-PowerShellDataFile -Path "$PSScriptRoot\config.psd1"

# Detect/install choco
Write-Host "Installing choco..."
Install-Choco

# Install choco packages
Write-Host "Intalling choco packages..."
$config.ChocoPackages | ForEach-Object { Install-ChocoPackage $_ }
choco list --local-only
refreshenv

# Intall VSCode extensions
Write-Host "Installing VSCode extensions..."
$config.VSCodeExtensions | ForEach-Object { Install-VSCodeExtension $_ }

# Configure git
Write-Host "Configuring git..."
$gitConfig = $config.GitConfig
git config --global user.name $gitConfig.UserName
git config --global user.email $gitConfig.Email
git config --global core.autocrlf false
git config --global core.longpaths true
git config --global pull.rebase true
git config --global alias.st "status"
git config --global alias.co "checkout"
git config --global alias.cob "checkout -b"
git config --global alias.pu "!git pull --rebase --prune $@ && git submodule update --init --recursive"
git config --global alias.pua "!git pull --all --rebase --prune $@ && git submodule update --init --recursive"
git config --global alias.cm "!git add -A && git commit -m"
git config --global alias.lg1 "log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
git config --global alias.lg2 "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n'' %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
git config --global alias.lg3 "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global alias.lg "!git lg1"