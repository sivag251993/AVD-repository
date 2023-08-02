
 #############################           Fetch All vm's with Drain Mode On ######################
 
 # Run after 2 hrs
 
$hostPoolRg="avd-rg";
$hostPoolName="hostpool-avs";


$runningSessionHosts = Get-AzWvdSessionHost -ErrorAction Stop -HostPoolName $hostPoolName -ResourceGroupName $hostPoolRg | Where-Object { $_.Status -eq "Available" } | Where-Object { $_.AllowNewSession -eq $false } | Where-Object {$_.Name -like '*win11-avs*'};


# Stop all vms which are in drain mode

foreach ($sessionHost in $runningSessionHosts) {
$sessionHostName = (($sessionHost).name -split { $_ -eq '/' })[1]
Get-azvm -ErrorAction Stop -Name $sessionHostName | Stop-AzVM -ErrorAction Stop -Force -NoWait
}

