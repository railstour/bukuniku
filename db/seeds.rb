# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(
  name: 'adam pahlevi',
  email: 'adam.pahlevi@example.com',
  password: 'Password01'
)

User.create(
  name: 'wendy kurniawan',
  email: 'wendy.kurniawan@example.com',
  password: 'Password01'

Book.create(
  title: 'Sherlock Holmes A Collectors Edition',
  author: 'Sir Arthur Conan Doyle',
  summary: 'Buku ini merupakan kumpulan dari 4 buku petualangan terbaik Sherlock Holmes, berisi 48 kisah misterius yang akan memuaskan para Sherlockian',
  image: 'https://images-na.ssl-images-amazon.com/images/I/51HWaRzG42L._SS100_.jpg',
  price: 169_150,
  quantity: 50
)

Book.create(
  title: 'Bumi Manusia',
  author: 'Pramoedya Ananta Toer',
  summary: 'mengambil latar belakang Indonesia di awal abad ke-20. Dengan membacanya kita dibalikkan hidup di era membibitnya pergerakan nasional mula-mula, percintaan, dan pertarungan kekuatan anonim para srikandi yang mengawal penyemaian bangunan nasional',
  image: 'http://wpc.21684.lambdacdn.net/8021684/cdn/media/catalog/product/cache/1/small_image/124x168/9df78eab33525d08d6e5fb8d27136e95/b/u/bumi-manusia_1.jpg',
  price: 112_200,
  quantity: 50
)

Book.create(
  title: 'Robin Hood',
  author: 'David B.coe',
  summary: 'ROBIN HOOD mengisahkan kehidupan seorang ahli memanah. yang hanya memikirkan dirinya sendiri. Akan tetapi, akhirnya ia dan teman-temannya merasa terpanggil untuk melakukan petualangan yang lebih besar.',
  image: 'http://ecx.images-amazon.com/images/I/516YD90ZZ2L.jpg',
  price: 112_200,
  quantity: 50
)

Book.create(
  title: 'Ramayana',
  author: 'Nyoman S. Pendit',
  summary: 'Epos Ramayana adalah salah satu warisan budaya Indonesia yang ' +
    'diadaptasi dari khazanah sastra klasik India. Epos yang ' +
    'sudah berabadabad dikenal di Indonesia dalam bentuk kakawin, ' +
    'relief Candi Prambanan, atau tarian-tarian ini, ditulis kembali ' +
    'oleh Nyoman S, Pendit, penulis Mahabharata (Penerbit Gramedia ' +
    'Pustaka Utama, 2015, cetakan ketujuh) dengan gaya bertutur ' +
    'yang memikat dan enak dibaca',
  image: 'http://wpc.21684.lambdacdn.net/8021684/cdn/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/6/1/615202006_ramayana_cu_cover_baru.jpg',
  price: 68_000,
  quantity: 25
)

Book.create(
  title: 'All Creatures Great and Small',
  author: 'James Herriot',
  summary: 'All Creatures Great and Small mengisahkan tentang James ' +
    'Herriot muda yang baru berpraktik sebagai dokter hewan di pedesaan ' +
    'Yorkshire. Kenyataan di lapangan ternyata sangat berbeda dari ' +
    "di kampus. \nBeberapa kasus yang dihadapinya sangat sulit, " +
    'misalnya kasus anjing yang sakit parah, milik seorang lelaki tua ' +
    'di desa; beberapa kasus lain lebih ringan dan menyenangkan, ' +
    'misalnya kunjungan rutin untuk memeriksa kesehatan Tricki Woo, ' +
    'anjing Peking yang terlalu dimanjakan. Banyak pula pengalaman ' +
    'mengharukan saat berinteraksi dengan para petani miskin ' +
    'yang mesti mati-matian mencari uang agar bisa mengurus ' +
    'ternak mereka dengan baik.',
  image: 'http://wpc.21684.lambdacdn.net/8021684/cdn/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/2/0/204094842_40201140101.jpg',
  price: 74_800,
  quantity: 54
)

Book.create(
  title: 'Hobbit',
  author: 'JRR Tolkien',
  summary: 'Inilah kisah Bilbo Baggins, Hobbit yang pendiam dan tenang. ' +
    'Hidupnya jungkir balik ketika ia bergabung dengan Gandalf sang ' +
    'penyihir dan 13 kurcaci dalam perjalanan untuk merebut kembali ' +
    'harta karun yang dicuri. Perjalanan mereka penuh bahaya––dan ' +
    'akhirnya Bilbo harus berhadapan dengan si penjaga harta, naga ' +
    'paling ditakuti di seluruh penjuru Middle-earth',
  image: 'http://wpc.21684.lambdacdn.net/8021684/cdn/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/2/0/202128507_the_hobbit-1.jpg',
  price: 83_300,
  quantity: 42
)

Book.create(
  title: 'Burung-Burung Rantau',
  author: 'Y. B. Mangunwijaya',
  summary: 'Burung-Burung Rantau mengisahkan pertempuran pikiran dan ' +
    'batin dalam keluarga Letnan-Jenderal Wiranto, seorang mantan ' +
    'duta besar, gerilyawan 45, dengan putra-putri dari generasi ' +
    'pasca Kemerdekaan',
  image: 'http://wpc.21684.lambdacdn.net/8021684/cdn/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/2/0/203914433_20101140029.jpg',
  price: 66_300,
  quantity: 36
)

Book.create(
  title: 'Le Me Forever Alone',
  author: 'Baro Indra',
  summary: 'Jomblo itu identik sama sendiri. Dan jomblo, ' +
    'nggak akan jauh-jauh dari yang namanya TV. Buat nemenin',
  image: 'http://wpc.21684.lambdacdn.net/8021684/cdn/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/p/r/pre0102_xl.jpg',
  price: 37_400,
  quantity: 21
)

Book.create(
  title: 'Burung-Burung Manyar',
  author: 'Y. B. Mangunwijaya',
  summary: 'A landmark novel, The Weaverbirds is a tale of both physical ' +
    'and spiritual struggle, spanning the formative days of Indonesian ' +
    'independence and the Indonesian oil crisis in the mid-1970s',
  image: 'http://wpc.21684.lambdacdn.net/8021684/cdn/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/3/8/3835805_9a071648-cea6-11e3-af61-f8b04908a8c2.jpg',
  price: 58_650,
  quantity: 32
)
