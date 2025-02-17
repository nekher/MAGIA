nfirmacion.Controls.Add($btnNo)

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