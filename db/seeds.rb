spots = [
  { name: "トラベラーズファクトリー（TRAVELER'S FACTORY）", address: "東京都目黒区 上目黒３丁目１３−１０", lat: 35.644771, lon: 139.697293 },
  { name: "SIIGE（シージェ）", address: "東京都目黒区上目黒1-2-9 ハイネス中目黒103", lat: 35.645450, lon: 139.701129 },
  { name: "タヴァーン（TAVERN）", address: "東京都目黒区上目黒1-5-7 代官山関ビル 1F", lat: 35.644385, lon: 139.700890 },
  { name: "バー サンダーボルト", address: "東京都目黒区上目黒1-3-19 上目黒SSビル 2F", lat: 35.645224, lon: 139.700696 },
  { name: "キャンドルスタジオ代官山", address: "東京都目黒区上目黒１丁目１０−３", lat: 35.647171, lon: 139.698801 },
  { name: "Five Star Cafe 五星鶏飯", address: "東京都目黒区 上目黒3丁目12-4", lat: 35.644657, lon: 139.697160 },
  { name: "一饗", address: "東京都目黒区上目黒2-10-7アサミビル 1F", lat: 35.641474, lon: 139.699534 },
  { name: "SOAKS(ソークス)", address: "東京都目黒区上目黒1-5-10", lat: 35.644646, lon: 139.700554 },
  { name: "1LDK apartments.", address: "東京都目黒区上目黒1-7-13 b-town中目黒 EAST 1階", lat: 35.645663, lon: 139.700052 },
  { name: "KIRARA（キララ）", address: "東京都目黒区上目黒3-8-3 4Ｆ", lat: 35.644660, lon: 139.698049 },
  { name: "パティスリー・ポタジエ", address: "東京都目黒区上目黒2-44-9", lat: 35.641432, lon: 139.696044 },
  { name: "バカめぐろ", address: "東京都目黒区上目黒３丁目１−１４ メイツ中目黒 1F", lat: 35.645417, lon: 139.697334 },
  { name: "EXILE TRIBE STATION", address: "東京都目黒区上目黒1-15-11 カーサピッコラ中目黒 1F", lat: 35.646471, lon: 139.698052 },
  { name: "olgou 古着屋", address: "東京都目黒区 上目黒１丁目１０−６", lat: 35.646920, lon: 139.698900 },
  { name: "いふう", address: "東京都目黒区上目黒２丁目７−１１", lat: 35.642821, lon: 139.699243 },
  { name: "夕月", address: "東京都目黒区上目黒２丁目４４−３", lat: 35.641766, lon: 139.696835 },
  { name: "串若丸", address: "東京都東京上目黒1-19-2", lat: 35.645350, lon: 139.698400 },
  { name: "カレコ・カーシェアリングクラブ　上目黒３丁目第１ＳＴ", address: "目黒区上目黒3-34-14", lat: 35.642291, lon: 139.693866 },
  { name: "MARZAC 7", address: "東京都目黒区上目黒1-14-5", lat: 35.646090, lon: 139.698671 },
  { name: "アカベコ", address: "東京都目黒区上目黒２丁目１２番地３", lat: 35.642535, lon: 139.698860 },
]

stations = [
  { name: "中目黒駅", lat: 35.644307, lon: 139.699160 },
  { name: "恵比寿駅", lat: 35.646690, lon: 139.710106 },
  { name: "代官山駅", lat: 35.648240, lon: 139.703500 },
  { name: "池尻大橋駅", lat: 35.650630, lon: 139.684600 },
]

spots.each { |spot| Spot.create(spot) }
stations.each { |station| Station.create(station) }
