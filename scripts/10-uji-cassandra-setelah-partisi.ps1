Write-Host "=== UJI CASSANDRA SETELAH PARTITION ===" -ForegroundColor Cyan

Write-Host "Menguji query lokal system.local pada node yang terisolasi..." -ForegroundColor Yellow
docker exec cap-cassandra-node1 cqlsh -e "SELECT key, bootstrapped, listen_address, data_center, rack FROM system.local;"

Write-Host ""
Write-Host "Menguji data aplikasi pada node yang terisolasi..." -ForegroundColor Yellow
docker exec cap-cassandra-node1 cqlsh -e "SELECT * FROM cap_demo.users;"

Write-Host ""
Write-Host "HASIL YANG DIHARAPKAN:" -ForegroundColor Cyan
Write-Host "- Cassandra tetap memberikan respons data lokal."
Write-Host "- Ini menunjukkan karakteristik AP: layanan tetap tersedia walaupun ada risiko data belum sinkron." -ForegroundColor Green
Write-Host ""
Write-Host "Lanjut ke 11-pulihkan-cassandra.ps1 untuk menyambungkan node kembali." -ForegroundColor Yellow
