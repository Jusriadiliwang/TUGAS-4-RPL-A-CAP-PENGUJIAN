Write-Host "=== SIMULASI PARTITION PADA CASSANDRA ===" -ForegroundColor Cyan

Write-Host "Memutus cap-cassandra-node1 dari cap-network..." -ForegroundColor Yellow
docker network disconnect cap-network cap-cassandra-node1

Write-Host ""
Write-Host "Partition Cassandra selesai. Lanjut ke 10-uji-cassandra-setelah-partisi.ps1" -ForegroundColor Green
