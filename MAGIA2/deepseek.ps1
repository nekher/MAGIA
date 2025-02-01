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
    [System.Windows.Forms.MessageBox]::Show("Optimización completada")
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
    $imageForm.Size = New-Object System.Drawing.Size(600,800)

    $pictureBox = New-Object System.Windows.Forms.PictureBox
    $pictureBox.Image = [System.Drawing.Image]::FromFile("c:\repos\magia\magia2\pdf.jpg")
    $pictureBox.SizeMode = "StretchImage"
    $pictureBox.Dock = "Fill"
    $imageForm.Controls.Add($pictureBox)

    $imageForm.StartPosition = "Manual"
    $imageForm.Location = New-Object System.Drawing.Point(1000, 200)
    $imageForm.Show()
}

# Función para confirmar antes de ejecutar la optimización
function Confirmar-Accion {
    $btnOptimizar.Visible = $false
    $btnExplicaciones.Visible = $false
    $btnAgradecimientos.Visible = $false
    $btnSalir.Visible = $false

    $labelConfirmacion = New-Object System.Windows.Forms.Label
    $labelConfirmacion.Text = "¿ESTÁS SEGURO DE LO QUE VAS A HACER? Vas a modificar lo siguiente:`r`n10 campos a editar"
    $labelConfirmacion.Size = New-Object System.Drawing.Size(300, 50)
    $labelConfirmacion.Location = New-Object System.Drawing.Point(150, 150)
    $form.Controls.Add($labelConfirmacion)

    $btnNo = New-Object System.Windows.Forms.Button
    $btnNo.Text = "NO, me dio miedo y me arrepentí"
    $btnNo.Size = New-Object System.Drawing.Size(200, 50)
    $btnNo.Location = New-Object System.Drawing.Point(50, 230)
    $btnNo.BackColor = [System.Drawing.Color]::LightPink
    $btnNo.Add_Click({
        Limpiar-Pantalla
        $btnOptimizar.Visible = $true
        $btnExplicaciones.Visible = $true
        $btnAgradecimientos.Visible = $true
        $btnSalir.Visible = $true
    })
    $form.Controls.Add($btnNo)

    $btnSi = New-Object System.Windows.Forms.Button
    $btnSi.Text = "SI, le voy a dar murra"
    $btnSi.Size = New-Object System.Drawing.Size(200, 50)
    $btnSi.Location = New-Object System.Drawing.Point(250, 230)
    $btnSi.BackColor = [System.Drawing.Color]::LightGreen
    $btnSi.Add_Click({
        Optimizar-PC
        Limpiar-Pantalla
        $mensajeOpt = New-Object System.Windows.Forms.Label
        $mensajeOpt.Text = "Optimización completada con éxito"
        $mensajeOpt.Size = New-Object System.Drawing.Size(300, 50)
        $mensajeOpt.Location = New-Object System.Drawing.Point(150, 150)
        $form.Controls.Add($mensajeOpt)

        Start-Sleep -Seconds 2
        Limpiar-Pantalla
        $btnOptimizar.Visible = $true
        $btnExplicaciones.Visible = $true
        $btnAgradecimientos.Visible = $true
        $btnSalir.Visible = $true
    })
    $form.Controls.Add($btnSi)
}

# Función para limpiar la pantalla
function Limpiar-Pantalla {
    $form.Controls.Clear()
}

# Botones principales con colores diferentes
$btnOptimizar = New-Object System.Windows.Forms.Button
$btnOptimizar.Text = "Hacer que la PC funcione bien"
$btnOptimizar.Size = New-Object System.Drawing.Size(200, 50)
$btnOptimizar.Location = New-Object System.Drawing.Point(200, 50)
$btnOptimizar.BackColor = [System.Drawing.Color]::LightGreen
$btnOptimizar.Add_Click({ Confirmar-Accion })
$form.Controls.Add($btnOptimizar)

$btnExplicaciones = New-Object System.Windows.Forms.Button
$btnExplicaciones.Text = "Explicaciones"
$btnExplicaciones.Size = New-Object System.Drawing.Size(200, 50)
$btnExplicaciones.Location = New-Object System.Drawing.Point(200, 120)
$btnExplicaciones.BackColor = [System.Drawing.Color]::LightCoral
$btnExplicaciones.Add_Click({ Mostrar-Explicaciones })
$form.Controls.Add($btnExplicaciones)

$btnAgradecimientos = New-Object System.Windows.Forms.Button
$btnAgradecimientos.Text = "Agradecimientos"
$btnAgradecimientos.Size = New-Object System.Drawing.Size(200, 50)
$btnAgradecimientos.Location = New-Object System.Drawing.Point(200, 190)
$btnAgradecimientos.BackColor = [System.Drawing.Color]::LightGoldenrodYellow
$btnAgradecimientos.Add_Click({
    $form.Controls.Clear()
    $pictureBox = New-Object System.Windows.Forms.PictureBox
    $pictureBox.Image = [System.Drawing.Image]::FromFile("c:\repos\magia\magia2\ironman.jpg")
    $pictureBox.SizeMode = "StretchImage"
    $pictureBox.Dock = "Top"
    $pictureBox.Size = New-Object System.Drawing.Size(1200, 400)
    $form.ClientSize = New-Object System.Drawing.Size($pictureBox.Width, $pictureBox.Height)
    $form.Controls.Add($pictureBox)
    
    Start-Sleep -Seconds 5
    $form.Controls.Clear()
    $form.Controls.Add($btnOptimizar)
    $form.Controls.Add($btnExplicaciones)
    $form.Controls.Add($btnAgradecimientos)
    $form.Controls.Add($btnSalir)
})
$form.Controls.Add($btnAgradecimientos)



$btnSalir = New-Object System.Windows.Forms.Button
$btnSalir.Text = "Salir"
$btnSalir.Size = New-Object System.Drawing.Size(200, 50)
$btnSalir.FlatStyle = 'Flat'
$btnSalir.Location = New-Object System.Drawing.Point(200, 260)
$btnSalir.BackColor = [System.Drawing.Color]::LightGray
$btnSalir.ForeColor = [System.Drawing.Color]::Black
$btnSalir.Add_Click({ $form.Close() })
$form.Controls.Add($btnSalir)






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


