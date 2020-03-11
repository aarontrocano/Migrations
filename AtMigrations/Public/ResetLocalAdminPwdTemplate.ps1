


<#--PowerShell V1.0--#>$localadmin = Get-WmiObject -Class Win32_UserAccount -Filter 'LocalAccount=True And Sid like "%-500"'
<#--PowerShell V1.0--#>([adsi]('WinNT://'+$localadmin.Caption.Replace('\','/'))).SetPassword("**explicit-cleartext**")

<#--PowerShell V1.0--#>$SecureStrPassword = Read-Host -Prompt $([string]::Format("Enter a password for {0}", $($localadmin.name))) -AsSecureString
<#--PowerShell V5.1--#>Set-LocalUser -Identity $user -Reset -NewPassword (ConvertTo-SecureString -AsPlainText "$newPass" -Force)
