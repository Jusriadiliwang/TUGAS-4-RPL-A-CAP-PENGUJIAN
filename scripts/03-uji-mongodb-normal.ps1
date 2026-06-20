Write-Host "=== UJI MONGODB KONDISI NORMAL ===" -ForegroundColor Cyan

$cmd = 'db = db.getSiblingDB("cap_demo"); db.users.insertOne({nama:"Hizra", keterangan:"Data normal sebelum partition", waktu:new Date()}); printjson(db.users.find().toArray())'
docker exec cap-mongo-node1 mongosh --quiet --eval $cmd

Write-Host ""
Write-Host "Jika insert berhasil, berarti MongoDB berjalan normal dan data dapat disimpan." -ForegroundColor Green
Write-Host "Lanjut ke 04-simulasi-partisi-mongodb.ps1" -ForegroundColor Green
