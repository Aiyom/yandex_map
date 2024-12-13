
import 'dart:math';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:yandex_map/map/flutter_map_widget.dart';
import 'package:yandex_map/utils/extension_utils.dart';
import 'package:yandex_map/utils/snackbar.dart';
import 'package:yandex_map/resources/theme.dart';
import 'package:yandex_map/data/geometry_provider.dart';
import 'package:yandex_map/listeners/map_object_tap_listener.dart';
import 'package:yandex_map/listeners/map_size_changed_listener.dart';
import 'package:yandex_map/listeners/cluster_listener.dart';
import 'package:yandex_map/listeners/cluster_tap_listener.dart';
import 'package:yandex_map/listeners/map_object_drag_listener.dart';
import 'package:yandex_map/widgets/cluster_widget.dart';
import 'package:yandex_maps_mapkit_lite/image.dart' as image_provider;
import 'package:yandex_maps_mapkit_lite/init.dart' as init;
import 'package:yandex_maps_mapkit_lite/mapkit.dart' as mapkit;
import 'package:yandex_maps_mapkit_lite/ui_view.dart';
import 'package:yandex_maps_mapkit_lite/mapkit.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  await init.initMapkit(apiKey: dotenv.env["API_KEY"]!);
  final List data = [
    {
      "booking_url": "https://level.travel//hotels/9100815-Nostalji_Hostel",
      "hotel_id": 9100815,
      "hotel_name": "Nostalji Hostel",
      "hotel_category_name": "0*",
      "hotel_category": 0,
      "hotel_rating": "5.5",
      "hotel_preview": "https://img.cdn.level.travel/hotels/9100815/315ebecc61a571bdf5864a3d3c630c92.jpg",
      "hotel_pics": [
        {
          "x500": "https://img.cdn.level.travel/hotels/9100815/cb5528ee5c6d59663cf5ec920defb669.jpg",
          "webp_x620": "",
          "x245x240": "https://img.cdn.level.travel/hotels/9100815/8e1ae29144f09ac058a3755488b72002.jpg",
          "x290x135": "https://img.cdn.level.travel/hotels/9100815/7930ef4a36e62b671d5e35de3063f8b7.jpg"
        },
        {
          "x500": "https://img.cdn.level.travel/hotels/9100815/fe3fcf8667e68de4f01bf23d1101c2c7.jpg",
          "webp_x620": "",
          "x245x240": "https://img.cdn.level.travel/hotels/9100815/87abbe030b397058d695d9bbe9f7aef6.jpg",
          "x290x135": "https://img.cdn.level.travel/hotels/9100815/d3cf953040ea6f02636780d15b5ef5f6.jpg"
        },
        {
          "x500": "https://img.cdn.level.travel/hotels/9100815/3d7d7932f955a69a105eba2a3c7f2e84.jpg",
          "webp_x620": "",
          "x245x240": "https://img.cdn.level.travel/hotels/9100815/070b8429589dd246ca6ea22d63d22602.jpg",
          "x290x135": "https://img.cdn.level.travel/hotels/9100815/96271d7abb8a035c6b8c2e9a4852848b.jpg"
        }
      ],
      "operators": [
        8
      ],
      "hotel_city": "Бейоглу",
      "tour_price": 59170,
      "tour_identity": "MjEzfDIyNXwxMTUwOHw5ODN8fDIwMjQtMTItMjgsMjAyNC0xMi0yOHwwfDcsN3wxfDB8fHwwfDA=",
      "tour_id": "008-8ed54adf340f5388778c53862393fd7e",
      "system_type": "level_travel",
      "latitude": 41.041368,
      "longitude": 28.981458,
      "price_per_night": 8453,
      "max_price": 61484,
      "min_price": 59170,
      "meals": [
        "HB",
        "RO"
      ],
      "hotel_type": 13,
      "availability": {
        "flight": "n/a",
        "hotel": "n/a",
        "tooltip": "Нет информации, сколько осталось номеров и авиабилетов"
      },
      "features": {
        "construction_year": null,
        "renovation_year": null,
        "airport_distance": 45000,
        "beach_distance": null,
        "beach_size": null,
        "beach_type": null,
        "beach_surface": null,
        "area": null,
        "line": null,
        "wi_fi": null,
        "ski_lift_distance": null,
        "ski_in": false,
        "ski_out": false,
        "fitness": false,
        "aquapark": false,
        "nanny": false,
        "kids_menu": false,
        "kids_club": false,
        "kids_pool": false,
        "pool": false,
        "heated_pool": false,
        "aircon": true,
        "parking": false,
        "massage": false,
        "thermal_fun": false,
        "bar": false,
        "indoor_pool": false,
        "no_single_men": false,
        "min_age": null
      },
      "end_date": "2025-01-04",
      "region_name": "Бейоглу",
      "desc": "Экономичный хосте в азиатской части Стамбула. Гостей ждут простые общие номера и достопримечательности неподалеку.",
      "is_favorite": false,
      "favorite_id": 0
    },
    {
      "booking_url": "https://level.travel//hotels/9163034-Manu_Startup_House",
      "hotel_id": 9163034,
      "hotel_name": "Manu Startup House",
      "hotel_category_name": "3*",
      "hotel_category": 3,
      "hotel_rating": null,
      "hotel_preview": "https://img.cdn.level.travel/hotels/9163034/60889ed4998178babe85b0ac9296fe3a.jpg",
      "hotel_pics": [
        {
          "x500": "https://img.cdn.level.travel/hotels/9163034/fbd461135cc93bcfd8cb6477749c7b9f.jpg",
          "webp_x620": "https://img.cdn.level.travel/hotels/9163034/a8503a29acac5a8e926691e281a972a5_webp_x620.webp",
          "x245x240": "https://img.cdn.level.travel/hotels/9163034/c355e065e31813bbe774f555f3fc54e8.jpg",
          "x290x135": "https://img.cdn.level.travel/hotels/9163034/e7fa856e1fc890bb5827e2225cc61600.jpg"
        },
        {
          "x500": "https://img.cdn.level.travel/hotels/9163034/ba11bb2d3795adc58ecfa2506ce7e022.jpg",
          "webp_x620": "https://img.cdn.level.travel/hotels/9163034/64eb4cc99070118aaae8cc9d4f63d826_webp_x620.webp",
          "x245x240": "https://img.cdn.level.travel/hotels/9163034/b3b2f21c5311d8d466e5f49c6431e5c0.jpg",
          "x290x135": "https://img.cdn.level.travel/hotels/9163034/11e0903f0894a6639931c755df01b920.jpg"
        },
        {
          "x500": "https://img.cdn.level.travel/hotels/9163034/ac2f85cea3cc2c50dbe440e0311a99c2.jpg",
          "webp_x620": "https://img.cdn.level.travel/hotels/9163034/957362292c0aa918b1424b7dd3ce53fd_webp_x620.webp",
          "x245x240": "https://img.cdn.level.travel/hotels/9163034/9322dbeb6eac085d2177f493f87a4e30.jpg",
          "x290x135": "https://img.cdn.level.travel/hotels/9163034/1a4cdc195991de7222c83b9e508656b7.jpg"
        }
      ],
      "operators": [
        8
      ],
      "hotel_city": "Стамбул",
      "tour_price": 65231,
      "tour_identity": "MjEzfDIyNXwxMTUwOHw5ODN8fDIwMjQtMTItMjgsMjAyNC0xMi0yOHwwfDcsN3wxfDB8fHwwfDA=",
      "tour_id": "008-c0ddce1d3c8b9491faec7457c6e7ec0f",
      "system_type": "level_travel",
      "latitude": 41.1059820519,
      "longitude": 28.961035678,
      "price_per_night": 9319,
      "max_price": 65231,
      "min_price": 65231,
      "meals": [
        "RO"
      ],
      "hotel_type": 2,
      "availability": {
        "flight": "n/a",
        "hotel": "n/a",
        "tooltip": "Нет информации, сколько осталось номеров и авиабилетов"
      },
      "features": {
        "construction_year": null,
        "renovation_year": null,
        "airport_distance": null,
        "beach_distance": null,
        "beach_size": null,
        "beach_type": null,
        "beach_surface": null,
        "area": null,
        "line": null,
        "wi_fi": null,
        "ski_lift_distance": null,
        "ski_in": false,
        "ski_out": false,
        "fitness": false,
        "aquapark": false,
        "nanny": false,
        "kids_menu": false,
        "kids_club": false,
        "kids_pool": false,
        "pool": false,
        "heated_pool": false,
        "aircon": true,
        "parking": false,
        "massage": false,
        "thermal_fun": false,
        "bar": false,
        "indoor_pool": false,
        "no_single_men": false,
        "min_age": null
      },
      "end_date": "2025-01-04",
      "region_name": "",
      "desc": "Комфортабельный отель находится в городе Стамбул. К услугам гостей уютные номера, Wi-Fi на территории.",
      "is_favorite": false,
      "favorite_id": 0
    }
  ];

  runApp(
    MaterialApp(
      theme: MapkitFlutterTheme.lightTheme,
      darkTheme: MapkitFlutterTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: MapkitFlutterApp(data: data),
    ),
  );
}

