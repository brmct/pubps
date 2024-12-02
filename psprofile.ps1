# Initial Profile File for PowerShell Host
# For use with PowerShell Console (and inside MS Terminal)

#Write host details
Write-Host "On          [$(hostname)]"
Write-Host "Customizing [$($Host.Name)]"

$ME = whoami
Write-Host "Logged on as $ME"

# Set Format enumeration limit
$FormatEnumerationLimit = 99

# Set command defaults
$PSDefaultParameterValues = @{
  "Format-Table:autosize" = $true
  'Receive-Job:keep'      = $true
  'Format-*:Wrap'         = $true
}

# Set home to C:\Foo for ~, then go there
New-Item C:\scr -ItemType Directory -Force -EA 0 | out-null
$Provider = Get-PSProvider FileSystem
$Provider.Home = 'C:\scr'
Set-Location -Path ~
Write-Host 'Setting home to C:\scr'

# Add a new function Get-HelpDetailed
Function Get-HelpDetailed {
    Get-Help $args[0] -Detailed
} # END Get-HelpDetailed Function

# Set aliases for help
Set-Alias gh    Get-Help
Set-Alias ghd   Get-HelpDetailed

<# Create Lab Credential
$Urk = 'LAB\Administrator'
$Prk = ConvertTo-SecureString 'Pa$$w0rd' -AsPlainText -Force
$Credrk = [pscredential]::New($Urk, $Prk)
Write-Host "`$Credrk created for $($credrk.username)"
#>