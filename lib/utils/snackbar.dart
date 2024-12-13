import 'package:flutter/material.dart';
import 'package:yandex_map/utils/extension_utils.dart';

bool showSnackBar(
    BuildContext? context, Map<String, dynamic> hotelData) {
  final isShown = context?.let((it) {
    final snackBar = _getSnackBar(it, hotelData);
    ScaffoldMessenger.of(it).showSnackBar(snackBar);
    return true;
  });
  return isShown ?? false;
}

SnackBar _getSnackBar(BuildContext context, Map<String, dynamic> hotelData) {
  final hotelName = hotelData['hotel_name'];
  final hotelPrice = hotelData['tour_price'];
  final hotelCategory = hotelData['hotel_category'] ?? 0;
  final hotelPhoto = hotelData['hotel_preview'] ?? hotelData['hotel_pics'][0]['x290x135'];

  return SnackBar(
    showCloseIcon: true,
    backgroundColor: Theme.of(context).colorScheme.surface,
    closeIconColor: Theme.of(context).colorScheme.secondary,
    duration: const Duration(seconds: 10),
    behavior: SnackBarBehavior.floating,
    content: Row(
      children: [
        // Фото отеля
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            hotelPhoto,
            height: 90.0,
            width: 100.0,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 8.0),
        // Текстовая информация
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: List.generate(
                  hotelCategory,
                      (starIndex) => const Icon(
                    Icons.star,
                    size: 16,
                    color: Colors.orange,
                  ),
                ),
              ),
              Text(
                hotelName,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4.0),
              ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => TourDetail(
                  //         tourIdentity: hotelData['tour_identity'],
                  //         hotelId: hotelData['hotel_id'].toString(),
                  //         levelTravelUrl: hotelData['booking_url'],
                  //       ),
                  //     ));

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(children: [
                  const Text(
                    'ВЫБРАТЬ ТУР',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  const Spacer(),
                  // Price
                  Text(
                    "от $hotelPrice ₽",
                    style: const TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ]),
              )
            ],
          ),
        )
      ],
    ),
  );
}
