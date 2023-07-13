import 'package:english_lists/app/shared/utils/api.dart';
import 'package:english_lists/app/shared/utils/configs.dart';
import 'package:get/get.dart';
import '../../shared/models/word_model.dart';

class DetailsRepository extends GetConnect{

  Future<WordModel?> getWord(String word)async{
    try{
      var response = await get(
        API.link + word,
        headers: {
          "X-RapidAPI-Key": Configs.token,
          "X-RapidAPI-Host": Configs.host
        }
      );
      return WordModel.fromJson(response.body);
    }catch(e){
      return null;
    }
  }

}