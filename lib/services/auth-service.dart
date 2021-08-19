import '../global.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  final String urlProduct = URL + '/auth';

  Future<String> login(String userName, String password) async {
    try {
      final parametros = {"email": userName, "password": password};
      String parametrosJson = jsonEncode(parametros);

      final url = Uri.parse('$urlProduct/signin');
      final response =
          await http.post(url, body: parametrosJson, headers: HEADERS);
      if (response.statusCode == 200) {
        final respuesta = jsonDecode(response.body);
        return respuesta["token"];
      } else {
        return "";
      }
    } on Exception catch (e) {
      print("error al logear usuario" + e.toString());
      return "";
    }
  }
}