class MapkitFlutterApp extends StatefulWidget {
  final List data;
  const MapkitFlutterApp({super.key, required this.data});

  @override
  State<MapkitFlutterApp> createState() => _MapkitFlutterAppState();
}

class _MapkitFlutterAppState extends State<MapkitFlutterApp> {
  static const _clusterRadius = 60.0;
  static const _clusterMinZoom = 15;

  final data = [
    {
      "booking_url": "https://level.travel//hotels/9118788-Cnr_Inci",
      "hotel_id": 9118788,
      "hotel_name": "Cnr İnci",
      "hotel_category_name": "3*",
      "hotel_category": 3,
      "hotel_rating": "7",
      "hotel_preview": "https://img.cdn.level.travel/hotels/9118788/c3c87e79352e5b0bcf738cdabd12d638.jpg",
      "hotel_pics": [
        {
          "x500": "https://img.cdn.level.travel/hotels/9118788/2046e44a25a952ef3b1f876045d8bd88.jpg",
          "webp_x620": "https://img.cdn.level.travel/hotels/9118788/387dc3115d746e97c020b230f720f9c3_webp_x620.webp",
          "x245x240": "https://img.cdn.level.travel/hotels/9118788/7a04ef9bec8af068e0340840af44b2df.jpg",
          "x290x135": "https://img.cdn.level.travel/hotels/9118788/161277d9e23ad4f9b2db31024369d169.jpg"
        },
        {
          "x500": "https://img.cdn.level.travel/hotels/9118788/71f8ba8c271f5f5dbc72727e06efff79.jpg",
          "webp_x620": "https://img.cdn.level.travel/hotels/9118788/c50971e765e7ef141af97b37288c85a0_webp_x620.webp",
          "x245x240": "https://img.cdn.level.travel/hotels/9118788/22d82cc05ecf4f392395b2fec70b9d79.jpg",
          "x290x135": "https://img.cdn.level.travel/hotels/9118788/1b9f32be446313651bcfed89a6d55f20.jpg"
        },
        {
          "x500": "https://img.cdn.level.travel/hotels/9118788/b5ba10c59795e153a87e5e6f86471898.jpg",
          "webp_x620": "https://img.cdn.level.travel/hotels/9118788/3ed85c7bc0eb67ffa9c5fc0eac55e00d_webp_x620.webp",
          "x245x240": "https://img.cdn.level.travel/hotels/9118788/0b2530ec95a9ffd89fbcf94e14d2dc7d.jpg",
          "x290x135": "https://img.cdn.level.travel/hotels/9118788/2241b034ec8cc2f46e95de2aefefcde3.jpg"
        }
      ],
      "operators": [
        78,
        8
      ],
      "hotel_city": "Стамбул",
      "tour_price": 68682,
      "tour_identity": "MjEzfDIyNXwxMTUwOHw5ODN8fDIwMjQtMTItMjIsMjAyNC0xMi0yMnwwfDExLDExfDF8MHx8fDB8MA==",
      "tour_id": "078-24618d397352c60da7b1167c0f7cd2fb",
      "system_type": "level_travel",
      "latitude": 40.9999847412,
      "longitude": 28.8000488281,
      "price_per_night": 6244,
      "max_price": 87137,
      "min_price": 68682,
      "meals": [
        "RO"
      ],
      "hotel_type": 2,
      "availability": {
        "flight": "n/a",
        "hotel": "medium",
        "tooltip": "Номера ещё есть, информации о билетах нет"
      },
      "features": {
        "construction_year": 2019,
        "renovation_year": null,
        "airport_distance": 29300,
        "beach_distance": null,
        "beach_size": null,
        "beach_type": null,
        "beach_surface": null,
        "area": null,
        "line": null,
        "wi_fi": "FREE",
        "ski_lift_distance": null,
        "ski_in": false,
        "ski_out": false,
        "fitness": false,
        "aquapark": false,
        "nanny": false,
        "kids_menu": false,
        "kids_club": false,
        "kids_pool": false,
        "pool": false,
        "heated_pool": false,
        "aircon": false,
        "parking": true,
        "massage": false,
        "thermal_fun": false,
        "bar": false,
        "indoor_pool": false,
        "no_single_men": false,
        "min_age": null
      },
      "end_date": "2025-01-02",
      "region_name": "",
      "desc": "Сочетание комфорта, эргономичного и удобного дизайна и чистоты в недавно открывшемся отеле делает вас постоянным выбором отеля İnci",
      "is_favorite": false,
      "favorite_id": 0
    },
    {
      "booking_url": "https://level.travel//hotels/9080722-Monopol_Hotel",
      "hotel_id": 9080722,
      "hotel_name": "Monopol Hotel",
      "hotel_category_name": "3*",
      "hotel_category": 3,
      "hotel_rating": "6",
      "hotel_preview": "https://img.cdn.level.travel/hotels/9080722/ac2437d1d832cb2663eb053580874516.jpg",
      "hotel_pics": [
        {
          "x500": "https://img.cdn.level.travel/hotels/9080722/5e6484654c1008784448efbbbc557566.jpg",
          "webp_x620": "https://img.cdn.level.travel/hotels/9080722/df9a46cfe5902672e5f08a25c928292e_webp_x620.webp",
          "x245x240": "https://img.cdn.level.travel/hotels/9080722/3a1a7445de639f42180634249acb887c.jpg",
          "x290x135": "https://img.cdn.level.travel/hotels/9080722/9f7447362b913884e0d6b5c7b1b399f9.jpg"
        },
        {
          "x500": "https://img.cdn.level.travel/hotels/9080722/f0ea2caccc87826825d2630f258f26eb.jpg",
          "webp_x620": "https://img.cdn.level.travel/hotels/9080722/63593c4f7b313283d75b44aa0335e439_webp_x620.webp",
          "x245x240": "https://img.cdn.level.travel/hotels/9080722/7b69e631052523288f2d8067ccdcb292.jpg",
          "x290x135": "https://img.cdn.level.travel/hotels/9080722/1339878f86fb4b10c09bd9aa1eaaee20.jpg"
        },
        {
          "x500": "https://img.cdn.level.travel/hotels/9080722/666b157a701d20fc9d3fb6d2b059a982.jpg",
          "webp_x620": "https://img.cdn.level.travel/hotels/9080722/271dab9f416055c279120cda432f6054_webp_x620.webp",
          "x245x240": "https://img.cdn.level.travel/hotels/9080722/8f1a597e69eb0ab3a7badd65bd76adb3.jpg",
          "x290x135": "https://img.cdn.level.travel/hotels/9080722/59788f31850c27217a3fa45ef5742f8c.jpg"
        }
      ],
      "operators": [
        78,
        70
      ],
      "hotel_city": "Бейоглу",
      "tour_price": 68701,
      "tour_identity": "MjEzfDIyNXwxMTUwOHw5ODN8fDIwMjQtMTItMjIsMjAyNC0xMi0yMnwwfDExLDExfDF8MHx8fDB8MA==",
      "tour_id": "078-f276968c37b9c01a1e9a9c2cc4b5786e",
      "system_type": "level_travel",
      "latitude": 41.0301886853,
      "longitude": 28.9733880758,
      "price_per_night": 6246,
      "max_price": 85248,
      "min_price": 68701,
      "meals": [
        "BB"
      ],
      "hotel_type": 2,
      "availability": {
        "flight": "n/a",
        "hotel": "n/a",
        "tooltip": "Нет информации, сколько осталось номеров и авиабилетов"
      },
      "features": {
        "construction_year": null,
        "renovation_year": 2013,
        "airport_distance": 18000,
        "beach_distance": null,
        "beach_size": null,
        "beach_type": null,
        "beach_surface": null,
        "area": null,
        "line": null,
        "wi_fi": "PAID",
        "ski_lift_distance": null,
        "ski_in": false,
        "ski_out": false,
        "fitness": false,
        "aquapark": false,
        "nanny": false,
        "kids_menu": false,
        "kids_club": false,
        "kids_pool": false,
        "pool": false,
        "heated_pool": false,
        "aircon": true,
        "parking": false,
        "massage": false,
        "thermal_fun": false,
        "bar": true,
        "indoor_pool": false,
        "no_single_men": false,
        "min_age": null
      },
      "end_date": "2025-01-02",
      "region_name": "Бейоглу",
      "desc": "Уютный отель для экскурсионной поездки и шопинга. Гостей ждут традиционные номера и удобная транспортная доступность - отсюда легко добраться до всех достопримечательностей Стамбула.",
      "is_favorite": false,
      "favorite_id": 0
    },
    {
      "booking_url": "https://level.travel//hotels/9118587-Palace_Point_Hotel",
      "hotel_id": 9118587,
      "hotel_name": "Palace Point Hotel",
      "hotel_category_name": "1*",
      "hotel_category": 1,
      "hotel_rating": "7.9",
      "hotel_preview": "https://img.cdn.level.travel/hotels/9118587/4a2a9bbb41f26f4ef2f9f2b9b410d478.jpg",
      "hotel_pics": [
        {
          "x500": "https://img.cdn.level.travel/hotels/9118587/a9c960807e8fc4fa8b72484c712f3f8e.jpg",
          "webp_x620": "https://img.cdn.level.travel/hotels/9118587/b130be03249e1fa08142c34b8c26939c_webp_x620.webp",
          "x245x240": "https://img.cdn.level.travel/hotels/9118587/6532276eee9a0a78ff37a53268377316.jpg",
          "x290x135": "https://img.cdn.level.travel/hotels/9118587/8d796294f93ba1af70af04251371290e.jpg"
        },
        {
          "x500": "https://img.cdn.level.travel/hotels/9118587/193ce2b3e7749b80227da11b9347a010.jpg",
          "webp_x620": "https://img.cdn.level.travel/hotels/9118587/88b3970f0f7c3461e22c5f288ec83f9f_webp_x620.webp",
          "x245x240": "https://img.cdn.level.travel/hotels/9118587/8324dc44e1a3ded0c78a34bc452634fa.jpg",
          "x290x135": "https://img.cdn.level.travel/hotels/9118587/d60d508f85a16b04620d9de9e69f04f9.jpg"
        },
        {
          "x500": "https://img.cdn.level.travel/hotels/9118587/f6b7c634a9d78cfdeced85f62af8880c.jpg",
          "webp_x620": "https://img.cdn.level.travel/hotels/9118587/7b97ed6fc2e5228445e794136bde6a9d_webp_x620.webp",
          "x245x240": "https://img.cdn.level.travel/hotels/9118587/faf9c4fa9c44237bd3a28478abdcf936.jpg",
          "x290x135": "https://img.cdn.level.travel/hotels/9118587/2e0aa9cc3a30f4b83086f239d659bf41.jpg"
        }
      ],
      "operators": [
        78,
        8
      ],
      "hotel_city": "Стамбул",
      "tour_price": 69197,
      "tour_identity": "MjEzfDIyNXwxMTUwOHw5ODN8fDIwMjQtMTItMjIsMjAyNC0xMi0yMnwwfDExLDExfDF8MHx8fDB8MA==",
      "tour_id": "078-dd8621057dd5ca93e26d8700d67ae213",
      "system_type": "level_travel",
      "latitude": 41.0142318,
      "longitude": 28.9792006,
      "price_per_night": 6291,
      "max_price": 86817,
      "min_price": 69197,
      "meals": [
        "RO"
      ],
      "hotel_type": 49,
      "availability": {
        "flight": "n/a",
        "hotel": "few",
        "tooltip": "Номера быстро заканчиваются, информации о билетах нет"
      },
      "features": {
        "construction_year": null,
        "renovation_year": null,
        "airport_distance": 44000,
        "beach_distance": null,
        "beach_size": null,
        "beach_type": null,
        "beach_surface": null,
        "area": null,
        "line": null,
        "wi_fi": "FREE",
        "ski_lift_distance": null,
        "ski_in": false,
        "ski_out": false,
        "fitness": false,
        "aquapark": false,
        "nanny": true,
        "kids_menu": false,
        "kids_club": false,
        "kids_pool": false,
        "pool": false,
        "heated_pool": false,
        "aircon": true,
        "parking": false,
        "massage": false,
        "thermal_fun": false,
        "bar": true,
        "indoor_pool": false,
        "no_single_men": false,
        "min_age": null
      },
      "end_date": "2025-01-02",
      "region_name": "",
      "desc": "Отель Palace Point расположен в историческом районе Стамбула, в пешей доступности основные достопримечательности, рядом множество кафе и ресторанов. Номера выполнены в классическом уютном стиле и оснащены всем необходимым для комфортного отдыха.",
      "is_favorite": false,
      "favorite_id": 0
    },
    {
      "booking_url": "https://level.travel//hotels/9118390-Emirtimes_Otel_Kadik%C3%B6y",
      "hotel_id": 9118390,
      "hotel_name": "Emirtimes Otel Kadiköy",
      "hotel_category_name": "2*",
      "hotel_category": 2,
      "hotel_rating": "7.6",
      "hotel_preview": "https://img.cdn.level.travel/hotels/9118390/e47563755a6efa5ce59dc002d823f71f.jpg",
      "hotel_pics": [
        {
          "x500": "https://img.cdn.level.travel/hotels/9118390/6302da51fb7a43f2a6b798dd5cd4b419.jpg",
          "webp_x620": "https://img.cdn.level.travel/hotels/9118390/b6a35343b82ae2cf3d87f7cf3a091469_webp_x620.webp",
          "x245x240": "https://img.cdn.level.travel/hotels/9118390/e0f9968f47bdfc6770172374d95d1f74.jpg",
          "x290x135": "https://img.cdn.level.travel/hotels/9118390/5a8691282a0e53fad44b5aa5996e85e8.jpg"
        },
        {
          "x500": "https://img.cdn.level.travel/hotels/9118390/8150972188dd0b7eb5c36c3287bcf2b0.jpg",
          "webp_x620": "https://img.cdn.level.travel/hotels/9118390/8e438f9eb3fb2ab877d238863d0107b9_webp_x620.webp",
          "x245x240": "https://img.cdn.level.travel/hotels/9118390/c7ca809731ec2a66e7d081ef912175dd.jpg",
          "x290x135": "https://img.cdn.level.travel/hotels/9118390/3f9450f3b8057354c6738a87c25a57c0.jpg"
        },
        {
          "x500": "https://img.cdn.level.travel/hotels/9118390/f86e3acd56ac335029f25beb9f5e6f7c.jpg",
          "webp_x620": "https://img.cdn.level.travel/hotels/9118390/4af857b919ad8d6eca10cb9727b1afd4_webp_x620.webp",
          "x245x240": "https://img.cdn.level.travel/hotels/9118390/dfb7fd7aa5e72f34576319f2abf9ed85.jpg",
          "x290x135": "https://img.cdn.level.travel/hotels/9118390/39f9c81eade122d02b978bdcea87433e.jpg"
        }
      ],
      "operators": [
        78
      ],
      "hotel_city": "Стамбул",
      "tour_price": 69250,
      "tour_identity": "MjEzfDIyNXwxMTUwOHw5ODN8fDIwMjQtMTItMjIsMjAyNC0xMi0yMnwwfDExLDExfDF8MHx8fDB8MA==",
      "tour_id": "078-f2e9bba47a15c7921e34e718f208800a",
      "system_type": "level_travel",
      "latitude": 40.9927787781,
      "longitude": 29.0272941589,
      "price_per_night": 6295,
      "max_price": 69250,
      "min_price": 69250,
      "meals": [
        "RO"
      ],
      "hotel_type": 2,
      "availability": {
        "flight": "n/a",
        "hotel": "few",
        "tooltip": "Номера быстро заканчиваются, информации о билетах нет"
      },
      "features": {
        "construction_year": null,
        "renovation_year": null,
        "airport_distance": 51000,
        "beach_distance": null,
        "beach_size": null,
        "beach_type": null,
        "beach_surface": null,
        "area": null,
        "line": null,
        "wi_fi": "FREE",
        "ski_lift_distance": null,
        "ski_in": false,
        "ski_out": false,
        "fitness": false,
        "aquapark": false,
        "nanny": false,
        "kids_menu": false,
        "kids_club": false,
        "kids_pool": false,
        "pool": false,
        "heated_pool": false,
        "aircon": true,
        "parking": true,
        "massage": false,
        "thermal_fun": false,
        "bar": true,
        "indoor_pool": false,
        "no_single_men": false,
        "min_age": null
      },
      "end_date": "2025-01-02",
      "region_name": "",
      "desc": "Отель занимает 5-этажное здание, из которого открывается вид на город. В каждом из 36 звуконепроницаемых номеров можно найти кондиционер и высокоскоростной Wi-Fi.",
      "is_favorite": false,
      "favorite_id": 0
    },
    {
      "booking_url": "https://level.travel//hotels/9020204-Turvan_Hotel",
      "hotel_id": 9020204,
      "hotel_name": "Turvan Hotel",
      "hotel_category_name": "3*",
      "hotel_category": 3,
      "hotel_rating": "5.6",
      "hotel_preview": "https://img.cdn.level.travel/hotels/9020204/41dc1520470d48923ec1fa8a22cc3c98.jpg",
      "hotel_pics": [
        {
          "x500": "https://img.cdn.level.travel/hotels/9020204/60275a897c8d18de027c7596e0912401.jpg",
          "webp_x620": "https://img.cdn.level.travel/hotels/9020204/937635267234ac2db1ef6032ae1c4033_webp_x620.webp",
          "x245x240": "https://img.cdn.level.travel/hotels/9020204/f9aa1e5d4f918b6a3f78ba03aee7a4ce.jpg",
          "x290x135": "https://img.cdn.level.travel/hotels/9020204/4726d8f604bf0b519ca3fe6d0f27f20e.jpg"
        },
        {
          "x500": "https://img.cdn.level.travel/hotels/9020204/ca122406f35329b944bebb6645249a8d.jpg",
          "webp_x620": "https://img.cdn.level.travel/hotels/9020204/66437e44f2495777060c3ae52ccce8b2_webp_x620.webp",
          "x245x240": "https://img.cdn.level.travel/hotels/9020204/fab7509942f18190595984d764d4c671.jpg",
          "x290x135": "https://img.cdn.level.travel/hotels/9020204/3e5bd40ed6167fa5d4a2433692c43610.jpg"
        },
        {
          "x500": "https://img.cdn.level.travel/hotels/9020204/334a325d4c4122b0db2ac01279d088a8.jpg",
          "webp_x620": "https://img.cdn.level.travel/hotels/9020204/cd9cbc85d0ff6c37146d4439a0e5478f_webp_x620.webp",
          "x245x240": "https://img.cdn.level.travel/hotels/9020204/30f2841016e92cbc271290fcd60308c8.jpg",
          "x290x135": "https://img.cdn.level.travel/hotels/9020204/1195ceab552f83db4668f81362fefcfe.jpg"
        }
      ],
      "operators": [
        78,
        8
      ],
      "hotel_city": "Сиркеджи",
      "tour_price": 69306,
      "tour_identity": "MjEzfDIyNXwxMTUwOHw5ODN8fDIwMjQtMTItMjIsMjAyNC0xMi0yMnwwfDExLDExfDF8MHx8fDB8MA==",
      "tour_id": "078-2c2026404daad91f4dbd38adeebd1ba3",
      "system_type": "level_travel",
      "latitude": 41.013886911,
      "longitude": 28.9762982726,
      "price_per_night": 6301,
      "max_price": 79777,
      "min_price": 69306,
      "meals": [
        "RO"
      ],
      "hotel_type": 2,
      "availability": {
        "flight": "n/a",
        "hotel": "few",
        "tooltip": "Номера быстро заканчиваются, информации о билетах нет"
      },
      "features": {
        "construction_year": 2003,
        "renovation_year": 2013,
        "airport_distance": 35000,
        "beach_distance": null,
        "beach_size": null,
        "beach_type": null,
        "beach_surface": null,
        "area": 240,
        "line": null,
        "wi_fi": "FREE",
        "ski_lift_distance": null,
        "ski_in": false,
        "ski_out": false,
        "fitness": false,
        "aquapark": false,
        "nanny": true,
        "kids_menu": false,
        "kids_club": false,
        "kids_pool": false,
        "pool": false,
        "heated_pool": false,
        "aircon": true,
        "parking": false,
        "massage": true,
        "thermal_fun": true,
        "bar": true,
        "indoor_pool": false,
        "no_single_men": false,
        "min_age": null
      },
      "end_date": "2025-01-02",
      "region_name": "Сиркеджи",
      "desc": "Этот отель расположен недалеко от местных достопримечательностей, ресторанов и кафе. К услугам гостей светлые и комфортные номера. Хороший сервис и качественное обслуживание.",
      "is_favorite": false,
      "favorite_id": 0
    },
    {
      "booking_url": "https://level.travel//hotels/9135717-Ada_Apartment",
      "hotel_id": 9135717,
      "hotel_name": "Ada Apartment",
      "hotel_category_name": "0*",
      "hotel_category": 0,
      "hotel_rating": null,
      "hotel_preview": "https://img.cdn.level.travel/hotels/9135717/499d6943d23484d04f9d0d17a126b05d.jpg",
      "hotel_pics": [
        {
          "x500": "https://img.cdn.level.travel/hotels/9135717/18e24e631a580f765824dca724e03a12.jpg",
          "webp_x620": "https://img.cdn.level.travel/hotels/9135717/0e9022a3d46ae879c12e14403464be8c_webp_x620.webp",
          "x245x240": "https://img.cdn.level.travel/hotels/9135717/d55eeb119250cff209c0772e0924466e.jpg",
          "x290x135": "https://img.cdn.level.travel/hotels/9135717/37534ca135a7a66476ac941d17f35686.jpg"
        },
        {
          "x500": "https://img.cdn.level.travel/hotels/9135717/2fbabdb7018b40a18f2c64419c522014.jpg",
          "webp_x620": "https://img.cdn.level.travel/hotels/9135717/45f4cbbea5cafb3bb06194fe6623950b_webp_x620.webp",
          "x245x240": "https://img.cdn.level.travel/hotels/9135717/f4a30b15c3ea60a7fdf083f2c0590f0e.jpg",
          "x290x135": "https://img.cdn.level.travel/hotels/9135717/acb94419624de0612a3022f13a47700d.jpg"
        },
        {
          "x500": "https://img.cdn.level.travel/hotels/9135717/d239a05d1c75771e6e3504e57b23c4a0.jpg",
          "webp_x620": "https://img.cdn.level.travel/hotels/9135717/98b0d1fcf39a2db4b509e29e1a4cadde_webp_x620.webp",
          "x245x240": "https://img.cdn.level.travel/hotels/9135717/90c43fac63b66a929060f65c95cdf97c.jpg",
          "x290x135": "https://img.cdn.level.travel/hotels/9135717/f9156400d8db6f5552a1d5bde20fc260.jpg"
        }
      ],
      "operators": [
        78
      ],
      "hotel_city": "Стамбул",
      "tour_price": 69480,
      "tour_identity": "MjEzfDIyNXwxMTUwOHw5ODN8fDIwMjQtMTItMjIsMjAyNC0xMi0yMnwwfDExLDExfDF8MHx8fDB8MA==",
      "tour_id": "078-9fec38e75c10a6efe4f31e6ea37ea170",
      "system_type": "level_travel",
      "latitude": 41.0031342,
      "longitude": 28.9730646,
      "price_per_night": 6316,
      "max_price": 69480,
      "min_price": 69480,
      "meals": [
        "RO"
      ],
      "hotel_type": 29,
      "availability": {
        "flight": "n/a",
        "hotel": "few",
        "tooltip": "Номера быстро заканчиваются, информации о билетах нет"
      },
      "features": {
        "construction_year": null,
        "renovation_year": null,
        "airport_distance": 45000,
        "beach_distance": null,
        "beach_size": null,
        "beach_type": null,
        "beach_surface": null,
        "area": null,
        "line": null,
        "wi_fi": "FREE",
        "ski_lift_distance": null,
        "ski_in": false,
        "ski_out": false,
        "fitness": false,
        "aquapark": false,
        "nanny": false,
        "kids_menu": false,
        "kids_club": false,
        "kids_pool": false,
        "pool": false,
        "heated_pool": false,
        "aircon": true,
        "parking": false,
        "massage": false,
        "thermal_fun": false,
        "bar": false,
        "indoor_pool": false,
        "no_single_men": false,
        "min_age": null
      },
      "end_date": "2025-01-02",
      "region_name": "",
      "desc": "Уютные апартаменты в европейской части Стамбула. Гостей ждут светлые номера с мини-кухней и достопримечательности неподалеку.",
      "is_favorite": false,
      "favorite_id": 0
    },
    {
      "booking_url": "https://level.travel//hotels/9160311-Sahra_Airport_Hotel",
      "hotel_id": 9160311,
      "hotel_name": "Sahra Airport Hotel",
      "hotel_category_name": "4*",
      "hotel_category": 4,
      "hotel_rating": "7.6",
      "hotel_preview": "https://img.cdn.level.travel/hotels/9160311/c5637d5deb773ef5bf4e307cce55b96a.jpg",
      "hotel_pics": [
        {
          "x500": "https://img.cdn.level.travel/hotels/9160311/18943f121e87ec0fe87ec6f84239a4af.jpg",
          "webp_x620": "https://img.cdn.level.travel/hotels/9160311/da78a59026bcbf0bed491501178aaf5f_webp_x620.webp",
          "x245x240": "https://img.cdn.level.travel/hotels/9160311/a9256d037b7a9a5795314af5142c0f1e.jpg",
          "x290x135": "https://img.cdn.level.travel/hotels/9160311/fef5cfff54514f206f0de9fd57d84fc2.jpg"
        },
        {
          "x500": "https://img.cdn.level.travel/hotels/9160311/7cce6aea30140f7ccb28106a95f4ca40.jpg",
          "webp_x620": "",
          "x245x240": "https://img.cdn.level.travel/hotels/9160311/7f9e310aa54f745c8e70e3d86051e2cd.jpg",
          "x290x135": "https://img.cdn.level.travel/hotels/9160311/dab5e03a74b9c971c4bdcf7d5941413e.jpg"
        },
        {
          "x500": "https://img.cdn.level.travel/hotels/9160311/b94f95e51462af6adb1377187c7a2ef8.jpg",
          "webp_x620": "",
          "x245x240": "https://img.cdn.level.travel/hotels/9160311/1c0bc375cc0944a8024a0b917af898fd.jpg",
          "x290x135": "https://img.cdn.level.travel/hotels/9160311/6cddd858244bac97d34f1bf52b7e9d1b.jpg"
        }
      ],
      "operators": [
        78
      ],
      "hotel_city": "Стамбул",
      "tour_price": 69480,
      "tour_identity": "MjEzfDIyNXwxMTUwOHw5ODN8fDIwMjQtMTItMjIsMjAyNC0xMi0yMnwwfDExLDExfDF8MHx8fDB8MA==",
      "tour_id": "078-17eeb918d35e8f92378d622d8c5d44f7",
      "system_type": "level_travel",
      "latitude": 41.0018180842,
      "longitude": 28.8057795167,
      "price_per_night": 6316,
      "max_price": 69480,
      "min_price": 69480,
      "meals": [
        "RO"
      ],
      "hotel_type": 2,
      "availability": {
        "flight": "n/a",
        "hotel": "few",
        "tooltip": "Номера быстро заканчиваются, информации о билетах нет"
      },
      "features": {
        "construction_year": null,
        "renovation_year": null,
        "airport_distance": 37000,
        "beach_distance": null,
        "beach_size": null,
        "beach_type": null,
        "beach_surface": null,
        "area": null,
        "line": null,
        "wi_fi": null,
        "ski_lift_distance": null,
        "ski_in": false,
        "ski_out": false,
        "fitness": false,
        "aquapark": false,
        "nanny": false,
        "kids_menu": false,
        "kids_club": false,
        "kids_pool": false,
        "pool": false,
        "heated_pool": false,
        "aircon": true,
        "parking": false,
        "massage": false,
        "thermal_fun": false,
        "bar": false,
        "indoor_pool": false,
        "no_single_men": false,
        "min_age": null
      },
      "end_date": "2025-01-02",
      "region_name": "",
      "desc": "Уютный отель с номерами в традиционном стиле. В пешей доступности кафе.",
      "is_favorite": false,
      "favorite_id": 0
    },
    {
      "booking_url": "https://level.travel//hotels/9083748-Sun_Comfort_Hotel",
      "hotel_id": 9083748,
      "hotel_name": "Sun Comfort Hotel",
      "hotel_category_name": "3*",
      "hotel_category": 3,
      "hotel_rating": "7.5",
      "hotel_preview": "https://img.cdn.level.travel/hotels/9083748/518f690aa45d2bbe24cc040fbe540fb9.jpg",
      "hotel_pics": [
        {
          "x500": "https://img.cdn.level.travel/hotels/9083748/d27ee6f219562cf17cf68a38dfe12379.jpg",
          "webp_x620": "https://img.cdn.level.travel/hotels/9083748/0ba71492631f16a164c22e7a0f30a647_webp_x620.webp",
          "x245x240": "https://img.cdn.level.travel/hotels/9083748/d3610f890cf6624ae1c9375dd5958e82.jpg",
          "x290x135": "https://img.cdn.level.travel/hotels/9083748/7ffe72d5e56f1caddf7690776247f6f7.jpg"
        },
        {
          "x500": "https://img.cdn.level.travel/hotels/9083748/e3fa27699e3fea06973dfe5f0f4a1c29.jpg",
          "webp_x620": "https://img.cdn.level.travel/hotels/9083748/a8909b952fca3834717f4d45e8d2f19a_webp_x620.webp",
          "x245x240": "https://img.cdn.level.travel/hotels/9083748/f944b369eb6c3c7ba3283b082d504b58.jpg",
          "x290x135": "https://img.cdn.level.travel/hotels/9083748/d32a8207297130243a32fd693abf859b.jpg"
        },
        {
          "x500": "https://img.cdn.level.travel/hotels/9083748/1af79a1a7d43def38300e94c416e6f55.jpg",
          "webp_x620": "https://img.cdn.level.travel/hotels/9083748/1ec504b2b2f177b91e5e4441cb8bf388_webp_x620.webp",
          "x245x240": "https://img.cdn.level.travel/hotels/9083748/48f99b05bbb919523f2bf8c7eb82c168.jpg",
          "x290x135": "https://img.cdn.level.travel/hotels/9083748/35ae96b9c8a47ec7677080582333e15f.jpg"
        }
      ],
      "operators": [
        78,
        8
      ],
      "hotel_city": "Фатих",
      "tour_price": 69511,
      "tour_identity": "MjEzfDIyNXwxMTUwOHw5ODN8fDIwMjQtMTItMjIsMjAyNC0xMi0yMnwwfDExLDExfDF8MHx8fDB8MA==",
      "tour_id": "078-359380c5610d82be9f252e2ad7103a10",
      "system_type": "level_travel",
      "latitude": 41.0042292,
      "longitude": 28.9621965,
      "price_per_night": 6319,
      "max_price": 98772,
      "min_price": 69511,
      "meals": [
        "RO",
        "BB"
      ],
      "hotel_type": 2,
      "availability": {
        "flight": "n/a",
        "hotel": "few",
        "tooltip": "Номера быстро заканчиваются, информации о билетах нет"
      },
      "features": {
        "construction_year": null,
        "renovation_year": 2017,
        "airport_distance": 48000,
        "beach_distance": null,
        "beach_size": null,
        "beach_type": null,
        "beach_surface": null,
        "area": null,
        "line": null,
        "wi_fi": "FREE",
        "ski_lift_distance": null,
        "ski_in": false,
        "ski_out": false,
        "fitness": false,
        "aquapark": false,
        "nanny": false,
        "kids_menu": false,
        "kids_club": false,
        "kids_pool": false,
        "pool": false,
        "heated_pool": false,
        "aircon": true,
        "parking": true,
        "massage": false,
        "thermal_fun": false,
        "bar": false,
        "indoor_pool": false,
        "no_single_men": false,
        "min_age": null
      },
      "end_date": "2025-01-02",
      "region_name": "Фатих",
      "desc": "Небольшой уютный отель в стамбульском районе Фатих. Подходит для знакомства с городом.",
      "is_favorite": false,
      "favorite_id": 0
    },
    {
      "booking_url": "https://level.travel//hotels/9011779-Birbey_Hotel",
      "hotel_id": 9011779,
      "hotel_name": "Birbey Hotel",
      "hotel_category_name": "3*",
      "hotel_category": 3,
      "hotel_rating": "6.9",
      "hotel_preview": "https://img.cdn.level.travel/hotels/9011779/e1d0ceafacd00a7111163d7ced517c73.jpg",
      "hotel_pics": [
        {
          "x500": "https://img.cdn.level.travel/hotels/9011779/397987971ae94428bd1e476ec4939797.jpg",
          "webp_x620": "https://img.cdn.level.travel/hotels/9011779/ea8891bdacdf75386e723664108d0652_webp_x620.webp",
          "x245x240": "https://img.cdn.level.travel/hotels/9011779/4b4c88379b8c974b11e1d1b2e0994a77.jpg",
          "x290x135": "https://img.cdn.level.travel/hotels/9011779/0c5fb26673fa7614ed23be93ae3f2d66.jpg"
        },
        {
          "x500": "https://img.cdn.level.travel/hotels/9011779/3f91569ae0eb59c226ada71b38993be5.jpg",
          "webp_x620": "https://img.cdn.level.travel/hotels/9011779/11608097d9bcbf49343548ea2c35df48_webp_x620.webp",
          "x245x240": "https://img.cdn.level.travel/hotels/9011779/9dc1fb31251f21a01ea9cb205c6022e3.jpg",
          "x290x135": "https://img.cdn.level.travel/hotels/9011779/7df4c1ab5bdaffe5da947e605864e84d.jpg"
        },
        {
          "x500": "https://img.cdn.level.travel/hotels/9011779/72fccf2bd0eeb42f6bc01b91491ca7dc.jpg",
          "webp_x620": "https://img.cdn.level.travel/hotels/9011779/b5428cffb06d5132c5782da6fa72d836_webp_x620.webp",
          "x245x240": "https://img.cdn.level.travel/hotels/9011779/25f975a1b353cd9fa4fb4d00f6f6e289.jpg",
          "x290x135": "https://img.cdn.level.travel/hotels/9011779/ee1223ac8c5a247ad04681c8a48956ab.jpg"
        }
      ],
      "operators": [
        78,
        70,
        8
      ],
      "hotel_city": "Фатих",
      "tour_price": 69923,
      "tour_identity": "MjEzfDIyNXwxMTUwOHw5ODN8fDIwMjQtMTItMjIsMjAyNC0xMi0yMnwwfDExLDExfDF8MHx8fDB8MA==",
      "tour_id": "078-efdeb0f8b3406fc82e3fe8adb3fc10b3",
      "system_type": "level_travel",
      "latitude": 41.0108394731,
      "longitude": 28.9539045095,
      "price_per_night": 6357,
      "max_price": 81271,
      "min_price": 69923,
      "meals": [
        "BB"
      ],
      "hotel_type": 2,
      "availability": {
        "flight": "n/a",
        "hotel": "few",
        "tooltip": "Номера быстро заканчиваются, информации о билетах нет"
      },
      "features": {
        "construction_year": 1993,
        "renovation_year": 2013,
        "airport_distance": 15000,
        "beach_distance": null,
        "beach_size": null,
        "beach_type": null,
        "beach_surface": null,
        "area": 335,
        "line": null,
        "wi_fi": "FREE",
        "ski_lift_distance": null,
        "ski_in": false,
        "ski_out": false,
        "fitness": false,
        "aquapark": false,
        "nanny": false,
        "kids_menu": false,
        "kids_club": false,
        "kids_pool": false,
        "pool": false,
        "heated_pool": false,
        "aircon": true,
        "parking": false,
        "massage": false,
        "thermal_fun": false,
        "bar": true,
        "indoor_pool": false,
        "no_single_men": false,
        "min_age": null
      },
      "end_date": "2025-01-02",
      "region_name": "Фатих",
      "desc": "В отеле поддерживается чистая, светлая, семейная и гостеприимная атмосфера.",
      "is_favorite": false,
      "favorite_id": 0
    },
    {
      "booking_url": "https://level.travel//hotels/9118804-Hotel_Expocity_Istanbul",
      "hotel_id": 9118804,
      "hotel_name": "Hotel Expocity Istanbul",
      "hotel_category_name": "3*",
      "hotel_category": 3,
      "hotel_rating": null,
      "hotel_preview": "https://img.cdn.level.travel/hotels/9118804/f4ca2c68fcdabb66a6bbd0e5ebe3cb68.jpg",
      "hotel_pics": [
        {
          "x500": "https://img.cdn.level.travel/hotels/9118804/41746730be907482275d347708e90c72.jpg",
          "webp_x620": "https://img.cdn.level.travel/hotels/9118804/c03123b357cc0d7c26bdedd0b399c9b9_webp_x620.webp",
          "x245x240": "https://img.cdn.level.travel/hotels/9118804/a9bc75648bbff44e16703b30184dbb45.jpg",
          "x290x135": "https://img.cdn.level.travel/hotels/9118804/22fa322802dfd6e3a08f013350930972.jpg"
        },
        {
          "x500": "https://img.cdn.level.travel/hotels/9118804/edf44eed4324e72d842d784d5d0da554.jpg",
          "webp_x620": "https://img.cdn.level.travel/hotels/9118804/ab99cb992f6c8cfe5dfe6024def4f742_webp_x620.webp",
          "x245x240": "https://img.cdn.level.travel/hotels/9118804/84f33cf9be64a17cce0a9ab8cb889105.jpg",
          "x290x135": "https://img.cdn.level.travel/hotels/9118804/c25aa66280d410682e049337448fb82d.jpg"
        },
        {
          "x500": "https://img.cdn.level.travel/hotels/9118804/39fe361d559eed7f6f9aa9650172f5a9.jpg",
          "webp_x620": "https://img.cdn.level.travel/hotels/9118804/fe9877a7e9e00b7522978d4d42a48dbe_webp_x620.webp",
          "x245x240": "https://img.cdn.level.travel/hotels/9118804/84f1cd4014d745d05949276910067f65.jpg",
          "x290x135": "https://img.cdn.level.travel/hotels/9118804/3d1559f56dde3277e8975f1a8211d2d5.jpg"
        }
      ],
      "operators": [
        78
      ],
      "hotel_city": "Стамбул",
      "tour_price": 69977,
      "tour_identity": "MjEzfDIyNXwxMTUwOHw5ODN8fDIwMjQtMTItMjIsMjAyNC0xMi0yMnwwfDExLDExfDF8MHx8fDB8MA==",
      "tour_id": "078-9b9ac364dbdcaa50fea317698d8ea71e",
      "system_type": "level_travel",
      "latitude": 40.977698,
      "longitude": 28.7393154,
      "price_per_night": 6362,
      "max_price": 74963,
      "min_price": 69977,
      "meals": [
        "RO",
        "BB"
      ],
      "hotel_type": 2,
      "availability": {
        "flight": "n/a",
        "hotel": "few",
        "tooltip": "Номера быстро заканчиваются, информации о билетах нет"
      },
      "features": {
        "construction_year": 1999,
        "renovation_year": 2012,
        "airport_distance": 32000,
        "beach_distance": null,
        "beach_size": null,
        "beach_type": null,
        "beach_surface": null,
        "area": null,
        "line": null,
        "wi_fi": "FREE",
        "ski_lift_distance": null,
        "ski_in": false,
        "ski_out": false,
        "fitness": false,
        "aquapark": false,
        "nanny": false,
        "kids_menu": false,
        "kids_club": false,
        "kids_pool": false,
        "pool": false,
        "heated_pool": false,
        "aircon": true,
        "parking": true,
        "massage": false,
        "thermal_fun": false,
        "bar": false,
        "indoor_pool": false,
        "no_single_men": false,
        "min_age": null
      },
      "end_date": "2025-01-02",
      "region_name": "",
      "desc": "Отель с уютными, светлыми номерами в 10 км от выставочного центра CNR.",
      "is_favorite": false,
      "favorite_id": 0
    }
  ];

