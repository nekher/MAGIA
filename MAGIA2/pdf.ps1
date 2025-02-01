Add-Type -AssemblyName System.Windows.Forms

# Comprueba si se está ejecutando con privilegios de administrador
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
# Si no se está ejecutando como administrador, vuelve a ejecutar el script con permisos elevados
if (-not $isAdmin) {
    Start-Process powershell.exe -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    Exit
}

# Crear la ventana principal
$form = New-Object System.Windows.Forms.Form
$form.Text = "Programa de Optimización"
$form.Size = New-Object System.Drawing.Size(600,400)

# Función para ejecutar optimización
function Optimizar-PC {
    # Insertar aquí los comandos que quieres portar desde Bash:
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
    # Crear la ventana con la imagen y el sonido en loop
    $expForm = New-Object System.Windows.Forms.Form
    $expForm.Text = "Explicaciones"
    $expForm.Size = New-Object System.Drawing.Size(500,400)

    # Lugar para insertar una imagen (esto lo puedes personalizar)
    $pictureBox = New-Object System.Windows.Forms.PictureBox
    $pictureBox.Image = [System.Drawing.Image]::FromFile("c:\repos\magia\magia2\nedry.gif")
    $pictureBox.SizeMode = "StretchImage"
    $pictureBox.Dock = "Fill"
    $expForm.Controls.Add($pictureBox)

    # Reproducir sonido en loop (puedes cambiar el archivo a tu gusto)
    $soundPlayer = New-Object System.Media.SoundPlayer
    $soundPlayer.SoundLocation = "c:\repos\magia\magia2\nedry.wav"
    $soundPlayer.Play()

    # Colocar la ventana de la imagen en la parte derecha de la pantalla
    $expForm.StartPosition = "Manual"
    $expForm.Location = New-Object System.Drawing.Point(800, 100)

    # Mostrar la ventana con la imagen y el sonido
    $expForm.Show()

     # Segunda ventana para mostrar solo la imagen
     $imageForm = New-Object System.Windows.Forms.Form
     $imageForm.Text = "Comandos Explicados"
     $imageForm.Size = New-Object System.Drawing.Size(768,768)  # Tamaño de la ventana actualizado
 
     # Lugar para insertar la imagen
     $imageRuta = "c:\repos\magia\magia2\pdf.jpg"
     if (Test-Path $imageRuta) {
         # Crear el PictureBox para mostrar la imagen
         $imageBox = New-Object System.Windows.Forms.PictureBox
         $imageBox.Image = [System.Drawing.Image]::FromFile($imageRuta)
         $imageBox.SizeMode = "StretchImage"
         $imageBox.Dock = "Fill"
         $imageForm.Controls.Add($imageBox)
     } else {
         # Si no existe la imagen, mostrar un mensaje de error
         [System.Windows.Forms.MessageBox]::Show("La imagen no se encuentra.")
     }
 
    # Mostrar la ventana de la imagen
    $imageForm.Show()
}

