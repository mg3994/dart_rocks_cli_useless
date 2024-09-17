import 'dart:convert';
import 'package:http/http.dart' as http;

class Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      userId: json['userId'] ?? 0,
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      completed: json['completed'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'completed': completed,
    };
  }

  @override
  String toString() {
    return 'Todo{userId: $userId, id: $id, title: $title, completed: $completed}';
  }
}

Future<T> fetch<T>(String url,
    {String method = 'GET',
    dynamic body,
    Map<String, String>? headers,
    required T Function(Map<String, dynamic>) fromJson}) async {
  final request = http.Request(method, Uri.parse(url))
    ..headers.addAll(headers ?? {})
    ..body = body != null ? jsonEncode(body) : '';

  final streamedResponse = await request.send();
  final responseBody = await streamedResponse.stream.bytesToString();

  if (streamedResponse.statusCode == 200) {
    final jsonResponse = jsonDecode(responseBody);
    if (jsonResponse is Map<String, dynamic>) {
      print(jsonResponse);
      return fromJson(jsonResponse);
    } else {
      throw Exception(
          'Expected a Map<String, dynamic> but got ${jsonResponse.runtimeType}');
    }
  } else {
    throw Exception('Failed to load data: ${streamedResponse.statusCode}');
  }
}

void main() async {
  const apiUrl = 'https://jsonplaceholder.typicode.com/todos/1';

  try {
    final todo = await fetch<Todo>(
      apiUrl,
      method: 'PUT',
      body: {'title': 'New Title', 'completed': true, 'userId': 10},
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      fromJson: (json) => Todo.fromJson(json),
    );
    print('Todo: $todo');
  } catch (e) {
    print('Error: $e');
  }
}
