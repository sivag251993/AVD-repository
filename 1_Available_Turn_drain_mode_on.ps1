
# Script 1
# Get Vms with certain prefix which are available and not in drain mode.
$hostPoolRg="SivaG-RG"
$hostPoolName="hostpool-avs"

$sessionHosts = Get-AzWvdSessionHost -ResourceGroupName $hostPoolRg -HostPoolName $hostPoolName | Where-Object { $_.AllowNewSession -eq $true } | Where-Object {$_.Name -like '*win11-avs-2*'} | Where-Object { $_.Status -eq "Available" }

foreach ($sessionHost in $sessionHosts) {
   $sessionHost = (($sessionHost.name).Split("/"))[1]
   Update-AzWvdSessionHost -ResourceGroupName $hostPoolRg -HostPoolName $hostPoolName -Name $sessionHost -AllowNewSession:$false 
}
