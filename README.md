# 📘 SIAKAD - Sistem Informasi Akademik

Proyek ini adalah Sistem Informasi Akademik (SIAKAD) berbasis web yang dikembangkan menggunakan PHP (CodeIgniter 3) dan MySQL, serta dikemas dalam container menggunakan Docker.

## 🚀 Fitur Utama
- Manajemen data siswa, guru, mata pelajaran, dan nilai
- Autentikasi pengguna
- Role-based access (admin/guru/keuangan)
- CRUD data akademik
- Dashboard informatif

## 🐳 Teknologi
- PHP 7.4 (Apache)
- CodeIgniter 3
- MySQL 5.7
- Docker & Docker Compose
- phpMyAdmin (opsional untuk manajemen DB)

---

## 📦 Struktur Proyek

```bash
.
├── app/                  # Folder aplikasi berisi CodeIgniter dan Dockerfile
│   ├── siakad/           # Source code aplikasi
│   └── Dockerfile        # Build PHP + Apache container
├── docker-compose.yaml   # Konfigurasi container
├── .env                  # Variabel environment (jangan upload ke publik)
└── README.md             # Dokumentasi proyek ini
