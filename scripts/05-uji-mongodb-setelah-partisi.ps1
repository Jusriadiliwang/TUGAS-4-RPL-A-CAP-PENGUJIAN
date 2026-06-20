Write-Host "=== UJI MONGODB SETELAH PARTITION ===" -ForegroundColor Cyan

Write-Host "Mencoba menulis data pada node yang terisolasi..." -ForegroundColor Yellow

$cmd = 'db = db.getSiblingDB("cap_demo"); db.users.insertOne({nama:"Data Partition", keterangan:"Data ditulis saat jaringan terputus", waktu:new Date()})'
docker exec cap-mongo-node1 mongosh --quiet --eval $cmd

Write-Host ""
Write-Host "HASIL YANG DIHARAPKAN:" -ForegroundColor Cyan
Write-Host "- Muncul error seperti not primary / not writable primary, atau operasi tulis ditolak."
Write-Host "- Ini menunjukkan karakteristik CP: MongoDB menjaga konsistensi data dan mengorbankan availability sementara." -ForegroundColor Green
Write-Host ""
Write-Host "Lanjut ke 06-pulihkan-mongodb.ps1 untuk menyambungkan node kembali." -ForegroundColor Yellow
