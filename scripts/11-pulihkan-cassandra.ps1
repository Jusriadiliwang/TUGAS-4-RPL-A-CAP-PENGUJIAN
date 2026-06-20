Write-Host "=== MEMULIHKAN CASSANDRA ===" -ForegroundColor Cyan

Write-Host "Menyambungkan kembali cap-cassandra-node1 ke cap-network..." -ForegroundColor Yellow
docker network connect cap-network cap-cassandra-node1

Write-Host "Menunggu pemulihan cluster..." -ForegroundColor Yellow
Start-Sleep -Seconds 30

docker exec cap-cassandra-node1 nodetool status

Write-Host ""
Write-Host "Cassandra sudah dipulihkan." -ForegroundColor Green
