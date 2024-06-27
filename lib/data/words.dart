import 'package:anki_like_app/models/word.dart';

//TODO insert below data into an SQLite database instead

final List<Word> words = [
  // Word(topic: "Beach", english: "Swimsuit",french: "Swimsuit", ghomala: "Yóu Yǒng Yī", character: "游泳衣"),
  // Word(
  //     topic: "Beach",
  //     english: "Swimsuit",
  //     pinyin: "Yóu Yǒng Yī",
  //     character: "游泳衣"),
  // Word(topic: "Beach", english: "Seashell", pinyin: "Bèi Ké", character: "贝壳"),
  // Word(
  //     topic: "Beach",
  //     english: "Sunscreen",
  //     pinyin: "Fáng Shài Shuāng",
  //     character: "防晒霜"),
  // Word(
  //     topic: "Beach",
  //     english: "Surfboard",
  //     pinyin: "Chōng Làng Bǎn",
  //     character: "冲浪板"),

  // Word(topic: "Birds", english: "Kiwi", pinyin: "Qí Yì Niǎo", character: "奇异鸟"),
  // Word(topic: "Birds", english: "Duck", pinyin: "Yā Zi", character: "鸭子"),
  // Word(
  //     topic: "Birds",
  //     english: "Flamingo",
  //     pinyin: "Huǒ Liè Niǎo",
  //     character: "火烈鸟"),

  // Word(topic: "Body", english: "Nose", pinyin: "Bí Zi", character: "鼻子"),
  // Word(topic: "Body", english: "Eye", pinyin: "Yǎn Jīng", character: "眼睛"),
  // Word(topic: "Body", english: "Mouth", pinyin: "Zuǐ Ba", character: "嘴巴"),
  // Word(topic: "Body", english: "Ear", pinyin: "Ěr Duo", character: "耳朵"),

  // Word(topic: "City", english: "Hospital", pinyin: "Yī Yuàn", character: "医院"),
  // Word(
  //     topic: "City",
  //     english: "Fire Station",
  //     pinyin: "Xiāo Fáng jú",
  //     character: "消防局"),
  // Word(topic: "City", english: "Bank", pinyin: "Yín Háng", character: "银行"),

  // Word(
  //     topic: "Dessert",
  //     english: "Ice Cream",
  //     pinyin: "Bīng Qín Lín",
  //     character: "冰淇淋"),
  // Word(
  //     topic: "Dessert",
  //     english: "Chocolate",
  //     pinyin: "Qiǎo Kè Lì",
  //     character: "巧克力"),
  // Word(
  //     topic: "Dessert",
  //     english: "Donut",
  //     pinyin: "Tián Tián Quān",
  //     character: "甜甜圈"),

  // Word(topic: "Drinks", english: "Juice", pinyin: "Guǒ Zhī", character: "果汁"),
  // Word(topic: "Drinks", english: "Beer", pinyin: "Pí Jiǔ", character: "啤酒"),
  // Word(topic: "Drinks", english: "Milk", pinyin: "Niú Nǎi", character: "牛奶"),

  // Word(topic: "Fruit", english: "Apple", pinyin: "Píng Guǒ", character: "苹果"),
  // Word(topic: "Fruit", english: "Orange", pinyin: "Jú Zi", character: "橘子"),
  // Word(
  //     topic: "Fruit", english: "Banana", pinyin: "Xiāng Jiāo", character: "香蕉"),

  // Word(
  //     topic: "Insects",
  //     english: "Grasshopper",
  //     pinyin: "Zhà Měng",
  //     character: "蚱蜢"),
  // Word(topic: "Insects", english: "Fly", pinyin: "Cāng Yíng", character: "苍蝇"),
  // Word(topic: "Insects", english: "Spider", pinyin: "Zhī Zhū", character: "蜘蛛"),

  // Word(
  //     topic: "Jobs",
  //     english: "Police Officer",
  //     pinyin: "Jǐng Chá",
  //     character: "警察"),
  // Word(
  //     topic: "Jobs",
  //     english: "Construction Worker",
  //     pinyin: "Jiàn Zhú Gōng Rén",
  //     character: "建筑工人"),
  // Word(
  //     topic: "Jobs", english: "Detective", pinyin: "Zhēn Tàn", character: "侦探"),

  
  //Ajoutez
  /*
  /**
   * Animals
   */
  Word(
      topic: "Land Animals",
      english: "Lion",
      pinyin: "naange",
      character: "Naange"),
  Word(
      topic: "Land Animals",
      english: "Dog",
      pinyin: "baali",
      character: "Baali"),
  Word(
      topic: "Land Animals",
      english: "Cat",
      pinyin: "nyamre",
      character: "Nyamre"),
  Word(
      topic: "Land Animals",
      english: "Elephant",
      pinyin: "nggiiru",
      character: "Nggiiru"),
  Word(
      topic: "Land Animals",
      english: "Cow",
      pinyin: "ndagu",
      character: "Ndagu"),

  /**
   * Nutrition
   */

  Word(
      topic: "Nutrition",
      english: "Bread",
      pinyin: "nàm-bu-ru",
      character: "Nàmmburu"),
  Word(
      topic: "Nutrition", english: "Rice", pinyin: "la-lo", character: "Laalo"),
  Word(
      topic: "Nutrition",
      english: "Meat",
      pinyin: "nyir-i",
      character: "Nyiri"),
  Word(
      topic: "Nutrition", english: "Milk", pinyin: "ha-ko", character: "Hàako"),
  Word(
      topic: "Nutrition",
      english: "Pepper",
      pinyin: "jan-go",
      character: "Jango"),

  /**
   * Appartment
   */
  Word(
      topic: "Appartment",
      english: "House",
      pinyin: "soo-doo",
      character: "Suudu"),
  Word(
      topic: "Appartment",
      english: "Roof",
      pinyin: "daan-deh",
      character: "Ɗaande"),
  Word(
      topic: "Appartment",
      english: "Kitchen",
      pinyin: "chu-dee",
      character: "Cuudhi"),
  Word(
      topic: "Appartment",
      english: "Door",
      pinyin: "le-pohl",
      character: "Leppol"),
  Word(
      topic: "Appartment",
      english: "House",
      pinyin: "fa-lan-deh",
      character: "Falaande"),

  /**
   * Temps & Climat
   */
  Word(
      topic: "Climate",
      english: "Rain",
      pinyin: "ee-yen-day",
      character: "Iyeende"),
  Word(
      topic: "Climate",
      english: "Rainning",
      pinyin: "toe-ba",
      character: "Toba"),
  Word(
      topic: "Climate",
      english: "Rain Cloud",
      pinyin: "nar-gay-wol",
      character: "Naargewol"),
  Word(
      topic: "Climate",
      english: "Heavy Rain",
      pinyin: "roo-fa",
      character: "Rufa"),
  Word(
      topic: "Climate",
      english: "Cloud",
      pinyin: "roo-ul-deh",
      character: "Ruulde"),
    */

  Word(topic: "Land Animals", english: "Dog", pinyin: "ngal", character: "gal"),
  Word(
      topic: "Land Animals",
      english: "Bear",
      pinyin: "kooluko",
      character: "kou-lou-ko"),
  Word(
      topic: "Land Animals",
      english: "Beaver",
      pinyin: "baɗɗo",
      character: "ba-d-do"),
  Word(
      topic: "Land Animals",
      english: "Camel",
      pinyin: "ngarma",
      character: "ngar-ma"),

  Word(
      topic: "Marine Life",
      english: "Dolphin",
      pinyin: "dufu",
      character: "dou-fou"),
  Word(
      topic: "Marine Life",
      english: "Shark",
      pinyin: "homa",
      character: "ho-ma"),
  Word(
      topic: "Marine Life",
      english: "Whale",
      pinyin: "Jabɗal",
      character: "Jah-bdal"),

  Word(
      topic: "Music",
      english: "Piano",
      pinyin: "Bindeekol",
      character: "Bin-dey-kol"),
  Word(
      topic: "Music",
      english: "Flute",
      pinyin: "Rufeere",
      character: "Roo-fay-ray"),

  Word(
      topic: "Nature", english: "Tree", pinyin: "Njoowi", character: "Nyo-wee"),
  Word(topic: "Nature", english: "Rock", pinyin: "Daggi", character: "Da-gi"),

  Word(
      topic: "School",
      english: "School Bag",
      pinyin: "Kofnol",
      character: "\ˈkɔf.nɔl"),
  Word(
      topic: "School",
      english: "Computer",
      pinyin: "Kompita",
      character: "\ˈkɔm.pi.ta"),
  Word(
      topic: "School",
      english: "Pen",
      pinyin: "Ledduɓe",
      character: "\ˈlɛd.dʊ.ɓe"),

  Word(
      topic: "Shapes",
      english: "Triangle",
      pinyin: "Namru neɗɗi",
      character: "\ˈnam.ru ˈnɛɗ.ɗi"),
  Word(
      topic: "Shapes",
      english: "Circle",
      pinyin: "Laaɗi",
      character: "\ˈlaː.ɗi"),

  Word(
      topic: "Sports",
      english: "Tennis",
      pinyin: "Tenis",
      character: "\ˈtɛ.nis"),
  Word(
      topic: "Sports",
      english: "Rugby",
      pinyin: "Rugbi",
      character: "\ˈrʊg.bi"),
  Word(
      topic: "Sports", english: "Golf", pinyin: "Golfu", character: "\ˈgɔl.fu"),

  Word(
      topic: "Vehicles",
      english: "Motorbike",
      pinyin: "Motto",
      character: "\ˈmɔt.to"),
  Word(
      topic: "Vehicles",
      english: "Train",
      pinyin: "lawol dilli",
      character: "la-wol-dil-li"),
  Word(
      topic: "Vehicles",
      english: "Truck",
      pinyin: "ɲaambaajo",
      character: "nyan-ba-jo"),

  Word(
      topic: "Weather",
      english: "Rain",
      pinyin: "iyeende",
      character: "i-yen-dé"),
  Word(topic: "Weather", english: "Sun", pinyin: "naange", character: "nan-gé"),
  Word(
      topic: "Weather",
      english: "Cloud",
      pinyin: "roulde",
      character: "roul-dé"),
];
