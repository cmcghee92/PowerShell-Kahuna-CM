#Create a PS object 


Function Get-CorpCompSysinfo {
    [cmdletbinding()]
    Param(
        [string[]]$ComputerName
    )

    ForEach ($computer in $ComputerName) {
        $compsys = Get-CimInstance -ClassName Win32_ComputerSystem -ComputerName $computer
        $bios = Get-CimInstance -ClassName Win32_BIOS -ComputerName $computer

        $properties = [ordered]@{
            'Computername' = $computer;
            'BiosSerial'   = $bios.SerialNumber;
            'Manufacturer' = $compsys.Manufacturer;
            'Model'        = $compsys.Model;
            'Driveletter'  = $diskinfo.DeviceID
        }
        $outputobject = New-Object -TypeName psobject -Property $properties
        Write-Output $outputobject
 
    }
}
Get-CorpCompSysinfo -ComputerName LON-SVR1 , LON-DC1