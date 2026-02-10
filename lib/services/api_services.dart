import 'package:bee/models/meal.dart';
import 'package:bee/models/restaurnat.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class ApiService {
  static Future<bool>registerUser({required firstname,required lastname,required password, required email})async{

    final response=await http.post(Uri.parse('////////'),
        headers: {'Content-Type':'application/json'},
        body: jsonEncode({
          "firstname":firstname,
          "lastname":lastname,
          "email":email,
          "password":password,

        })
    );
    if (response.statusCode==200||response.statusCode==201)
      return true;
    else{
      print (response.body);
      return false;
    }


  }
static Future<bool>loginUser({required name ,required password})async{
   final respons=await http.post(Uri.parse('////////'),
    headers: {'Content-Type':'application/json'},
        body:{
      "name":name,
          "password":password
        } );
   if(respons.statusCode==200||respons.statusCode==201){
     return true;
   }
   else
     {
       print(respons.body);
       return false;
     }

}
static Future<List<restaurant>>getRestaurant()async{
    final response=await http.get(Uri.parse('////////'));
    if(response.statusCode==200||response.statusCode==201){
      final List data=jsonDecode(response.body);
     return data.map((json)=>restaurant.fromJson(json)).toList();
    }
    else {
      throw Exception("faild to reload restaurants");
    }

}
static Future<List<meal>>getMeal()async{
    final response=await http.get(Uri.parse(';;;;;'));
    if(response.statusCode==200){
      final List data=jsonDecode(response.body);
      return data.map((json)=>meal.fromJson(json)).toList();

    }
    else
      {throw Exception('faild to get meals');}
}



}