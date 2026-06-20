# Laporan Pengujian Ringkas Teorema CAP

## 1. Tujuan Pengujian

Pengujian ini bertujuan untuk memahami perilaku sistem terdistribusi berdasarkan Teorema CAP, yaitu Consistency, Availability, dan Partition Tolerance.

## 2. Objek Pengujian

- MongoDB digunakan sebagai contoh sistem CP.
- Apache Cassandra digunakan sebagai contoh sistem AP.

## 3. Skenario MongoDB CP

Pada kondisi normal, MongoDB dapat menyimpan data dan melakukan replikasi antar node. Setelah dilakukan simulasi gangguan jaringan pada salah satu node, MongoDB menolak operasi penulisan tertentu karena node tersebut tidak dapat menjamin konsistensi data dengan node lain.

Hasil ini menunjukkan bahwa MongoDB lebih mengutamakan konsistensi data dibandingkan ketersediaan layanan sementara.

## 4. Skenario Cassandra AP

Pada Cassandra, setelah terjadi simulasi gangguan jaringan, node tetap dapat memberikan respons terhadap query lokal. Hal ini menunjukkan bahwa Cassandra lebih mengutamakan ketersediaan layanan agar sistem tetap dapat diakses.

Konsekuensinya, data yang dibaca dapat berisiko belum sinkron sepenuhnya dengan node lain.

## 5. Tabel Hasil Pengujian

| Aspek | MongoDB | Apache Cassandra |
|---|---|---|
| Model CAP | CP | AP |
| Prioritas | Konsistensi data | Ketersediaan layanan |
| Saat partition | Menolak operasi tertentu | Tetap memberikan respons |
| Risiko | Downtime sementara | Stale data |
| Cocok untuk | Bank, payment gateway, data medis | Media sosial, marketplace, search engine |

## 6. Kesimpulan

Berdasarkan hasil pengujian, MongoDB menunjukkan karakteristik CP karena lebih memilih menjaga konsistensi data meskipun layanan dapat terganggu sementara. Apache Cassandra menunjukkan karakteristik AP karena tetap memberikan respons meskipun data berisiko belum sinkron sepenuhnya.

Pemilihan sistem CP atau AP harus disesuaikan dengan kebutuhan aplikasi. Jika aplikasi membutuhkan data yang sangat akurat, CP lebih tepat digunakan. Jika aplikasi membutuhkan layanan tetap aktif, AP lebih sesuai.
