# Bedtime story generator 2.0 + OpenAI 🌟
 In this workshop, we will continue on the Flutter application that we developed last time. Instead of generating word pairs, we will connect to OpenAI's API and generate bedtime stories. 

## Recap of last workshop
We followed [this tutorial](https://codelabs.developers.google.com/codelabs/flutter-codelab-first#0), where we created a word pair generator for Chrome.
If you didn't attend the last Codelicious workshop, we recommend you to clone this repo and use [Marina's code from workshop nr 5](https://github.com/Codelicious-Oda-x-DNB/codelicious-event-tasks/tree/main/Nr.%205%2014-11-2023/marina-flutter_bedtime_story_generator) as a base.

## This workshop

# Local development

#### Step 1: Sign in or create account in OpenAI
[platform.openai.com/login](https://platform.openai.com/login)
Select chat gpt 3.5, as it is much cheaper, and we don't need a fancy one.

#### Step 2: Generate API keys
We need to include a key to authenticate us when using the API.
Generate your key here, by clicking "+ Create new secret key": [platform.openai.com/api-keys](https://platform.openai.com/api-keys)

#### Step 3: Add the Dio package to your Flutter project
We will use [Dio](https://pub.dev/packages/dio) to send http-requests to the OpenAI API.
Open up a terminal in the project in VS Code, and paste in the following command to install Dio:
```
flutter pub add dio
```

#### Step 4: Allow Chrome to send http requests from localhost
Run this command in your terminal:
```
flutter run -d chrome --web-browser-flag "--disable-web-security"
```

#### Step 5: Send a request to the API when user clicks "Generate"
Copy this code snippet, and update the OPEN_API_KEY to your own.

```
String OPENAI_API_KEY =
      'Bearer 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';
  final dio = Dio();

  Future<ChatCompletion> getOpen() async {
    final response = await dio.post(
      'https://api.openai.com/v1/chat/completions',
      data: {
        'model': 'gpt-3.5-turbo',
        'messages': [
          {
            'role': 'system',
            'content':
                'You are a poetic assistant, skilled in explaining complex programming concepts with creative flair.'
          },
          {
            'role': 'user',
            'content':
                'Compose a poem that explains the concept of recursion in programming.'
          }
        ]
      },
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': OPENAI_API_KEY,
        },
      ),
    );
    return response.data;
  }

```
#### Step 6: Create a class for recieving the response from OpenAI
Add a file to your Flutter project called f ex ChatCompletion.dart, with the following model:

```
class ChatCompletion {
  final String id;
  final String object;
  final int created;
  final String model;
  final List<Choice> choices;
  final Usage usage;
  final String? systemFingerprint; // Some types have to be optional, as the api returns null here

  ChatCompletion({
    required this.id,
    required this.object,
    required this.created,
    required this.model,
    required this.choices,
    required this.usage,
    required this.systemFingerprint,
  });

  factory ChatCompletion.fromJson(Map<String, dynamic> json) {
    return ChatCompletion(
      id: json['id'],
      object: json['object'],
      created: json['created'],
      model: json['model'],
      choices:
          List<Choice>.from(json['choices'].map((x) => Choice.fromJson(x))),
      usage: Usage.fromJson(json['usage']),
      systemFingerprint: json['system_fingerprint'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'object': object,
      'created': created,
      'model': model,
      'choices': List<dynamic>.from(choices.map((x) => x.toJson())),
      'usage': usage.toJson(),
      'system_fingerprint': systemFingerprint,
    };
  }
}

class Choice {
  final int index;
  final Message message;
  final dynamic logprobs;
  final String? finishReason;

  Choice({
    required this.index,
    required this.message,
    required this.logprobs,
    required this.finishReason,
  });

  factory Choice.fromJson(Map<String, dynamic> json) {
    return Choice(
      index: json['index'],
      message: Message.fromJson(json['message']),
      logprobs: json['logprobs'],
      finishReason: json['finish_reason'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'index': index,
      'message': message.toJson(),
      'logprobs': logprobs,
      'finish_reason': finishReason,
    };
  }
}

class Message {
  final String role;
  final String content;

  Message({
    required this.role,
    required this.content,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      role: json['role'],
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'role': role,
      'content': content,
    };
  }
}

class Usage {
  final int promptTokens;
  final int completionTokens;
  final int totalTokens;

  Usage({
    required this.promptTokens,
    required this.completionTokens,
    required this.totalTokens,
  });

  factory Usage.fromJson(Map<String, dynamic> json) {
    return Usage(
      promptTokens: json['prompt_tokens'],
      completionTokens: json['completion_tokens'],
      totalTokens: json['total_tokens'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'prompt_tokens': promptTokens,
      'completion_tokens': completionTokens,
      'total_tokens': totalTokens,
    };
  }
}
```

# Online development

## Recap of last workshop
We followed [this tutorial](https://codelabs.developers.google.com/codelabs/flutter-codelab-first#0), where we created a word pair generator for Chrome.

## This workshop 

### Step 1: Open code in Zapp!
Open www.tinyurl.com/codelicious-v1. Here you can see where we left after the last workshop. 

#### Step 2: Sign in or create account in OpenAI
[platform.openai.com/login](https://platform.openai.com/login)
Select chat gpt 3.5, as it is much cheaper, and we don't need a fancy one.

NB! If you have created an account previously, you may need to re-create it to get new free credits to be used now. If you don't get new credits, you can use Amanda or Tine's API key 😊

#### Step 3: Generate API keys
We need to include a key to authenticate us when using the API.
Generate your key here, by clicking "+ Create new secret key": [platform.openai.com/api-keys](https://platform.openai.com/api-keys)

#### Step 4: Add the Dio package to your Flutter project
We will use [Dio](https://pub.dev/packages/dio) to send http-requests to the OpenAI API.

Open `pubspec.yaml` and add `dio` under `dependencies`:
```
dependencies:
   dio: ^5.4.0
```

#### Step 5: Change the UI

We want to create a page that looks something like this:
![image](https://github.com/Codelicious-Oda-x-DNB/codelicious-event-tasks/assets/36000728/6b7502d7-1cfe-44dd-8dc8-9b57e9dd83bb)


The goal is to have one text field where the user can type, one button that the user needs to click to generate the story by sending an API call to OpenAI, and finally, the results from OpenAI need to show somewhere. 

#### Step 5: Send a request to the API when user clicks "Generate"
Copy this code snippet, and paste in your own secret key in the OPEN_API_KEY variable. 

```
String OPENAI_API_KEY = 'Bearer <YOUR_SECRET_KEY>';
final dio = Dio();

Future<ChatCompletion> getOpen() async {
  final response = await dio.post(
    'https://api.openai.com/v1/chat/completions',
    data: {
      'model': 'gpt-3.5-turbo',
      'messages': [
        {
          'role': 'system',
          'content':
              'You are a poetic assistant, skilled in explaining complex programming concepts with creative flair.'
        },
        {
          'role': 'user',
          'content':
              'Compose a poem that explains the concept of recursion in programming.'
        }
      ]
    },
    options: Options(
      headers: {
        'Content-Type': 'application/json',
        'Authorization': OPENAI_API_KEY,
      },
    ),
  );
  return response.data;
}
```

#### Need help?

You can take a look at www.tinyurl.com/codelicious-finished to get inspiration. 


### Our contributors
<a href="https://github.com/Codelicious-Oda-x-DNB/codelicious-event-tasks/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=Codelicious-Oda-x-DNB/codelicious-event-tasks" />
</a>

## License

Go to [LICENSE](https://github.com/Codelicious-Oda-x-DNB/codelicious-event-tasks/blob/main/LICENSE).
