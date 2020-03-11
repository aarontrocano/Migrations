$credential = Get-Credential
Remove-Computer -UnjoinDomainCredential $credential -Force -WorkgroupName 'WORKGROUP'