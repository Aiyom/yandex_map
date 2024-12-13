import 'package:yandex_map/utils/extension_utils.dart';
import 'package:yandex_maps_mapkit_lite/mapkit.dart';

final class GeometryProvider {
  static CameraPosition getStartPosition(results) {
    final points = getPointsToMap(results);
    if (points.isNotEmpty) {
      final firstPoint = points.first;
      return CameraPosition(
        firstPoint,
        zoom: 10.0, // Выберите желаемый уровень масштабирования
        azimuth: 0.0,
        tilt: 0.0,
      );
    }
    // Возврат значения по умолчанию, если список пуст
    return const CameraPosition(
      Point(latitude: 59.935016, longitude: 30.328903),
      zoom: 10.0,
      azimuth: 0.0,
      tilt: 0.0,
    );
  }

  static getPointsToMap(results){
    return results
        .map((point) =>
        Point(
            latitude: point['latitude'],
            longitude: point['longitude']
        )
    ).toList();
  }
}