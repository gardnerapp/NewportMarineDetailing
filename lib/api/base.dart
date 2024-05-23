import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newport_marine/services/helpers.dart';

class API{
  // PRODUCTION https://newportmarine.app/
  static var url = "http://localhost:3000";
  var appointmentPath = "$url/appointments";

  Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8"
  };

  Future<http.Response> createAppointment(Map<String,dynamic> boatDetails, String serviceName,
      DateTime date, String cost, String services, String additionalInstructions
      ) async {

    var body = jsonEncode({
      'appointment': {
        'name': boatDetails['user_name'],
        'email': boatDetails['user_email'],
        'phone': boatDetails['user_phone'],
        'boat_name': boatDetails['boat_name'],
        'boat_length': boatDetails['boat_length'],
        'dock':  boatDetails['boat_location'],
        'service_name': serviceName,
        'time': formatDate(date),
        'cost': cost,
        'services': services,
        'additional_instructions': additionalInstructions,
      }});

      http.Response response = await http.post(appointmentPath as Uri,
          body: body,
          headers: headers);
      return response;
  }
}