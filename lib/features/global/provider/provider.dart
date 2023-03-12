//private endPoint Engine
import 'package:flutter_chatgpt/core/open_ai_data.dart';

String endPoint(String endPoint) => "$baseURL/$endPoint";

Map<String, String> headerBearerOption(String token) =>
    {
      'Authorization': 'Bearer $token',
      'User-Agent': 'okgodoit/dotnet_openai_api',
      'Content-Type': 'application/json; charset=utf-8'
    };
