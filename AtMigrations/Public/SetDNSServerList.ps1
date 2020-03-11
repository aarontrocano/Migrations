<#

#>
$DNSServers = '8.8.8.8','208.67.222.222','208.67.220.220'
$NICInfo = Get-WMIObject <#-ComputerName $s#> -Class "Win32_NetworkAdapterConfiguration" -Filter "IPEnabled=TRUE" | Where-Object { $null -ne $_.defaultipgateway -and $_.DHCPEnabled -ne'True' -and $_.DNSServerSearchOrder -ne $null }
$NICInfo | ForEach-Object { $_.SetDNSServerSearchOrder($DNSServers ) } | Out-Null