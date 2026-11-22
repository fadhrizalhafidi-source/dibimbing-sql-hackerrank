# Reflection Questions

## 1. Ketika membangun solusi untuk setiap studi kasus, bagaimana Anda menentukan struktur query yang paling efektif (misalnya memutuskan kapan menggunakan CTE, kapan cukup dengan subquery, atau kapan window function lebih tepat dibanding agregasi biasa)? Jelaskan bagaimana pertimbangan tersebut membantu Anda menghasilkan query yang lebih terstruktur, mudah diuji, dan efisien.

Saya memulai dengan memahami grain data, yaitu setiap baris mewakili data apa, serta bentuk hasil akhir yang diminta. Pemahaman grain data ini penting ketika ingin melakukan agregasi. Setelah itu, saya menentukan tabel yang perlu digabungkan, filter (baik filter pada data langsung atau filter data hasil agregasi), tahapan perhitungan, dan sorting data. Cara ini membantu saya memilih struktur query yang sesuai dan efisien dengan pertanyaan bisnis.

- **CTE**  digunakan untuk membuat tabel sementara yang dapat digunakan berulang kali. Selain itu dapat digunakan untuk memisahkan proses menjadi tahapan yang mudah dibaca dan diperiksa.
- **Subquery** dapat menjadi alternatif untuk perhitungan sederhana dengan satu hasil antara.
- **Window function** digunakan ketika membutuhkan perhitungan per kelompok sambil mempertahankan detail baris, alih-alih membuat beberapa CTE agregasi lalu join table.
- **Agregasi biasa** digunakan untuk membuat summary data.

Contohnya, pada *Top Competitors*, CTE memisahkan penentuan skor maksimum, penghitungan challenge yang berhasil, dan penggabungan identitas peserta. Struktur ini memudahkan pemeriksaan hasil setiap tahap dan potensi duplikasi. Untuk efisiensi, saya mempertimbangkan penyaringan serta agregasi sesuai kebutuhan; penggunaan CTE sendiri tidak otomatis mempercepat query.

## 2. Setelah mengerjakan seluruh soal, teknik SQL lanjutan apa yang menurut Anda paling memberi dampak pada cara Anda menganalisis dan memproses data (misalnya range join, window function, nested aggregation, atau CASE WHEN)? Jelaskan bagaimana teknik tersebut dapat membantu Anda menyelesaikan masalah data yang lebih kompleks di pekerjaan nyata.

Teknik yang paling berdampak adalah **window function dan agregasi bertahap**.

Pada *Ollivander’s Inventory*, window function membantu mencari biaya minimum setiap kelompok tanpa kehilangan identitas item. Pada *Contest Leaderboard*, saya menghitung skor maksimum setiap peserta per challenge sebelum menjumlahkannya menjadi total skor. Hal ini menunjukkan pentingnya urutan perhitungan dan ketepatan grain data.
