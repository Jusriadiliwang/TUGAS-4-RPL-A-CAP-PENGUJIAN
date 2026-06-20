Write-Host "=== UJI CASSANDRA KONDISI NORMAL ===" -ForegroundColor Cyan

docker exec cap-cassandra-node1 cqlsh -e "SELECT * FROM cap_demo.users;"

Write-Host ""
Write-Host "Jika data tampil, Cassandra berjalan normal." -ForegroundColor Green
Write-Host "Lanjut ke 09-simulasi-partisi-cassandra.ps1" -ForegroundColor Green
