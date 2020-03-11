<#

#>
$nbstatus = DATA 
{
  ConvertFrom-StringData -StringData @'
0 = EnableNetbiosViaDhcp
1 = EnableNetbios
2 = DisableNetbios
'@
}

Get-WmiObject -Class Win32_NetWorkAdapterConfiguration -Filter IPEnabled=TRUE |
Select-Object -Property Index, @{
  N = 'NetBIOSOption'
  E = {
    $nbstatus["$($_.TcpipNetbiosOptions)"] 
  }
}
$arrObjNetCard = Get-WmiObject -Class Win32_NetWorkAdapterConfiguration -Filter IPEnabled=TRUE | Select-Object -Property * <#Index,TcpipNetbiosOptions#>
foreach ($objNetCard in $arrObjNetCard ) {
    $objNetCard.SetTCPIPNetBIOS(1)
}
Get-WmiObject -Class Win32_NetWorkAdapterConfiguration -Filter IPEnabled=TRUE |
Select-Object -Property Index, @{
    N = 'NetBIOSOption'
    E = {
      $nbstatus["$($_.TcpipNetbiosOptions)"] 
    }
}
Get-WmiObject -Class Win32_NetWorkAdapterConfiguration -Filter IPEnabled=TRUE |
Set-WmiInstance -Arguments @{TcpipNetbiosOptions=1}


$Message = New-Object System.Net.Mail.MailMessage
$obj = New-Object System.Management
$obj = New-Object Microsoft.Management.Infrastructure


$NICInfo = Get-WMIObject -Class "Win32_NetworkAdapterConfiguration"-Filter "IPEnabled=TRUE"|Where-Object <#{ $_.description -match 'Intel' }#>
$NICInfo | ForEach-Object { $_.SetTCPIPNetBIOS(1)  }