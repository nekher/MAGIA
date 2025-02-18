Add-Type -AssemblyName System.Windows.Forms

# Comprueba si se está ejecutando con privilegios de administrador
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
# Si no se está ejecutando como administrador, vuelve a ejecutar el script con permisos elevados
if (-not $isAdmin) {
    Start-Process powershell.exe -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    Exit
}

$imagePath = "c:\repos\magia\magia2\ironman.jpg"
# Calculamos que la posicion inicial sea arriba del taskbar y tocando el lado derecho de la pantalla
$formWidth = 600  # CAMBIAR ACA EL VALOR DEL ANCHO DE LA APP
$formHeight = 400  # CAMBIAR ACA EL VALOR DE LA ALTURA DE LA APP
$formX = 0
$formY= 0


# Se crea el formulario
$form = New-Object System.Windows.Forms.Form
$form.Text = "MAGIA VERSION FINAL"
$form.Size = New-Object System.Drawing.Size($formWidth, $formHeight)
$form.StartPosition = "Manual"
$form.Location = New-Object System.Drawing.Point($formX, $formY)
$form.TopMost = $true


# Impedimos que pueda hacerse resize
$form.FormBorderStyle = "FixedSingle"
$form.MaximizeBox = $false
$form.MinimumSize = $form.Size
$form.MaximumSize = $form.Size



# Función para ejecutar optimización
function Optimizar-PC {
    powercfg.exe /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c #colocamos el perfil en maximo
    Set-Service -Name 'SysMain' -StartupType Disabled #deshabilitamos SysMain
    Set-Service -Name 'WSearch' -StartupType Disabled #deshabilitamos WSearch
    Set-Service -Name 'DiagTrack' -StartupType Disabled #deshabilitamos DiagTrack
    Set-Service -Name 'CDPSvc' -StartupType Disabled #deshabilitamos CDPSvc
    Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windos Search' -Name 'AllowCortana' -Value 0 #deshabilitamos Cortana
    Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Name 'ConnectedSearchUseWeb' -Value 0 #deshabilitamos Windows Search
    schtasks.exe /Change /DISABLE /TN "\Microsoft\Windows\Defrag\ScheduledDefrag" #deshabilitamos el defrag
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" -Name "VisualFXSetting" -Value $performanceOptions["VisualFXSetting"] #deshabilitamos efectos visuales
    Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "UserPreferencesMask" -Value $performanceOptions["UserPreferencesMask"] #idem anterir
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "SaveTaskbarThumbnail" -Value 1 #colocamos que se puedan ver la miniaturas
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "IconsOnly" -Value 0 #colocamos que se puedan ver los iconos 
    Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "FontSmoothing" -Value 2 #colocamos que se pueda ver linda las fuentes de texto
    bcdedit /set useplatformclock No #que no use el temporizador interno
    bcdedit /set disabledynamictick Yes #que no use el temporizador dinamico
    Start-Process "devmgmt.msc" #abre el devicemanager
    Start-Process "msconfig" #abre el msconfig
    
    [System.Windows.Forms.MessageBox]::Show("Optimizacion al mango. Decime...no merezco un cafecito?")
}

# Función para Poner los updates en ON
function Updates-On {
    # Habilitar los servicios para que se inicien automáticamente
    Set-Service -Name UsoSvc -StartupType Automatic
    Set-Service -Name wuauserv -StartupType Automatic
    # Reiniciar los servicios
    Start-Service -Name UsoSvc -Force
    Start-Service -Name wuauserv -Force
    [System.Windows.Forms.MessageBox]::Show("Wiii!!! Volvieron los Updates!!! (?) ")
}

# Función para Poner los updates en OFF
function Updates-Off {
        # Detener los servicios
        Stop-Service -Name UsoSvc -Force
        Stop-Service -Name wuauserv -Force
        # Deshabilitar los servicios para que no se inicien automáticamente
        Set-Service -Name UsoSvc -StartupType Disabled
        Set-Service -Name wuauserv -StartupType Disabled

    [System.Windows.Forms.MessageBox]::Show("Y asi, como si nada, se fueron los updates...que dia triste :(")
}

# Función para mostrar las explicaciones
function Mostrar-Explicaciones {
    $expForm = New-Object System.Windows.Forms.Form
    $expForm.Text = "Explicaciones"
    $expForm.Size = New-Object System.Drawing.Size(250,200)

    $imagenhelp = New-Object System.Windows.Forms.PictureBox
    $imagenhelp.Image = [System.Drawing.Image]::FromFile("c:\repos\magia\magia2\raptor.jpg")
    $imagenhelp.SizeMode = "StretchImage"
    $imagenhelp.Dock = "Fill"
    $expForm.Controls.Add($imagenhelp)
    
    $expForm.StartPosition = "Manual"
    $expForm.Location = New-Object System.Drawing.Point(0, 400)
    $expForm.Show()

    $imageForm = New-Object System.Windows.Forms.Form
    $imageForm.Text = "Explicacion sobre lo que hay que hacer"
    $imageForm.Size = New-Object System.Drawing.Size(720,1280)

    $pictureBox = New-Object System.Windows.Forms.PictureBox
    $pictureBox.Image = [System.Drawing.Image]::FromFile("c:\repos\magia\magia2\pdf.jpg")
    $pictureBox.SizeMode = "Zoom"
    $pictureBox.Dock = "Fill"
    $imageForm.Controls.Add($pictureBox)

    $imageForm.StartPosition = "Manual"
    $imageForm.Location = New-Object System.Drawing.Point(590, 0)
    $imageForm.Show()
}

