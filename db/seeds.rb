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
)

sherlock = Book.create(
  title: 'Sherlock Holmes A Collectors Edition',
  author: 'Sir Arthur Conan Doyle',
  summary: 'Buku ini merupakan kumpulan dari 4 buku petualangan terbaik ' +
    'Sherlock Holmes, berisi 48 kisah misterius yang akan memuaskan ' +
    'para Sherlockian',
  image: 'sherlock1.jpg',
  price: 169_150,
  quantity: 50
)

Book.create(
  title: 'Bumi Manusia',
  author: 'Pramoedya Ananta Toer',
  summary: 'mengambil latar belakang Indonesia di awal abad ke-20. ' +
    'Dengan membacanya kita dibalikkan hidup di era membibitnya ' +
    'pergerakan nasional mula-mula, percintaan, dan pertarungan ' +
    'kekuatan anonim para srikandi yang mengawal penyemaian '+
    'bangunan nasional',
  image: 'bumi1.jpg',
  price: 112_200,
  quantity: 50
)

Book.create(
  title: 'Robin Hood',
  author: 'David B.coe',
  summary: 'Robin Hood mengisahkan kehidupan seorang ahli memanah ' +
    'yang hanya memikirkan dirinya sendiri. Akan tetapi, akhirnya ' +
    'ia dan teman-temannya merasa terpanggil untuk melakukan petualangan ' +
    'yang lebih besar.',
  image: 'robin1.jpg',
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
  image: 'ramayana1.jpg',
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
  image: 'acgs1.jpg',
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
  image: 'hobbit1.jpg',
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
  image: 'burungrantau1.jpg',
  price: 66_300,
  quantity: 36
)

Book.create(
  title: 'Le Me Forever Alone',
  author: 'Baro Indra',
  summary: 'Jomblo itu identik sama sendiri. Dan jomblo, ' +
    'nggak akan jauh-jauh dari yang namanya TV. Buat nemenin',
  image: 'leme1.jpg',
  price: 37_400,
  quantity: 21
)

Book.create(
  title: 'Burung-Burung Manyar',
  author: 'Y. B. Mangunwijaya',
  summary: 'A landmark novel, The Weaverbirds is a tale of both physical ' +
    'and spiritual struggle, spanning the formative days of Indonesian ' +
    'independence and the Indonesian oil crisis in the mid-1970s',
  image: 'bmanyar1.jpg',
  price: 58_650,
  quantity: 32
)

# create reviews

{
  "Ardian Wisnu" => "Buku ini bagus dan mudah untuk dibaca",
  "Yesika" => "Anak saya suka buku ini, tentang teka-tekinya, menarik juga " +
    "untuk dibaca orang dewasa",
  "Eko" => "Buku ini adalah buku detektif favorit saya, wajib dibeli bagi " +
    "pencinta buku-buku detektif, terlebih penggemar sosok Sherlock Holmes",
  "Rianti" => "Ok sih. Gak ngrasa, waktu bagaikan terbang waktu baca buku ini!",
  "Dewanto Iswara" => "Gak ada buku detektif-detektifan yang lebih bagus!",
  "Indra" => "Bukunya cepet sampai! Thanks Bukuniku! Buku ini menarik banget!"
}.each do |author, comment|
  user = User.new(
    name: author,
    email: author.split.join("_") + "@example.com",
    password: 'Password01'
  )
  user.save!

  star = (3..4).to_a.sample

  review = Review.create(
    reviewer: user,
    book: sherlock,
    star: star,
    text: comment
  )
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')