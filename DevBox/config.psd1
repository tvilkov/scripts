@{
    ChocoPackages = @(
    # DEV tools
    @{ Name = 'git'; Version = '2.32.0'; Params = '/NoAutoCrlf /NoShellIntegration /GitAndUnixToolsOnPath' },
    @{ Name = 'smartgit'; Version = '20.2.3' },
    @{ Name = 'notepadplusplus'; Version = '7.9.5' },
    @{ Name = 'linqpad5'; Version = '5.43.0' },
    @{ Name = 'vscode'; Version = '1.57.0'; Params = '/NoQuicklaunchIcon' },
    @{ Name = 'fiddler' },
    @{ Name = 'soapui'; Version = '5.5.0'; Params = '/NoQuicklaunchIcon' },
    @{ Name = 'sysinternals'; Version = '2021.5.26'; IgnoreCheckSum = $true }
    @{ Name = 'nodejs'; Version = '16.3.0' },
  
    # Misc
    @{ Name = 'googlechrome'; Version = '91.0.4472.106' },
    # @{ Name = 'brave'; Version = '1.26.63'; },
    @{ Name = 'totalcommander'; Version = '3.4.0'; Params = '/DesktopIcon' },  
    @{ Name = 'far'; Version = '3.0.5800'; Params = '/DesktopIcon' },  
    @{ Name = 'foxitreader'; Params = '/LANG=en' },  
    @{ Name = 'monosnap'; Version = '4.1.16' },
    @{ Name = 'mobaxterm'; Verion = '21.1.0' },
    @{ Name = 'keepass'; Version = '2.48.1' },
    @{ Name = 'telegram'; },
    
    # Heavy stuff (may require reboot)
    @{ Name = 'docker-desktop'; Version = '3.4.0' }
    );
    GitConfig = @{
        UserName = "Timur Vilkov"
        Email = "vilkov.timur@gmail.com"
    };
    VSCodeExtensions = "ms-vscode.powershell", "ms-azuretools.vscode-docker", "ms-dotnettools.csharp", 
        "ms-mssql.mssql", "dunn.redis";
}