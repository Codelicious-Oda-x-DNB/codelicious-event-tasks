# Bedtime story generator 2.0 + OpenAI 🌟
 In this workshop, we will continue on the Flutter application that we developed last time. Instead of generating word pairs, we will connect to OpenAI's API and generate bedtime stories. 

## Recap of last workshop
We followed this tutorial: https://platform.openai.com/docs/quickstart?context=node
We made a word generator for Chrome.
If you didn't attend the last Codelicious workshop, we recommend you to clone Marina's code using this git command, and start from there:

## This workshop

### Step 1: Sign in or create account in OpenAI
[platform.openai.com/login](https://platform.openai.com/login)
Select chat gpt 3.5, as it is much cheaper, and we don't need a fancy one.

### Step 2: Generate API keys
In order to authenticate us and use the API, we need to have a bearer key.
Generate your key here, and call it f ex "Bedtime story": https://platform.openai.com/docs/quickstart?context=node

### Step 3: Send a request to the API when user clicks "Generate"
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
    Map<String, dynamic> map = response.data;
    ChatCompletion chatCompletion = ChatCompletion.fromJson(map);
    return chatCompletion;
  }

```


### Our contributors
<a href="https://github.com/Codelicious-Oda-x-DNB/codelicious-event-tasks/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=Codelicious-Oda-x-DNB/codelicious-event-tasks" />
</a>

## License

Go to [LICENSE](https://github.com/Codelicious-Oda-x-DNB/codelicious-event-tasks/blob/main/LICENSE).
