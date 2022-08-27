
import 'dart:convert';

import 'package:http/http.dart' as http;

class myNetwork{

  var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
  Future<String> getResult()
  async{
    http.Response response = await http.get(url);
    if(response.statusCode == 200)
      {

        return response.body;
      }
    else
      {
        return "there is error";
      }
  }
}
