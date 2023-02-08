// ignore_for_file: constant_identifier_names

// server base url
import 'package:get_storage/get_storage.dart';

const String kServerURL = 'https://pokeapi.co/api/v2/';

const String SERVER_FAILURE_MESSAGE = 'Please try again later .';
const String OFFLINE_FAILURE_MESSAGE = 'Please Check your Internet Connection';
const String USER_DATA = "user_data";

class CommonVariables {
  static GetStorage userData = GetStorage();
}
