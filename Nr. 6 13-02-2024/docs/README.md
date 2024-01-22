# Bedtime story generator 2.0 + OpenAI 🌟
 In this workshop, we will continue on the Flutter application that we developed last time. Instead of generating word pairs, we will connect to OpenAI's API and generate bedtime stories. 

## Recap of last workshop
We followed [this tutorial](https://platform.openai.com/docs/quickstart?context=node), where we made a word generator for Chrome.
If you didn't attend the last Codelicious workshop, we recommend you to clone this repo and use [Marina's code from workshop nr 5](https://github.com/Codelicious-Oda-x-DNB/codelicious-event-tasks/tree/main/Nr.%205%2014-11-2023/marina-flutter_bedtime_story_generator) as a base.

## This workshop

#### Step 1: Sign in or create account in OpenAI
[platform.openai.com/login](https://platform.openai.com/login)
Select chat gpt 3.5, as it is much cheaper, and we don't need a fancy one.

#### Step 2: Generate API keys
We need to include a key to authenticate us when using the API.
Generate your key here, by clicking "+ Create new secret key": [platform.openai.com/api-keys](https://platform.openai.com/api-keys)

#### Step 3: Add the Dio package to your Flutter project
We will use Dio to send http-requests to the API: https://pub.dev/packages/dio
Open up a terminal in the project in VS Code, and paste in the following command to install Dio:
```
flutter pub add dio
```


#### Step 4: Send a request to the API when user clicks "Generate"
Copy this code snippet, and change the OPEN_API_KEY to your own.

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


### Our contributors
<a href="https://github.com/Codelicious-Oda-x-DNB/codelicious-event-tasks/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=Codelicious-Oda-x-DNB/codelicious-event-tasks" />
</a>

## License

Go to [LICENSE](https://github.com/Codelicious-Oda-x-DNB/codelicious-event-tasks/blob/main/LICENSE).
