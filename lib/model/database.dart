import 'package:moor_flutter/moor_flutter.dart';
import 'package:todo_list/model/todo.dart';

part 'database.g.dart';

@UseMoor (
  tables: [Todo],
  queries: {
    'getByType': 'SELECT * FROM todo WHERE todo_type = ?',
    '_completeTask': 'UPDATE todo SET isFinish = 1 WHERE id = ?',
    '_deleteTask': 'DELETE FROM todo WHERE id = ?'
  })

class Database {

}