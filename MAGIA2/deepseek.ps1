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
    powercfg.exe /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
    Set-Service -Name 'SysMain' -StartupType Disabled
    Set-Service -Name 'WSearch' -StartupType Disabled
    Set-Service -Name 'DiagTrack' -StartupType Disabled
    Set-Service -Name 'CDPSvc' -StartupType Disabled
    Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Name 'AllowCortana' -Value 0
    schtasks.exe /Change /DISABLE /TN "\Microsoft\Windows\Defrag\ScheduledDefrag"
    Start-Process "$env:windir\system32\SystemPropertiesPerformance.exe"
    Start-Process "msconfig"
    [System.Windows.Forms.MessageBox]::Show("Optimización al mango. Decime...no merezco un cafecito?")
}

# Función para mostrar las explicaciones
function Mostrar-Explicaciones {
    $expForm = New-Object System.Windows.Forms.Form
    $expForm.Text = "Explicaciones"
    $expForm.Size = New-Object System.Drawing.Size(250,200)

    $pictureBox = New-Object System.Windows.Forms.PictureBox
    $pictureBox.Image = [System.Drawing.Image]::FromFile("c:\repos\magia\magia2\nedry.gif")
    $pictureBox.SizeMode = "StretchImage"
    $pictureBox.Dock = "Fill"
    $expForm.Controls.Add($pictureBox)

    $soundPlayer = New-Object System.Media.SoundPlayer
    $soundPlayer.SoundLocation = "c:\repos\magia\magia2\nedry.wav"
    $soundPlayer.Play()
    
    $expForm.StartPosition = "Manual"
    $expForm.Location = New-Object System.Drawing.Point(0, 400)
    $expForm.Show()

    $imageForm = New-Object System.Windows.Forms.Form
    $imageForm.Text = "Explicacion sobre lo que hay que hacer"
    $imageForm.Size = New-Object System.Drawing.Size(600,1280)

    $pictureBox = New-Object System.Windows.Forms.PictureBox
    $pictureBox.Image = [System.Drawing.Image]::FromFile("c:\repos\magia\magia2\pdf.jpg")
    $pictureBox.SizeMode = "StretchImage"
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
    $formConfirmacion.Text = "Confirmación de Acción"
    $formConfirmacion.Size = New-Object System.Drawing.Size(500, 300)
    $formConfirmacion.StartPosition = 'CenterScreen'

    # Etiqueta de confirmación
    $labelConfirmacion = New-Object System.Windows.Forms.Label
    $labelConfirmacion.Text = "¿ESTÁS SEGURO DE LO QUE VAS A HACER? Vas a modificar lo siguiente:`r`n10 campos a editar"
    $labelConfirmacion.Size = New-Object System.Drawing.Size(400, 50)
    $labelConfirmacion.Location = New-Object System.Drawing.Point(50, 50)
    $formConfirmacion.Controls.Add($labelConfirmacion)

    # Botón NO
    $btnNo = New-Object System.Windows.Forms.Button
    $btnNo.Text = "NO, me dio miedo y me arrepentí"
    $btnNo.Size = New-Object System.Drawing.Size(200, 50)
    $btnNo.Location = New-Object System.Drawing.Point(50, 120)
    $btnNo.BackColor = [System.Drawing.Color]::LightPink
    $btnNo.Add_Click({
        $btnOptimizar.Visible = $true
        $btnExplicaciones.Visible = $true
        $btnSalir.Visible = $true
        $formConfirmacion.Close()  # Cerrar ventana de confirmación
    })
    $formConfirmacion.Controls.Add($btnNo)

    # Botón SI
    $btnSi = New-Object System.Windows.Forms.Button
    $btnSi.Text = "SI, le voy a dar murra"
    $btnSi.Size = New-Object System.Drawing.Size(200, 50)
    $btnSi.Location = New-Object System.Drawing.Point(250, 120)
    $btnSi.BackColor = [System.Drawing.Color]::LightGreen
    $btnSi.Add_Click({
        Optimizar-PC
        $mensajeOpt = New-Object System.Windows.Forms.Label
        $mensajeOpt.Text = "LISSTO ahora pensa seriamente si no merezco un cafecito...."
        $mensajeOpt.Size = New-Object System.Drawing.Size(300, 50)
        $mensajeOpt.Location = New-Object System.Drawing.Point(150, 150)
        $form.Controls.Add($mensajeOpt)

        Start-Sleep -Seconds 2
        $btnOptimizar.Visible = $true
        $btnExplicaciones.Visible = $true
        $btnSalir.Visible = $true
        $formConfirmacion.Close()  # Cerrar ventana de confirmación
    })
    $formConfirmacion.Controls.Add($btnSi)

    # Mostrar la ventana de confirmación
    $formConfirmacion.ShowDialog()
}

# Botones principales con colores diferentes

$btnExplicaciones = New-Object System.Windows.Forms.Button
$btnExplicaciones.Text = "Explicaciones"
$btnExplicaciones.FlatStyle = 'Flat'
$btnExplicaciones.Size = New-Object System.Drawing.Size(200, 50)
$btnExplicaciones.Location = New-Object System.Drawing.Point(380, 50)
$btnExplicaciones.BackColor = [System.Drawing.Color]::Gold
$btnExplicaciones.Add_Click({ Mostrar-Explicaciones })
$form.Controls.Add($btnExplicaciones)

$btnOptimizar = New-Object System.Windows.Forms.Button
$btnOptimizar.Text = "Hacer que la PC funcione bien"
$btnOptimizar.FlatStyle = 'Flat'
$btnOptimizar.Size = New-Object System.Drawing.Size(200, 50)
$btnOptimizar.Location = New-Object System.Drawing.Point(380, 120)
$btnOptimizar.BackColor = [System.Drawing.Color]::Orange
$btnOptimizar.Add_Click({ Confirmar-Accion })
$form.Controls.Add($btnOptimizar)

$btnSalir = New-Object System.Windows.Forms.Button
$btnSalir.Text = "Salir"
$btnSalir.Size = New-Object System.Drawing.Size(200, 50)
$btnSalir.FlatStyle = 'Flat'
$btnSalir.Location = New-Object System.Drawing.Point(380, 190)
$btnSalir.BackColor = [System.Drawing.Color]::Firebrick
$btnSalir.Add_Click({ $form.Close() })
$form.Controls.Add($btnSalir)


# Agregar los botones después del fondo para que queden encima
$form.Controls.Add($btnExplicaciones)
$form.Controls.Add($btnOptimizar)
$form.Controls.Add($btnSalir)
$form.Controls.Add($btnNo)
$form.Controls.Add($btnSi)


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


