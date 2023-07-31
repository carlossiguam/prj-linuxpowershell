# Cargar las credenciales desde el archivo seguro
$credentials = Import-Clixml -Path "/home/adminos/dev/github/prj-linuxpowershell/credenciales.xml"

# Configuración
$folderPath = "/home/adminos/Documents"  # Ruta del directorio donde se buscarán los archivos
$expectedFileCount = 4  # Número esperado de archivos ZIP con el prefijo "g1_"
$daysDifference = -1  # Diferencia de días para obtener la fecha anterior (valor negativo para retroceder en el tiempo)


# Obtener la fecha actual y calcular la fecha objetivo basada en la diferencia de días
$currentDate = Get-Date
$targetDate = $currentDate.AddDays($daysDifference).ToString("yyyy-MM-dd")

# Filtrar archivos que tengan el prefijo "g1_" y pertenezcan a la misma fecha
$matchingFiles = Get-ChildItem -Path $folderPath `
-Filter "g1_*.zip" | Where-Object { $_.CreationTime.Date -eq $targetDate }

Write-Host $matchingFiles

# # Contar el número de archivos encontrados
# $foundFileCount = $matchingFiles.Count

# # Verificar si el número de archivos encontrados coincide con el número esperado
# if ($foundFileCount -eq $expectedFileCount) {
#     # Si el número de archivos es el esperado, enviar correo de notificación de éxito

#     # Configurar las credenciales de tu correo
#     $senderCredentials = Get-Credential

#     $mailBody = "La validación fue exitosa. Se encontraron $foundFileCount archivos ZIP con el prefijo 'g1_' en la fecha $currentDate."
#     Send-MailMessage -To "destinatario@example.com" -From "remitente@example.com" -Subject "Éxito en la validación de archivos" -Body $mailBody -SmtpServer "smtp.example.com" -Port 587 -UseSsl -Credential $senderCredentials
# } else {
#     # Si el número de archivos es diferente al esperado, enviar correo con el reporte de archivos encontrados

#     # Configurar las credenciales de tu correo
#     $senderCredentials = Get-Credential

#     $mailBody = "La validación no fue exitosa. Se encontraron $foundFileCount archivos ZIP con el prefijo 'g1_' en la fecha $currentDate.`nArchivos encontrados:`n"
#     $mailBody += $matchingFiles | ForEach-Object { $_.Name }
#     Send-MailMessage -To "destinatario@example.com" -From "remitente@example.com" -Subject "Reporte de validación de archivos" -Body $mailBody -SmtpServer "smtp.example.com" -Port 587 -UseSsl -Credential $senderCredentials
# }




function sendMailO {
    # $senderCredential=Get-Credential
    Send-MailMessage -To 'carlos.sigua@gmail.com' `
    -From csigua@emov.gob.ec `
    -Subject 'Infrastructure message' `
    -Body 'Esto es un mensaje de prueba' `
    -UseSsl -Credential $credentials `
    -SmtpServer 'mail.emov.gob.ec' -Port 587
}
function main {
    sendMailO
}




main