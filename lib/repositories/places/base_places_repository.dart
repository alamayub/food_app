import 'package:food_app/models/place.dart';
import 'package:food_app/models/place_autocomplete_model.dart';

abstract class BasePlacesRepository {
  Future<List<PlaceAutocomplete>?> getAutocomplete(String searchInput);

  Future<Place?> getPlace(String placeId);
}
