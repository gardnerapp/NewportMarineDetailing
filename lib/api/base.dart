import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newport_marine/services/helpers.dart';

class API{
  // PRODUCTION newportmarineappp.xyz/appointments
  static var host = "newportmarineappp.xyz";
  var appointmentPath = "/appointments";

  Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8"
  };

  Future<http.Response> createAppointment(Map<String,dynamic> boatDetails, String serviceName,
      DateTime date, double cost, Map<String,dynamic> services, String additionalInstructions
      ) async {

    var body = jsonEncode({
      'appointment': {
        'name': boatDetails['user_name'],
        'email': boatDetails['user_email'],
        'phone': boatDetails['user_phone'],
        'boat_name': boatDetails['boat_name'],
        'boat_length': boatDetails['length'],
        'dock':  boatDetails['boat_location'],
        'service_name': serviceName,
        'time': formatDate(date),
        'cost': cost,
        'services': services,
        'additional_instructions': additionalInstructions,
      }});

      http.Response response = await http.post(
          Uri(
            scheme: "https",
            port: 443,
            host: host,
            path: appointmentPath
          ),
          body: body,
          headers: headers);
      return response;
  }
}