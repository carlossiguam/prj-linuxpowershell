USING POWERSHELL ON LINUX
------------------------------------------------

This repo talks about my  experience with powershell on linux.

## KNOWNING THE TOOL
Bueno para el caso de fedora tan solo hemos seguido lo que nos indica la misma documentacion de microsoft
- [Installing powershell on linux](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-linux?view=powershell-7.3)


### INSTALL ON FEDORA

```shell
https://learn.microsoft.com/en-us/powershell/scripting/install/install-rhel?view=powershell-7.3#installation-via-package-repository

```

### INSTALL ON UBUNTU

```shell
https://learn.microsoft.com/en-us/powershell/scripting/install/install-ubuntu?view=powershell-7.3#installation-via-package-repository
```

## GenerateCredentials SMTP
Hemos creado un script para generar las credenciales y guardarla en el path destino que creas conveniente te recomiendo te bajes el archivo y lo pruebes dentro de tu ambiente de momento este script funciona en linux y windows.

- [Generar credenciales para SMTP](
    https://raw.githubusercontent.com/carlossiguam/prj-linuxpowershell/main/generateCredentialsSMTP.ps1
)

## SendMail using Send-MailMessage
He creado un script que envia una notificaciond de prueba usando la herramienta Send-MailMessage que aunque el warning me recomienda que no lo use porque esta descontinuado ha sido el que pues ha funcionado desde linux usando powershell.

- [Enviar correo usando Send-MailMessage](
    https://raw.githubusercontent.com/carlossiguam/prj-linuxpowershell/main/init.ps1
)