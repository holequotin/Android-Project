import 'package:amazone_clone_tutorial/constants/error_handling.dart';
import 'package:amazone_clone_tutorial/constants/global_variables.dart';
import 'package:amazone_clone_tutorial/constants/utils.dart';
import 'package:amazone_clone_tutorial/models/user.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
class AuthService{
  //sign user
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async{
    try{
       User user = User(
        id: '', 
        name: name,
        password: password, 
        email: email, 
        address: '', 
        type: '', 
        token: '',
        );
        String uri = "http://localhost:3000/api/signup";
      Response res = await http.post(
        Uri.parse(uri),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            'Account created! Login with the same credentials!',
          );
        },
      );
      print("Completed");
    }catch(e){
        showSnackBar(context, e.toString());
    }
  }
}