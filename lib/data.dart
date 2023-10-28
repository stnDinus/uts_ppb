class Item {
  String nama, deskripsi, deskripsiDetail, linkGambar;
  int harga;
  Item(this.nama, this.deskripsi, this.deskripsiDetail, this.linkGambar,
      this.harga);
}

List<Item> listItem = [
  Item(
    "Jeruk",
    "Buah jeruk segar hasil pertanian.",
    "Jeruk (Citrus sinensis) adalah buah segar dengan rasa manis dan asam yang berasal dari pohon jeruk. Buah jeruk sering digunakan untuk diolah menjadi jus segar. Jeruk mengandung banyak vitamin C dan serat yang baik untuk kesehatan tubuh. Buah ini dapat tumbuh subur di daerah beriklim tropis dan subtropis.",
    "assets/jeruk.jpg",
    10000,
  ),
  Item(
    "Pohon Mangga",
    "Bibit pohon mangga untuk ditanam.",
    "Pohon mangga (Mangifera indica) adalah pohon buah yang menghasilkan buah mangga. Buah mangga terkenal dengan rasa manisnya yang lezat. Bibit pohon mangga cocok untuk ditanam di halaman rumah atau kebun. Pohon mangga memerlukan sinar matahari yang cukup dan perawatan yang baik untuk menghasilkan buah yang berkualitas.",
    "assets/mangga.jpg",
    12000,
  ),
  Item(
    "Pupuk Cair Organik",
    "Pupuk cair organik untuk pertanian.",
    "Pupuk cair organik adalah pupuk yang terbuat dari bahan-bahan alami seperti kompos, limbah organik, dan mikroorganisme. Pupuk ini membantu meningkatkan kesuburan tanah dan memberikan nutrisi yang dibutuhkan tanaman. Pupuk cair organik cocok digunakan untuk pertanian organik dan ramah lingkungan.",
    "assets/pupuk.jpg",
    15000,
  ),
  Item(
    "Tebu",
    "Gula tebu hasil pertanian.",
    "Tebu (Saccharum officinarum) adalah tanaman yang menghasilkan tebu, bahan baku untuk gula. Tebu ditanam dalam skala besar untuk menghasilkan gula dalam berbagai bentuk, termasuk gula pasir dan gula cair. Hasil pertanian tebu adalah komoditas penting dalam industri pangan.",
    "assets/tebu.jpg",
    11000,
  ),
  Item(
    "Bibit Kelapa",
    "Bibit kelapa untuk ditanam.",
    "Bibit kelapa adalah tanaman kelapa muda yang siap ditanam. Kelapa adalah salah satu pohon penting dalam ekosistem tropis dan subtropis. Buah kelapa menghasilkan air kelapa segar dan daging kelapa yang dapat digunakan dalam berbagai hidangan.",
    "assets/kelapa.jpg",
    13000,
  ),
  Item(
    "Pupuk NPK",
    "Pupuk NPK untuk pertanian.",
    "Pupuk NPK adalah pupuk komersial yang mengandung campuran nitrogen (N), fosfor (P), dan kalium (K). Nutrisi ini penting untuk pertumbuhan tanaman dan produksi hasil yang baik. Pupuk NPK digunakan secara luas dalam pertanian modern untuk meningkatkan hasil panen.",
    "assets/npk.jpg",
    14000,
  ),
  Item(
    "Tomat",
    "Tomat segar hasil pertanian.",
    "Tomat (Solanum lycopersicum) adalah buah sayuran yang sering digunakan dalam berbagai hidangan. Tomat segar mengandung vitamin C, vitamin A, dan likopen yang baik untuk kesehatan. Buah ini dapat dikonsumsi segar atau digunakan dalam masakan.",
    "assets/tomat.jpg",
    12000,
  ),
  Item(
    "Bibit Jeruk",
    "Bibit jeruk untuk ditanam.",
    "Bibit jeruk adalah tanaman muda dari pohon jeruk yang siap ditanam. Jeruk adalah sumber vitamin C yang baik dan sering digunakan untuk diolah menjadi minuman segar. Tanaman jeruk memerlukan perawatan yang baik untuk menghasilkan buah yang berkualitas.",
    "assets/bibit-jeruk.jpg",
    11000,
  ),
  Item(
    "Pupuk Organik Granular",
    "Pupuk organik granular untuk pertanian.",
    "Pupuk organik granular adalah pupuk yang terbuat dari bahan-bahan organik seperti kompos, pupuk kandang, dan bahan alami lainnya. Pupuk ini membantu meningkatkan kesuburan tanah dan memberikan nutrisi yang dibutuhkan tanaman dengan cara yang ramah lingkungan. Cocok untuk pertanian organik.",
    "assets/granular.jpg",
    16000,
  ),
  Item(
    "Stroberi",
    "Stroberi segar hasil pertanian.",
    "Stroberi (Fragaria × ananassa) adalah buah segar dengan rasa manis yang populer. Stroberi mengandung vitamin C, serat, dan antioksidan yang baik untuk kesehatan. Buah ini sering digunakan dalam hidangan penutup seperti tart dan es krim.",
    "assets/stroberi.jpg",
    13000,
  ),
];