# Función para confirmar antes de ejecutar la optimización
function Confirmar-Accion {
    # Crear nueva ventana para la confirmación
    $formConfirmacion = New-Object System.Windows.Forms.Form
    $formConfirmacion.Text = "Estas Seguro?"
    $formConfirmacion.Size = New-Object System.Drawing.Size(500, 300)
    $formConfirmacion.StartPosition = 'CenterScreen'

    # Botón NO
    $btnNo = New-Object System.Windows.Forms.Button
    $btnNo.Text = "NO, TENGO MIEDO"
    $btnNo.Font = New-Object System.Drawing.Font("Roboto", 13) 
    $btnNo.Size = New-Object System.Drawing.Size(200, 50)
    $btnNo.Location = New-Object System.Drawing.Point(50, 120)
    $btnNo.BackColor = [System.Drawing.Color]::LightGreen
    $btnNo.Add_Click({
        $btnOptimizar.Visible = $true
        $btnExplicaciones.Visible = $true
        $btnSalir.Visible = $true
        $formConfirmacion.Close()  # Cerrar ventana de confirmación
    })
    $formConfirmacion.Controls.Add($btnNo)

    # Botón SI
    $btnSi = New-Object System.Windows.Forms.Button
    $btnSi.Text = "SI, DALE MURRA"
    $btnSi.Font = New-Object System.Drawing.Font("Roboto", 13) 
    $btnSi.Size = New-Object System.Drawing.Size(200, 50)
    $btnSi.Location = New-Object System.Drawing.Point(250, 120)
    $btnSi.BackColor = [System.Drawing.Color]::LightPink
    $btnSi.Add_Click({
        Optimizar-PC
        $mensajeOpt = New-Object System.Windows.Forms.Label
        $mensajeOpt.Text = "LISSTO ahora pensa seriamente si no merezco un cafecito...."
        $mensajeOpt.Size = New-Object System.Drawing.Size(300, 50)
        $mensajeOpt.Location = New-Object System.Drawing.Point(150, 150)
        $form.Controls.Add($mensajeOpt)

        Start-Sleep -Seconds 1
        $btnOptimizar.Visible = $true
        $btnExplicaciones.Visible = $true
        $btnSalir.Visible = $true
        $formConfirmacion.Close()  # Cerrar ventana de confirmación
    })
    $formConfirmacion.Controls.Add($btnSi)

    $imagenmagia = New-Object System.Windows.Forms.PictureBox
    $imagenmagia.Image = [System.Drawing.Image]::FromFile("c:\repos\magia\magia2\nedry.gif")
    $imagenmagia.Size = $form.Size
    $imagenmagia.SizeMode = "StretchImage"
    $imagenmagia.Dock = "Fill"
    $formConfirmacion.Controls.Add($imagenmagia)

    $soundPlayer = New-Object System.Media.SoundPlayer
    $soundPlayer.SoundLocation = "c:\repos\magia\magia2\nedry.wav"
    $soundPlayer.Play()

    # Mostrar la ventana de confirmación
    $formConfirmacion.ShowDialog()



}

