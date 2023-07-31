# Importar la clase System.Net.Mail
Add-Type -AssemblyName System.Net.Mail

# Cargar las credenciales desde el archivo seguro
$credentials = Import-Clixml -Path "/home/adminos/dev/github/prj-linuxpowershell/credenciales.xml"

# Configuración de variables para el script
$folderPath = "/home/adminos/Documents"  # Ruta del directorio donde se buscarán los archivos
$expectedFileCount = 4  # Número esperado de archivos ZIP con el prefijo "g1_"
$daysDifference = -1  # Diferencia de días para obtener la fecha anterior (valor negativo para retroceder en el tiempo)


# Obtener la fecha actual y calcular la fecha objetivo basada en la diferencia de días
$currentDate = Get-Date
$targetDate = $currentDate.AddDays($daysDifference).ToString("yyyy-MM-dd")

# Filtrar archivos que tengan el prefijo "g1_" y pertenezcan a la misma fecha
$matchingFiles = Get-ChildItem -Path $folderPath `
-Filter "g1_*.zip" | Where-Object { $_.CreationTime.Date -eq $targetDate }

# Configuración del correo
$recipientEmail = "csigua@emov.gob.ec"
$senderEmail = "carlos.sigua@gmail.com"
$subject = "INFRA NOTIF 1492"
$body = "Este es por ahora el mensaje del correo con los archivos adjuntos encontrados.  "+$matchingFiles


# Crear el objeto MailMessage
$mailMessage = New-Object System.Net.Mail.MailMessage
$mailMessage.From = $senderEmail
$mailMessage.To.Add($recipientEmail)
$mailMessage.Subject = $subject
$mailMessage.Body = $body




# Configurar el servidor SMTP
$smtpServer = "mail.emov.gob.ec"
$smtpPort = 587
$smtpCredentials = $credentials

# Crear el objeto SmtpClient
$smtpClient = New-Object System.Net.Mail.SmtpClient($smtpServer, $smtpPort)
$smtpClient.EnableSsl = $true
$smtpClient.Credentials = $smtpCredentials

# Enviar el correo electrónico
$smtpClient.Send($mailMessage)
