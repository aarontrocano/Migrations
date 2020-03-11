<#

#>
$arrRegKey = @("HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion","HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion")
$RegValueOwner = 'RegisteredOwner'
$RegValueOrg = 'RegisteredOrganization'
$Reg_sz_NewOwner = 'User'
$Reg_sz_NewOrg = ''

foreach ($RegKey in $arrRegKey) {
	Set-ItemProperty -Path $RegKey -name $RegValueOwner -value $Reg_sz_NewOwner
	Set-ItemProperty -Path $RegKey -name $RegValueOrg -value $Reg_sz_NewOrg
}