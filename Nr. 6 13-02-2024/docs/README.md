# Bedtime story generator 2.0 + OpenAI 🌟
 In this workshop, we will continue on the Flutter application that we developed last time. Instead of generating word pairs, we will connect to OpenAI's API and generate bedtime stories. 

### Recap of last workshop
We followed [this tutorial](https://codelabs.developers.google.com/codelabs/flutter-codelab-first#0), where we created a word pair generator for Chrome.

# Today's workshop 

## Step 1: Open source code

<details>
<summary>
 Online 🛜
</summary>
<br>
Open code in Zapp! at www.tinyurl.com/codelicious-v1. Here you can see where we left after the last workshop. 
 </br>
</details>

<details>
<summary>
 Local :computer:
</summary>
<br>
Open the code you wrote in the last Codelicious workshop in VS Code. If you didn't attend the last workshop, we recommend you to clone this repo and use Marina's code from workshop nr 5 as a base:
 
 [Marina's code ](https://github.com/Codelicious-Oda-x-DNB/codelicious-event-tasks/tree/main/Nr.%205%2014-11-2023/marina-flutter_bedtime_story_generator)
  </br>
</details>

## Step 2: Sign in or create account in OpenAI
Go to [platform.openai.com/login](https://platform.openai.com/login) and create an account.
Select chat gpt 3.5, as it is much cheaper, and we don't need a fancy one.

NB! If you have created an account previously, you may need to re-create it to get new free credits to be used now. If you don't get new credits, you can use Amanda or Tine's API key 😊

## Step 3: Generate API keys
We need to include a key to authenticate us when using the API.
Generate your key here, by clicking "+ Create new secret key": [platform.openai.com/api-keys](https://platform.openai.com/api-keys)

## Step 4: Add the Dio package to your Flutter project
We will use [Dio](https://pub.dev/packages/dio) to send http-requests to the OpenAI API.

<details>
<summary>
 Online 🛜
</summary>
<br>

Open `pubspec.yaml` and add `dio` under `dependencies`:
 
```
dependencies:
   dio: ^5.4.0
```
To update the dependencies in Zapp! you need to press the _Pub Get_ button:

<img width="399" alt="image" src="https://github.com/Codelicious-Oda-x-DNB/codelicious-event-tasks/assets/36000728/1be68c97-5a96-4573-891d-c34c42a9626a">


 </br>
</details>

<details>
<summary>
 Local :computer:
</summary>
<br>
Open up a terminal in the project in VS Code, and paste in the following command to install Dio:
 
```
flutter pub add dio
```

You also need to allow Chrome to send http requests from localhost. Run this command in your terminal:

```
flutter run -d chrome --web-browser-flag "--disable-web-security"
```

  </br>
</details>


## Step 5: Change the UI

We want to create a page that looks something like this:
![image](https://github.com/Codelicious-Oda-x-DNB/codelicious-event-tasks/assets/36000728/6b7502d7-1cfe-44dd-8dc8-9b57e9dd83bb)


The goal is to have one text field where the user can type, one button that the user needs to click to generate the story by sending an API call to OpenAI, and finally, the results from OpenAI need to show somewhere. 

## Step 6: Send a request to the API when user clicks "Generate"
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

## Need help?

<details>
<summary>
 Online 🛜
</summary>
<br>
You can take a look at www.tinyurl.com/codelicious-finished to get inspiration. 
 </br>
</details>

<details>
<summary>
 Local :computer:
</summary>
<br>
Insert url Amanda
  </br>
</details>

### Our contributors
<a href="https://github.com/Codelicious-Oda-x-DNB/codelicious-event-tasks/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=Codelicious-Oda-x-DNB/codelicious-event-tasks" />
</a>

## License

Go to [LICENSE](https://github.com/Codelicious-Oda-x-DNB/codelicious-event-tasks/blob/main/LICENSE).
