
function Install-Choco() {
    try {
        & choco config get cacheLocation
    } catch {
        Write-Output "Chocolatey not detected, trying to install now"
        [System.Net.ServicePointManager]::SecurityProtocol = 3072
        Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    }
}
function Install-ChocoPackage() 
{
    param(
        [hashtable] $package
    )

    $cmd = 'choco install ' + $package.Name + ' --yes --accept-license --no-progress'
    
    if ($package.IgnoreCheckSum -eq $true) {
        $cmd += ' --ignore-checksums'
    }

    if ($package.ContainsKey('Version')) {
        $cmd += ' --version ' + $package.Version;
    }

    if ($package.ContainsKey('Params')) {
        $cmd += ' --params "' + $package.Params + '"'
    }
    Write-Host $cmd
    Invoke-Expression $cmd | Write-Host
}
function Install-VSCodeExtension() {
    param(
        [string] $ext
    )
    & code --install-extension "$ext"
}