import 'dart:convert';

import 'package:http/http.dart' as http;

class API{
  // PRODUCTION https://newportmarine.app/
  static var url = "http://localhost:3000";
  var appointmentPath = "$url/appointments";

  Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8"
  };

  Future<http.Response> createAppointment(String name, String email,
      String phone, String boatName, int boatLength, String dock, String serviceName,
      String time, String cost, String services, String additionalInstructions
      ) async {

    var body = jsonEncode({
      'appointment': {
        'name': name,
        'email': email,
        'phone': phone,
        'boat_ame': boatName,
        'boat_length': boatLength,
        'dock': dock,
        'service_name': serviceName,
        'time': time,
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