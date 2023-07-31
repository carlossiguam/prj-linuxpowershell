# Generar las credenciales y guardarlas en un archivo seguro
$credentials = Get-Credential
$credentials | Export-Clixml -Path "/home/adminos/dev/github/prj-linuxpowershell/credenciales.xml"
