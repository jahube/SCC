$cred = get-credential

install-module ExchangeOnlineManagement

install-module AIPService

Connect-ExchangeOnline -Credential $cred

Connect-AipService -Credential $cred

Connect-IPPSSession -Credential $cred

Get-IRMConfiguration | fl

Get-AadrmConfiguration | fl

Set-IRMConfiguration -LicensingLocation (Get-IRMConfiguration).LicensingLocation

(Get-IRMConfiguration).LicensingLocation

If above empty, run below 2 lines

# Activate AADRM
Enable-Aadrm

#confirm
(Get-AadrmConfiguration).LicensingIntranetDistributionPointUrl

#set
Set-IRMConfiguration -LicensingLocation (Get-AadrmConfiguration).LicensingIntranetDistributionPointUrl

#check
(Get-IRMConfiguration).LicensingLocation

Set-IRMConfiguration -InternalLicensingEnabled $True  -AzureRMSLicensingEnabled $True -Confirm:$False -Force

Set-IRMConfiguration -InternalLicensingEnabled $true

# Enable OWA +
Set-IRMConfiguration -SimplifiedClientAccessEnabled $true

#long
get-label | fl
get-labelpolicy | fl

#short
get-label | ft
get-labelpolicy | ft

# active lables
$labels = get-label | Where {$_.mode -eq "enforce" }

$labels.name

#simple policy to publish
New-LabelPolicy -Name "My Label Policy" -Labels $($labels.name) -ExchangeLocation "All"