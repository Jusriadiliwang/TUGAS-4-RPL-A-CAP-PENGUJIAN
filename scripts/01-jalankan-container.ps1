Write-Host "=== MENJALANKAN CONTAINER CAP TEST ===" -ForegroundColor Cyan
docker compose up -d

Write-Host ""
Write-Host "Container sedang dijalankan..." -ForegroundColor Yellow
docker ps

Write-Host ""
Write-Host "Tunggu sekitar 1-3 menit, terutama untuk Cassandra." -ForegroundColor Yellow
Write-Host "Setelah itu lanjutkan ke:" -ForegroundColor Green
Write-Host ".\scripts\02-init-mongodb.ps1"