# Función para confirmar antes de ejecutar la optimización
function Updates-OnOff {
    # Crear nueva ventana para la confirmación
    $formConfirmacion = New-Object System.Windows.Forms.Form
    $formConfirmacion.Text = "Elegi que queres hacer"
    $formConfirmacion.Size = New-Object System.Drawing.Size(500, 300)
    $formConfirmacion.StartPosition = 'CenterScreen'

    # Etiqueta de confirmación
    $labelConfirmacion = New-Object System.Windows.Forms.Label
    $labelConfirmacion.Text = "Choose your poison..."
    $labelConfirmacion.Size = New-Object System.Drawing.Size(400, 50)
    $labelConfirmacion.Location = New-Object System.Drawing.Point(50, 50)
    $formConfirmacion.Controls.Add($labelConfirmacion)

    # Botón Activar Updates
    $btnOn = New-Object System.Windows.Forms.Button
    $btnOn.Text = "ACTIVAR UPDATES"
    $btnOn.Font = New-Object System.Drawing.Font("Roboto", 13) 
    $btnOn.Size = New-Object System.Drawing.Size(200, 50)
    $btnOn.Location = New-Object System.Drawing.Point(50, 120)
    $btnOn.BackColor = [System.Drawing.Color]::LightGreen
    $btnOn.Add_Click({
        Updates-On
        $mensajeOpt = New-Object System.Windows.Forms.Label
        $mensajeOpt.Text = "Y asi, como si nada, ya no hay updates :( "
        $mensajeOpt.Size = New-Object System.Drawing.Size(300, 50)
        $mensajeOpt.Location = New-Object System.Drawing.Point(150, 150)
        $form.Controls.Add($mensajeOpt)

        $btnOptimizar.Visible = $true
        $btnExplicaciones.Visible = $true
        $btnSalir.Visible = $true
        $formConfirmacion.Close()  # Cerrar ventana de confirmación
    })
    $formConfirmacion.Controls.Add($btnOn)

    # Botón Desactivar Updates
    $btnOff = New-Object System.Windows.Forms.Button
    $btnOff.Text = "DESACTIVAR UPDATES"
    $btnOff.Font = New-Object System.Drawing.Font("Roboto", 13) 
    $btnOff.Size = New-Object System.Drawing.Size(200, 50)
    $btnOff.Location = New-Object System.Drawing.Point(250, 120)
    $btnOff.BackColor = [System.Drawing.Color]::LightPink
    $btnOff.Add_Click({
        Updates-Off
        $mensajeOpt = New-Object System.Windows.Forms.Label
        $mensajeOpt.Text = "Y asi, como si nada, ya no hay updates :( "
        $mensajeOpt.Size = New-Object System.Drawing.Size(300, 50)
        $mensajeOpt.Location = New-Object System.Drawing.Point(150, 150)
        $form.Controls.Add($mensajeOpt)

        $btnOptimizar.Visible = $true
        $btnExplicaciones.Visible = $true
        $btnSalir.Visible = $true
        $formConfirmacion.Close()  # Cerrar ventana de confirmación
    })
    $formConfirmacion.Controls.Add($btnOff)

    # Mostrar la ventana de confirmación
    $formConfirmacion.ShowDialog()
}


# Botones principales con colores diferentes

$btnExplicaciones = New-Object System.Windows.Forms.Button
$btnExplicaciones.Text = "HELP"
$btnExplicaciones.Font = New-Object System.Drawing.Font("Roboto", 14) 
$btnExplicaciones.FlatStyle = 'Flat'
$btnExplicaciones.Size = New-Object System.Drawing.Size(200, 50)
$btnExplicaciones.Location = New-Object System.Drawing.Point(360, 30)
$btnExplicaciones.BackColor = [System.Drawing.Color]::Gold
$btnExplicaciones.Add_Click({ Mostrar-Explicaciones })
$form.Controls.Add($btnExplicaciones)

$btnOptimizar = New-Object System.Windows.Forms.Button
$btnOptimizar.Text = "MAGIA"
$btnOptimizar.Font = New-Object System.Drawing.Font("Roboto", 14) 
$btnOptimizar.FlatStyle = 'Flat'
$btnOptimizar.Size = New-Object System.Drawing.Size(200, 50)
$btnOptimizar.Location = New-Object System.Drawing.Point(360, 100)
$btnOptimizar.BackColor = [System.Drawing.Color]::Orange
$btnOptimizar.Add_Click({ Confirmar-Accion })
$form.Controls.Add($btnOptimizar)

$btnUpdates = New-Object System.Windows.Forms.Button
$btnUpdates.Text = "UPDATES ON/OFF"
$btnUpdates.Font = New-Object System.Drawing.Font("Roboto", 14) 
$btnUpdates.FlatStyle = 'Flat'
$btnUpdates.Size = New-Object System.Drawing.Size(200, 50)
$btnUpdates.Location = New-Object System.Drawing.Point(360, 170)
$btnUpdates.BackColor = [System.Drawing.Color]::Orange
$btnUpdates.Add_Click({ Updates-OnOff })
$form.Controls.Add($btnUpdates)


$btnSalir = New-Object System.Windows.Forms.Button
$btnSalir.Text = "Salir"
$btnSalir.Font = New-Object System.Drawing.Font("Roboto", 14) 
$btnSalir.Size = New-Object System.Drawing.Size(200, 50)
$btnSalir.FlatStyle = 'Flat'
$btnSalir.Location = New-Object System.Drawing.Point(360, 240)
$btnSalir.BackColor = [System.Drawing.Color]::Firebrick
$btnSalir.Add_Click({ $form.Close() })
$form.Controls.Add($btnSalir)


# Agregar los botones después del fondo para que queden encima
$form.Controls.Add($btnExplicaciones)
$form.Controls.Add($btnOptimizar)
$form.Controls.Add($btnUpdates)
$form.Controls.Add($btnSalir)
$form.Controls.Add($btnNo)
$form.Controls.Add($btnSi)
$form.Controls.Add($btnOff)
$form.Controls.Add($btnOn)


# Agregar un PictureBox para mostrar la imagen de fondo
$pictureBox = New-Object System.Windows.Forms.PictureBox
$image = [System.Drawing.Image]::FromFile($imagePath)
$pictureBox.Image = $image
$pictureBox.Size = $form.Size
$pictureBox.SizeMode = "StretchImage"
$pictureBox.Dock = "Fill"
$form.Controls.Add($pictureBox)


# Mostrar la ventana principal
$form.ShowDialog()


