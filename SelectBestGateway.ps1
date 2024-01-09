$gateways = @("192.168.28.10", "192.168.28.11", "192.168.28.12")
$bestPing = 999
$bestGateway = $null

foreach ($gateway in $gateways) {
    $pingResult = Test-Connection -ComputerName $gateway -Count 1 -Quiet
    if ($pingResult) {
        $currentPing = (Test-Connection -ComputerName $gateway -Count 1).ResponseTime
        if ($currentPing -lt $bestPing) {
            $bestPing = $currentPing
            $bestGateway = $gateway
        }
    }
}

if ($bestGateway) {
    $interfaceIndex = (Get-NetIPConfiguration | Where-Object { $_.IPv4DefaultGateway -ne $null }).NetAdapter.InterfaceIndex
    $currentGateway = (Get-NetRoute -InterfaceIndex $interfaceIndex -DestinationPrefix "0.0.0.0/0").NextHop

    if ($currentGateway -ne $bestGateway) {
        Remove-NetRoute -InterfaceIndex 6 -DestinationPrefix "0.0.0.0/0" -Confirm:$false
        New-NetRoute -InterfaceIndex 6 -DestinationPrefix "0.0.0.0/0" -NextHop $bestGateway
        Write-Host "Default gateway changed to $bestGateway"
    }
} else {
    Write-Host "No best gateway found."
}
