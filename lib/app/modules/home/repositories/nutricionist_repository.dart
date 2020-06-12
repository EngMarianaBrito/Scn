import 'package:dio/dio.dart';
import 'package:nutricao/app/modules/home/models/nutricionist_model.dart';

class NutricionistData {
  Future<Nutricionist> fetchData() async {
    try {
      String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjEsImlhdCI6MTU5MTg5OTExNH0.RjKrTsyf_7ecpS8TkXvehUMhUZLs1EKYd-_Wf2VFHjY';
      BaseOptions options = new BaseOptions(
        baseUrl: "https://nutricaoapp.herokuapp.com",
        connectTimeout: 5000,
        headers: {'Authorization': 'Bearer $token'}
      );

      var response =
          await Dio(options).get("/nutricionist");

          final data = {"data": response.data};

      return Nutricionist.fromJson(data);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
