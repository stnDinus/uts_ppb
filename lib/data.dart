class ItemMenu {
  String nama, deskripsi, linkGambar;
  int harga;
  ItemMenu(this.nama, this.deskripsi, this.linkGambar, this.harga);
}

List<ItemMenu> menuImitasi = [
  ItemMenu(
    "Nasi Goreng",
    "Nasi goreng, an Indonesian fried rice dish, often served with chicken, prawns, and a fried egg.",
    "assets/nasi-goreng.webp",
    15000,
  ),
  ItemMenu(
    "Rendang",
    "Rendang is a flavorful and tender Indonesian beef stew, simmered with coconut milk and a blend of spices.",
    "assets/rendang.jpg",
    20000,
  ),
  ItemMenu(
    "Sate Ayam",
    "Sate ayam, or chicken satay, features skewered and grilled chicken served with a peanut sauce.",
    "assets/sate-ayam.jpg",
    10000,
  ),
  ItemMenu(
    "Gado-Gado",
    "Gado-gado is an Indonesian salad with a peanut sauce dressing, made with mixed vegetables and tofu.",
    "assets/gado-gado.jpg",
    7500,
  ),
  ItemMenu(
    "Mie Goreng",
    "Mie goreng, or fried noodles, is a popular Indonesian dish with stir-fried noodles, vegetables, and your choice of protein.",
    "assets/mie-goreng.jpg",
    5000,
  ),
];
