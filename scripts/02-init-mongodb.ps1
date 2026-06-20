Write-Host "=== INISIALISASI MONGODB REPLICA SET ===" -ForegroundColor Cyan

Write-Host "Menunggu MongoDB siap..." -ForegroundColor Yellow
Start-Sleep -Seconds 10

$init = 'rs.initiate({_id:"rs0",members:[{_id:0,host:"cap-mongo-node1:27017"},{_id:1,host:"cap-mongo-node2:27017"},{_id:2,host:"cap-mongo-node3:27017"}]})'
docker exec cap-mongo-node1 mongosh --quiet --eval $init

Write-Host ""
Write-Host "Menunggu proses pemilihan primary..." -ForegroundColor Yellow
Start-Sleep -Seconds 15

Write-Host ""
Write-Host "Status replica set:" -ForegroundColor Green
$status = 'rs.status().members.forEach(m => print(m.name + " => " + m.stateStr))'
docker exec cap-mongo-node1 mongosh --quiet --eval $status

Write-Host ""
Write-Host "Jika terlihat salah satu node PRIMARY, lanjut ke 03-uji-mongodb-normal.ps1" -ForegroundColor Green
