# Futter Todos

A mobile application created to demonstrate different techniques of managing state in a flutter application.

## General information

The project is tag at different points for 3 different implementations of managing the state as follows:

1. Regular Statefull components. Checkout the tag state `$ git checkout state`
1. Redux implementation. Checkout the tag redux `$ git checkout redux`
1. BLoC (Business Logic Components) implementation. Checkout the tag BLoC `$ git checkout BLoC`

## How to run project

1. Get the dependencies
   `$ flutter packages get`
2. Make sure either you have a device connected or open an emulator

- [Android Emulator](https://developer.android.com/studio/run/managing-avds)
- [IOS Emulator](https://flutter.io/docs/get-started/install/macos)

3. Make sure you have a todo service running checkout [todos service](https://github.com/ocalvet/todos_service)
4. Update your todo_service.dart file with the correct service url
5. Start the flutter application
   `$ flutter run`

## Run test

1. Run `$ flutter test`

### TODOS

- Persist filter state
- Add pictures to todos