# Función para confirmar antes de ejecutar la optimización
function Confirmar-Accion {
    # Ocultar los botones del menú
    $btnOptimizar.Visible = $false
    $btnExplicaciones.Visible = $false
    $btnAgradecimientos.Visible = $false
    $btnSalir.Visible = $false

    # Crear la etiqueta de confirmación dentro de la ventana principal
    $labelConfirmacion = New-Object System.Windows.Forms.Label
    $labelConfirmacion.Text = "¿ESTÁS SEGURO DE LO QUE VAS A HACER? Vas a modificar lo siguiente:" + "`r`n" + "10 campos a editar"
    $labelConfirmacion.Size = New-Object System.Drawing.Size(300, 50)
    $labelConfirmacion.Location = New-Object System.Drawing.Point(150, 150)
    $form.Controls.Add($labelConfirmacion)

    # Botón "NO, me dio miedo y me arrepentí"
    $btnNo = New-Object System.Windows.Forms.Button
    $btnNo.Text = "NO, me dio miedo y me arrepentí"
    $btnNo.Size = New-Object System.Drawing.Size(200, 50)
    $btnNo.Location = New-Object System.Drawing.Point(50, 230)
    $btnNo.Add_Click({
        # Limpiar la pantalla de confirmación
        Limpiar-Pantalla
        # Volver a mostrar los botones del menú
        $btnOptimizar.Visible = $true
        $btnExplicaciones.Visible = $true
        $btnAgradecimientos.Visible = $true
        $btnSalir.Visible = $true
    })
    $form.Controls.Add($btnNo)

    # Botón "SI, le voy a dar murra"
    $btnSi = New-Object System.Windows.Forms.Button
    $btnSi.Text = "SI, le voy a dar murra"
    $btnSi.Size = New-Object System.Drawing.Size(200, 50)
    $btnSi.Location = New-Object System.Drawing.Point(250, 230)
    $btnSi.Add_Click({
        # Ejecutar la optimización
        Optimizar-PC
        # Limpiar la pantalla de confirmación
        Limpiar-Pantalla
        # Mostrar un mensaje de confirmación de optimización realizada
        $mensajeOpt = New-Object System.Windows.Forms.Label
        $mensajeOpt.Text = "Optimización completada con éxito"
        $mensajeOpt.Size = New-Object System.Drawing.Size(300, 50)
        $mensajeOpt.Location = New-Object System.Drawing.Point(150, 150)
        $form.Controls.Add($mensajeOpt)

        # Después de 2 segundos, volver a mostrar los botones del menú
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

# Botón "Hacer que la PC funcione bien"
$btnOptimizar = New-Object System.Windows.Forms.Button
$btnOptimizar.Text = "Hacer que la PC funcione bien"
$btnOptimizar.Size = New-Object System.Drawing.Size(200, 50)
$btnOptimizar.Location = New-Object System.Drawing.Point(200, 50)
$btnOptimizar.Add_Click({
    # Mostrar la ventana de confirmación dentro de la misma ventana
    Confirmar-Accion
})
$form.Controls.Add($btnOptimizar)

# El resto de los botones sigue igual...


# Botón "Explicaciones"
$btnExplicaciones = New-Object System.Windows.Forms.Button
$btnExplicaciones.Text = "Explicaciones"
$btnExplicaciones.Size = New-Object System.Drawing.Size(200, 50)
$btnExplicaciones.Location = New-Object System.Drawing.Point(200, 120)
$btnExplicaciones.Add_Click({ Mostrar-Explicaciones })
$form.Controls.Add($btnExplicaciones)

# Botón "Agradecimientos"
$btnAgradecimientos = New-Object System.Windows.Forms.Button
$btnAgradecimientos.Text = "Agradecimientos"
$btnAgradecimientos.Size = New-Object System.Drawing.Size(200, 50)
$btnAgradecimientos.Location = New-Object System.Drawing.Point(200, 190)
$btnAgradecimientos.Add_Click({
    # Limpiar la ventana principal
    $form.Controls.Clear()

    # Mostrar imagen de agradecimiento
    $pictureBox = New-Object System.Windows.Forms.PictureBox
    $pictureBox.Image = [System.Drawing.Image]::FromFile("c:\repos\magia\magia2\ironman.jpg")
    $pictureBox.SizeMode = "StretchImage"
    $pictureBox.Dock = "Top"
    $form.Controls.Add($pictureBox)
    
    # Establecer un tamaño más grande para el PictureBox (por ejemplo, 600x400)
    $pictureBox.Size = New-Object System.Drawing.Size(1200, 400)

    # Ajustar el tamaño del formulario para que se acomode al PictureBox
    $form.ClientSize = New-Object System.Drawing.Size($pictureBox.Width, $pictureBox.Height)

 # Pausar unos segundos antes de volver al menú principal
 Start-Sleep -Seconds 5

 # Volver al menú principal
 $form.Controls.Clear()
 $form.Controls.Add($btnOptimizar)
 $form.Controls.Add($btnExplicaciones)
 $form.Controls.Add($btnAgradecimientos)
 $form.Controls.Add($btnSalir)
})



$form.Controls.Add($btnAgradecimientos)

# Botón "Salir"
$btnSalir = New-Object System.Windows.Forms.Button
$btnSalir.Text = "Salir"
$btnSalir.Size = New-Object System.Drawing.Size(200, 50)
$btnSalir.Location = New-Object System.Drawing.Point(200, 260)
$btnSalir.Add_Click({ $form.Close() })
$form.Controls.Add($btnSalir)

# Mostrar la ventana principal
$form.ShowDialog()
