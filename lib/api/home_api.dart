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

  static Future<String> getListingAllProv() async {
    final response = await client.get(
      globals.urlAPIGo + "/public/api/prov.json",
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

  static Future<String> getListingTangerang() async {
    final response = await client.get(
      "https://sumurpantau.tangerangkota.go.id/arcgis/rest/services/Kesehatan/covid/MapServer/0/query?where=1%3D1&text=&objectIds=&time=&geometry=&geometryType=esriGeometryPoint&inSR=&spatialRel=esriSpatialRelIntersects&relationParam=&outFields=*&returnGeometry=true&returnTrueCurves=false&maxAllowableOffset=&geometryPrecision=&outSR=&having=&returnIdsOnly=false&returnCountOnly=false&orderByFields=&groupByFieldsForStatistics=&outStatistics=&returnZ=false&returnM=false&gdbVersion=&historicMoment=&returnDistinctValues=false&resultOffset=&resultRecordCount=&queryByDistance=&returnExtentOnly=false&datumTransformation=&parameterValues=&rangeValues=&quantizationParameters=&featureEncoding=esriDefault&f=geojson",
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
