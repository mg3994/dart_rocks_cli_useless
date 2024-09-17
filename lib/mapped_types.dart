abstract class Event {
  const Event({required this.add, required this.delete, required this.move});
  final String add, delete, move;
}
// class Events {
//   final String add;
//   final String delete;
//   final String move;

//   Events({required this.add, required this.delete, required this.move});
// }
// typedef EventHandler = void Function();
typedef OnAdd = void Function();
typedef OnDelete = void Function();
typedef OnMove = void Function();

class UserActions {
  final OnAdd onAdd;
  //  final EventHandler onAdd;
  final OnDelete onDelete;
  final OnMove onMove;

  UserActions(
      {required this.onAdd, required this.onDelete, required this.onMove});
}

void main() {
  var userActions = UserActions(
    onAdd: () {},
    onDelete: () {},
    onMove: () {},
  );
}
