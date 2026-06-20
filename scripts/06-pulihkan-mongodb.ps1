Write-Host "=== MEMULIHKAN MONGODB ===" -ForegroundColor Cyan

Write-Host "Menyambungkan kembali cap-mongo-node1 ke cap-network..." -ForegroundColor Yellow
docker network connect cap-network cap-mongo-node1

Write-Host "Menunggu sinkronisasi ulang..." -ForegroundColor Yellow
Start-Sleep -Seconds 20

$status = 'rs.status().members.forEach(m => print(m.name + " => " + m.stateStr))'
docker exec cap-mongo-node2 mongosh --quiet --eval $status

Write-Host ""
Write-Host "MongoDB sudah dipulihkan." -ForegroundColor Green
