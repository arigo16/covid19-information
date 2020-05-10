import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'dart:async';

import '../helper/globals.dart' as globals;

Client client = Client();

class ApiServiceHome {
  static Future<String> getDataIndonesia() async {
    final response = await client.get(
      globals.urlAPIGo + "/public/api/update.json",
      headers: {
        "content-type": "application/json",
      },
    );

    final statusCode = response.statusCode;

    if (statusCode == 200) {
      var respJson = json.decode(response.body);

      Map map = {
        "status": 200,
        "data": respJson,
      };

      return json.encode(map);
    } else {
      var respJson = json.decode(response.body);
      var message = respJson["messages"];

      Map map = {"status": statusCode, "messages": message};

      return json.encode(map);
    }
  }

  static Future<String> getDataGlobal() async {
    final response = await client.get(
      globals.urlAPICovid19 + "/summary",
      headers: {
        "content-type": "application/json",
      },
    );

    final statusCode = response.statusCode;

    if (statusCode == 200) {
      var respJson = json.decode(response.body);

      Map map = {
        "status": 200,
        "data": respJson,
      };

      return json.encode(map);
    } else {
      var respJson = json.decode(response.body);
      var message = respJson["messages"];

      Map map = {"status": statusCode, "messages": message};

      return json.encode(map);
    }
  }

  static Future<String> getListingAllCountry() async {
    final response = await client.get(
      globals.urlAPIKawal + "/",
      headers: {
        "content-type": "application/json",
      },
    );

    final statusCode = response.statusCode;

    if (statusCode == 200) {
      var respJson = json.decode(response.body);

      Map map = {
        "status": 200,
        "data": respJson,
      };

      return json.encode(map);
    } else {
      var respJson = json.decode(response.body);
      var message = respJson["messages"];

      Map map = {"status": statusCode, "messages": message};

      return json.encode(map);
    }
  }
}
