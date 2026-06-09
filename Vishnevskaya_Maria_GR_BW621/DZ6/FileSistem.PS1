<#
.SYNOPSIS
    Создание и настройка текстовой директории
    .DESKRIPTION
    Создание блоков по работе с папками и файлами.
.NOTES
    Версия 0.01   
#>

#===БЛОК 1: Создание папок===

New-Item -Path "C:\Users\Mari" -Name PS_Homework -ItemType Directory 
Set-Location -Path "C:\Users\Mari\PS_Homework"
Get-Location

New-Item -Path "C:\Users\Mari\PS_Homework" -Name Reports -ItemType Directory
New-Item -Path "C:\Users\Mari\PS_Homework" -Name Archive -ItemType Directory
New-Item -Path "C:\Users\Mari\PS_Homework" -Name Temp -ItemType Directory


#===БЛОК 2: Создание текста в файлах===

New-Item -Path "C:\Users\Mari\PS_Homework\Reports" -Name "report_2024.txt" -ItemType File -Value "Годовой отчет"
New-Item -Path "C:\Users\Mari\PS_Homework\Reports" -Name "report_2025.txt" -ItemType File -Value "Промежуточный отчет"
New-Item -Path "C:\Users\Mari\PS_Homework\Reports" -Name "notest.txt" -ItemType File -Value "Заметки" 
New-Item -Path "C:\Users\Mari\PS_Homework\Temp" -Name "temp_data.log" -ItemType File -Value "Тырыпыры"

#===БЛОК 3: работа с переменными===
$Year = 2025
$IsValid = ($Year -gt 2020) -and ($Year -lt 2030)
Write-Host "Удовлетворяет условию (2020 < Year < 2030): $isValid"
$Textfiles = Get-ChildItem -Path $folderPath -File | Where-Object { $_.Name -like "*txt" }
$TextFiles.Count 
$Reportfiles = $TextFile | Where-Object { $_.Name -Like "*report*" }
$textfiles | Select-Object Name

#===БЛОК 4: Копируем, переименовываем, удаляем файлы===
Copy-Item -Path "C:\Users\Mari\PS_Homework\Reports\notest.txt" -Destination "C:\Users\Mari\PS_Homework\Archive\notes_backup.txt"
Rename-Item -Path "C:\Users\Mari\PS_Homework\Reports\notest.txt" -NewName "notest_final.txt"
Get-ChildItem -Path  "C:\Users\Mari\PS_Homework\Temp\*.log" |Move-Item -Destination "C:\Users\Mari\PS_Homework" 
Remove-Item -Path "C:\Users\Mari\PS_Homework\Temp" -Recurse
Get-ChildItem -Path "C:\Users\Mari\PS_Homework" -Recurse
