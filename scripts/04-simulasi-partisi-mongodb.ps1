Write-Host "=== SIMULASI PARTITION PADA MONGODB ===" -ForegroundColor Cyan

Write-Host "Memutus cap-mongo-node1 dari cap-network..." -ForegroundColor Yellow
docker network disconnect cap-network cap-mongo-node1

Write-Host ""
Write-Host "Menunggu MongoDB mendeteksi gangguan jaringan..." -ForegroundColor Yellow
Start-Sleep -Seconds 20

Write-Host ""
Write-Host "Partition MongoDB selesai. Lanjut ke 05-uji-mongodb-setelah-partisi.ps1" -ForegroundColor Green
