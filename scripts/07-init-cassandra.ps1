Write-Host "=== INISIALISASI CASSANDRA ===" -ForegroundColor Cyan

Write-Host "Cassandra biasanya membutuhkan waktu lebih lama untuk siap." -ForegroundColor Yellow
Write-Host "Menunggu 90 detik..." -ForegroundColor Yellow
Start-Sleep -Seconds 90

Write-Host "Mengecek status cluster Cassandra..." -ForegroundColor Cyan
docker exec cap-cassandra-node1 nodetool status

Write-Host ""
Write-Host "Membuat keyspace dan tabel..." -ForegroundColor Cyan
docker exec cap-cassandra-node1 cqlsh -e "CREATE KEYSPACE IF NOT EXISTS cap_demo WITH replication = {'class':'SimpleStrategy','replication_factor':2};"
docker exec cap-cassandra-node1 cqlsh -e "CREATE TABLE IF NOT EXISTS cap_demo.users (id int PRIMARY KEY, nama text, keterangan text);"
docker exec cap-cassandra-node1 cqlsh -e "INSERT INTO cap_demo.users (id,nama,keterangan) VALUES (1,'Jusri','Data normal Cassandra sebelum partition');"

Write-Host ""
Write-Host "Inisialisasi Cassandra selesai. Lanjut ke 08-uji-cassandra-normal.ps1" -ForegroundColor Green
