import 'package:dartz/dartz.dart';
import 'package:pokemony/core/error/exceptions.dart';

import '../core/connection/dio_client.dart';
import '../models/pokemon.dart';
import 'package:dio/dio.dart' as dio;

class PokemonServices {
  Future<List<Pokemon>> getAllPokemons() async {
    try {
      final response = await DioClient.DIO_CLIENT.get('pokemon');

      final List<Pokemon> pokemonList = (response.data['results'] as List)
          .map((item) => Pokemon.fromJson(item))
          .toList();
      return pokemonList;
    } on dio.DioError catch (e) {
      throw ServerException(message: e.message);
    } catch (e) {
      throw ServerException(
        message: 'Error while formating data',
      );
    }
  }
}
