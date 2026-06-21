NAMA : JUSRIADI LIWANG 
NIM  : 105841117023
BERIKUT INI PENJELASAN CARA MENJALANKANYA

# Program Pengujian Teorema CAP

Program ini dibuat untuk menguji konsep **CAP Theorem** pada sistem terdistribusi:

- **MongoDB** sebagai simulasi perilaku **CP** (*Consistency + Partition Tolerance*).
- **Apache Cassandra** sebagai simulasi perilaku **AP** (*Availability + Partition Tolerance*).

Saat terjadi gangguan jaringan (*partition*), MongoDB cenderung menolak operasi tertentu agar data tetap konsisten, sedangkan Cassandra tetap memberikan respons meskipun ada risiko data belum sepenuhnya sinkron.

---

## 1. Kebutuhan

Pastikan sudah terpasang:

- Docker Desktop
- VS Code
- PowerShell
- Koneksi internet untuk menarik image Docker

Cek Docker:

```powershell
docker --version
docker compose version
```

---

## 2. Struktur Folder

```text
CAP-Pengujian-Kelompok4
├── docker-compose.yml
├── README.md
├── scripts
│   ├── 00-cek-docker.ps1
│   ├── 01-jalankan-container.ps1
│   ├── 02-init-mongodb.ps1
│   ├── 03-uji-mongodb-normal.ps1
│   ├── 04-simulasi-partisi-mongodb.ps1
│   ├── 05-uji-mongodb-setelah-partisi.ps1
│   ├── 06-pulihkan-mongodb.ps1
│   ├── 07-init-cassandra.ps1
│   ├── 08-uji-cassandra-normal.ps1
│   ├── 09-simulasi-partisi-cassandra.ps1
│   ├── 10-uji-cassandra-setelah-partisi.ps1
│   ├── 11-pulihkan-cassandra.ps1
│   └── 12-matikan-semua.ps1
├── docs
│   └── LAPORAN_PENGUJIAN_RINGKAS.md
└── hasil-screenshot
```

---

## 3. Cara Menjalankan


### Langkah 1 — Cek Docker

```powershell
.\scripts\00-cek-docker.ps1
```

### Langkah 2 — Jalankan semua container

```powershell
.\scripts\01-jalankan-container.ps1
```

Tunggu sekitar **1 sampai 3 menit**, karena Cassandra membutuhkan waktu lebih lama untuk siap.

---

## 4. Pengujian MongoDB CP

### Inisialisasi MongoDB Replica Set

```powershell
.\scripts\02-init-mongodb.ps1
```

### Uji MongoDB dalam kondisi normal

```powershell
.\scripts\03-uji-mongodb-normal.ps1
```

Hasil yang diharapkan: data berhasil ditulis dan dibaca.

### Simulasi partition pada MongoDB

```powershell
.\scripts\04-simulasi-partisi-mongodb.ps1
```

### Uji MongoDB setelah partition

```powershell
.\scripts\05-uji-mongodb-setelah-partisi.ps1
```

Hasil yang diharapkan: MongoDB menolak operasi penulisan atau menampilkan error seperti:

```text
not primary
not writable primary
```

Ini menunjukkan bahwa MongoDB mengutamakan **Consistency** dibanding **Availability**.

### Pulihkan MongoDB

```powershell
.\scripts\06-pulihkan-mongodb.ps1
```

---

## 5. Pengujian Cassandra AP

### Inisialisasi Cassandra

```powershell
.\scripts\07-init-cassandra.ps1
```

### Uji Cassandra dalam kondisi normal

```powershell
.\scripts\08-uji-cassandra-normal.ps1
```

### Simulasi partition pada Cassandra

```powershell
.\scripts\09-simulasi-partisi-cassandra.ps1
```

### Uji Cassandra setelah partition

```powershell
.\scripts\10-uji-cassandra-setelah-partisi.ps1
```

Hasil yang diharapkan: Cassandra tetap memberikan respons data lokal, misalnya dari query:

```sql
SELECT * FROM system.local;
```

Ini menunjukkan bahwa Cassandra mengutamakan **Availability** dibanding **Consistency langsung**.

### Pulihkan Cassandra

```powershell
.\scripts\11-pulihkan-cassandra.ps1
```

---

## 6. Matikan Semua Container

Jika pengujian selesai, jalankan:

```powershell
.\scripts\12-matikan-semua.ps1
```

## 7. Catatan Penting

Jika PowerShell menolak menjalankan script `.ps1`, jalankan perintah ini sekali saja:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

Lalu ulangi script yang ingin dijalankan.

---