  final _indexToPlacemarkType = {};

  late final mapkit.MapObjectCollection _mapObjectCollection;
  late final mapkit.ClusterizedPlacemarkCollection _clusterizedCollection;

  late final _mapWindowSizeChangedListener = MapSizeChangedListenerImpl(
    onMapWindowSizeChange: (_, __, ___) => _updateFocusRect(),
  );


  late final _placemarkTapListener = MapObjectTapListenerImpl(
    onMapObjectTapped: (mapObject, _) {
      final hotelData = _indexToPlacemarkType[mapObject.userData];

      if (hotelData != null) {
        showSnackBar(context, hotelData);
      }
      return true;
    }
  );

  // late final _pinDragListener = MapObjectDragListenerImpl(
  //   onMapObjectDragStartCallback: (mapObject) => showSnackBar(
  //     context,
  //     "Start drag event",
  //   ),
  //   onMapObjectDragCallback: (_, __) {},
  //   onMapObjectDragEndCallback: (mapObject) {
  //     showSnackBar(context, "End drag event");
  //     // Updates clusters position
  //     _clusterizedCollection.clusterPlacemarks(
  //       clusterRadius: _clusterRadius,
  //       minZoom: _clusterMinZoom,
  //     );
  //   },
  // );

  // late final _clusterTapListener = ClusterTapListenerImpl(
  //   onClusterTapCallback: (cluster) {
  //     showSnackBar(
  //       context,
  //       {
  //         "message": "Кластер выбран",
  //         "size": cluster.size, // Количество объектов в кластере
  //         "geometry": cluster.geometry, // Координаты кластера
  //       },
  //     );
  //     return true;
  //   },
  // );


