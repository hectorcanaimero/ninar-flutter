import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Open AI Group Code

class OpenAIGroup {
  static String baseUrl = 'https://api.openai.com/v1';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer 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',
  };
  static ImageGenerationCall imageGenerationCall = ImageGenerationCall();
  static StoryGenerationCall storyGenerationCall = StoryGenerationCall();
}

class ImageGenerationCall {
  Future<ApiCallResponse> call({
    String? prompt = '',
  }) {
    final ffApiRequestBody = '''
{
  "prompt": "${prompt}",
  "n": 1,
  "size": "512x512"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Image Generation',
      apiUrl: '${OpenAIGroup.baseUrl}/images/generations',
      callType: ApiCallType.POST,
      headers: {
        ...OpenAIGroup.headers,
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic urlImage(dynamic response) => getJsonField(
        response,
        r'''$.data[:].url''',
      );
}

class StoryGenerationCall {
  Future<ApiCallResponse> call({
    String? theme = 'Outer Space',
    String? language = 'pt',
    String? age = '',
    String? character = 'Luiz Eduardo',
  }) {
    final ffApiRequestBody = '''
{
  "model": "gpt-3.5-turbo",
  "messages": [
    {
      "role": "system",
      "content": "You are a writer specialized in creating short children's stories."
    },
    {
      "role": "user",
      "content": "You can create a story with children's language adapted for a ${age}-year-old child. The theme of the story is about outer space where the main character's name is ${character}, here are some topics where the story can be inspired: ${theme}; it is important that the language of the story cannot encourage unsafe actions and should leave a moral to the story. The output must be language: ${language} and structured in a JSON format, where it must have a field with the name of the title where the title of the story will be and another with the name of body where the content of the story will be"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Story Generation',
      apiUrl: '${OpenAIGroup.baseUrl}/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        ...OpenAIGroup.headers,
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
    );
  }

  dynamic content(dynamic response) => getJsonField(
        response,
        r'''$.choices[:].message.content''',
      );
}

/// End Open AI Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
