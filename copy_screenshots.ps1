# This script copies your UI screenshots to D:\parabank\reports\
$src = "C:\Users\mridu\OneDrive\Pictures\Screenshots 1"
$dst = "D:\parabank\reports"

# List all PNG files in the folder sorted by creation time
$files = Get-ChildItem "$src\*.png" | Sort-Object CreationTime

Write-Host "Found $($files.Count) PNG files in Screenshots 1"
$i = 1
foreach ($f in $files) {
    Write-Host "$i. $($f.Name) - Created: $($f.CreationTime)"
    $i++
}

Write-Host ""
Write-Host "Copying all to $dst as ss-manual-1.png, ss-manual-2.png ..."

$i = 1
foreach ($f in $files) {
    $dest = Join-Path $dst "ss-manual-$i.png"
    Copy-Item $f.FullName $dest -Force
    Write-Host "Copied: $($f.Name) -> ss-manual-$i.png"
    $i++
}

Write-Host ""
Write-Host "Done! Check D:\parabank\reports\ for ss-manual-*.png files"
Pause