  late final _clusterListener = ClusterListenerImpl(
    onClusterAddedCallback: (cluster) {
      final placemarkData = cluster.placemarks
          .map((placemark) {
        final hotelId = placemark.userData as int?;
        return _indexToPlacemarkType[hotelId];
      })
          .whereType()
          .toList();

      // Определяем уровень детализации отображения
      final currentZoom = _mapWindow?.map.cameraPosition.zoom ?? 0;
      final showDetails = currentZoom > 15; // Показываем названия только при приближении

      cluster.appearance
        ..setView(
          ViewProvider(
            configurationFactory: (mediaQuery) => ViewConfiguration(
              physicalConstraints: BoxConstraints.tight(mediaQuery.size),
              logicalConstraints: BoxConstraints.tight(mediaQuery.size),
              devicePixelRatio: mediaQuery.devicePixelRatio,
            ),
            builder: () => ClusterWidget(
              placemarkData: placemarkData,
              showDetails: showDetails, // Передаём состояние отображения
            ),
          ),
        )
        ..zIndex = 100.0;

      // cluster.addClusterTapListener(_clusterTapListener);
    },
  );

  mapkit.MapWindow? _mapWindow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            FlutterMapWidget(onMapCreated: _createMapObjects)
          ],
        ),
      ),
    );
  }

  void _createMapObjects(mapkit.MapWindow mapWindow) {
    _mapWindow = mapWindow;

    mapWindow.addSizeChangedListener(_mapWindowSizeChangedListener);

    mapWindow.map.move(GeometryProvider.getStartPosition(data));

    // Add a nested map objects collection
    _mapObjectCollection = mapWindow.map.mapObjects.addCollection();

    // Add a clusterized collection
    _clusterizedCollection = _mapObjectCollection
        .addClusterizedPlacemarkCollection(_clusterListener);

    _addClusterizedPlacemarks(_clusterizedCollection);
  }


  void _addClusterizedPlacemarks(
      mapkit.ClusterizedPlacemarkCollection clusterizedCollection,
      ) {
    for (final hotel in data) {
      final hotelId = hotel['hotel_id'] as int; // Получаем hotel_id
      final point = Point(
        latitude: hotel['latitude'] as double,
        longitude: hotel['longitude'] as double,
      );
      _clusterizedCollection.addPlacemark()
        ..geometry = point
        ..userData = hotelId // Используем hotel_id в качестве userData
        ..draggable = true
        // ..setDragListener(_pinDragListener)
        ..addTapListener(_placemarkTapListener)
        ..setText("${hotel['tour_price']} ₽ - ${hotel['hotel_name']}") // Название отеля
        ..setTextStyle(
          const mapkit.TextStyle(
            size: 14.0,
            color: Colors.white, // Цвет текста
            outlineColor: Colors.blue, // Цвет рамки
            outlineWidth: 20,
            placement: mapkit.TextStylePlacement.Bottom,
            offset: 5.0,
          )
        );

      _indexToPlacemarkType[hotelId] = hotel;
    }
      // for (int index = 0; index < GeometryProvider.getPointsToMap(data).length; index++) {
      //   final point = GeometryProvider.getPointsToMap(data)[index];
      // // for (final (index, point) in GeometryProvider.getPointsToMap(data).indexed) {
      // // final type = PlacemarkType.values.random();
      // // final imageProvider = _placemarkTypeToImageProvider[type];
      //
      // clusterizedCollection.addPlacemark()
      //   ..geometry = point
      //   ..userData = index
      //   // ..setIcon(imageProvider!)
      //   // ..setIconStyle(
      //   //   const mapkit.IconStyle(
      //   //     anchor: math.Point(1, 1.5),
      //   //     scale: 2.0,
      //   //   ),
      //   // )
      //   ..draggable = true
      //   ..setDragListener(_pinDragListener)
      //   ..addTapListener(_placemarkTapListener)
      //   ..setText("Метка $index") // Добавляем текст к метке
      //   ..setTextStyle(
      //     const mapkit.TextStyle(
      //       size: 14.0,
      //       color: Colors.black,
      //       outlineColor: Colors.white,
      //       placement: mapkit.TextStylePlacement.Bottom,
      //       offset: 5.0,
      //     ),
      //   );
      //
      // _indexToPlacemarkType[index] = index;
      //   }

    clusterizedCollection.clusterPlacemarks(
      clusterRadius: _clusterRadius,
      minZoom: _clusterMinZoom,
    );
  }

  void _updateFocusRect() {
    const horizontalMargin = 40.0;
    const verticalMargin = 60.0;

    _mapWindow?.let((it) {
      it.focusRect = mapkit.ScreenRect(
        const mapkit.ScreenPoint(
          x: horizontalMargin,
          y: verticalMargin,
        ),
        mapkit.ScreenPoint(
          x: it.width() - horizontalMargin,
          y: it.height() - verticalMargin,
        ),
      );
    });
  }
}