<#

https://docs.microsoft.com/en-us/powershell/module/webadminstration/stop-webapppool?view=winserver2012-ps
#>
import-module WebAdministration
Stop-WebAppPool -Name ""
Get-ChildItem IIS:\AppPools 
Get-ChildItem IIS:\Sites

$DontStopTheseAppPoolList = '.NET v','Classic','DefaultAppPool','.EXAMPLE'
$regexPatternDontStopTheseAppPoolList = @($DontStopTheseAppPoolList | ForEach-Object {[regex]::Escape($_)}) -join '|'
Get-ChildItem IIS:\AppPools | Where-Object {$_.Name -notmatch $regexPatternDontStopTheseAppPoolList }  | Sort-Object -Property Name

$OGAppPools = Get-ChildItem IIS:\AppPools | Where-Object {$_.Name -notmatch $regexPatternDontStopTheseAppPoolList }  | Sort-Object -Property Name

foreach ($AP in $AppPools ) {
    $msg = [string]$( $AP.Name )
    Write-Verbose -Message $msg -Verbose
}


$StoppedSitesDontTouchThese = 'stopped01.example.com',
'stopped02.example.com',
'stopped03.example.com'
$regexPatternStoppedSitesDontTouchThese = @($StoppedSitesDontTouchThese | ForEach-Object {[regex]::Escape($_)}) -join '|'
$DontStopTheseSites = '.EXAMPLE'
$regexPatternDontStopTheseSites = @($DontStopTheseSites | ForEach-Object {[regex]::Escape($_)}) -join '|'
#Get-ChildItem IIS:\Sites | Sort-Object -Property State | Select-Object Name, State
#Get-ChildItem IIS:\Sites | Where-Object {$_.state -eq 'Stopped' } | Select-Object Name, State
Get-ChildItem IIS:\Sites | Where-Object {$_.Name -notmatch $regexPatternStoppedSitesDontTouchThese -and $_.Name -notmatch $regexPatternDontStopTheseSites } | Sort-Object -Property Name
$Sites = Get-ChildItem IIS:\Sites | Where-Object {$_.Name -notmatch $regexPatternStoppedSitesDontTouchThese -and $_.Name -notmatch $regexPatternDontStopTheseSites } | Sort-Object -Property Name



