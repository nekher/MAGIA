# Comprueba si se est� ejecutando con privilegios de administrador
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
# Si no se est� ejecutando como administrador, vuelve a ejecutar el script con permisos elevados
if (-not $isAdmin) {
    Start-Process powershell.exe -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    Exit
}


# Deshabilitar todas las opciones de rendimiento (modo "Mejor Rendimiento")
$performanceOptions = @{
    "VisualFXSetting" = 2  # 2 = "Ajustar para obtener el mejor rendimiento"
    "UserPreferencesMask" = ([byte[]](0x90, 0x12, 0x03, 0x80, 0x10, 0x00, 0x00, 0x00))  # Deshabilitar todos los efectos
}

# Aplicar el ajuste de rendimiento general
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" -Name "VisualFXSetting" -Value $performanceOptions["VisualFXSetting"]
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "UserPreferencesMask" -Value $performanceOptions["UserPreferencesMask"]

# Asegurar que los cambios en el registro se procesen
Stop-Process -Name explorer -Force
Start-Process explorer

# Esperar un segundo antes de aplicar los ajustes individuales
Start-Sleep -Seconds 2

# Habilitar las opciones específicas
# 1. Guardar vistas previas de miniaturas
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "SaveTaskbarThumbnail" -Value 1

# 2. Mostrar vistas de miniaturas en lugar de iconos
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "IconsOnly" -Value 0

# 3. Suavizar bordes para las fuentes
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "FontSmoothing" -Value 2

# Volver a procesar los cambios para que se vean de inmediato
Stop-Process -Name explorer -Force
Start-Process explorer
