import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/model/database.dart';
import 'package:todo_list/model/todo.dart';
import 'package:todo_list/widgets/custom_button.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  Database provider;

  double get iconSize => null;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<Database>(context);

    return StreamProvider.value(
      value: provider.getTodoByType(TodoType.TYPE_EVENT.index),
      child: Consumer<List<TodoData>>(
        builder: (context, _eventList, child) {
          return _eventList == null
              ? Center(child: CircularProgressIndicator())
              :
              // double iconSize = 20;
              ListView.builder(
                  itemCount: _eventList.length,
                  padding: const EdgeInsets.all(0),
                  itemBuilder: (context, index) {
                    return _eventList[index].isFinish
                        // padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                        ? _eventComplete(_eventList[index])
                        : _eventUncomplete(_eventList[index]);
                  },
                );
        },
      ),
    );
  }

  Widget _eventUncomplete(TodoData data) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    Text("Подтвержденное",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    SizedBox(
                      height: 24,
                    ),
                    Text(data.task),
                    SizedBox(
                      height: 24,
                    ),
                    Text(new DateFormat("dd-MM-yyyy").format(data.date)),
                    SizedBox(
                      height: 24,
                    ),
                    CustomButton(
                      buttonText: "Выполнено",
                      onPressed: () {
                        provider
                            .completeTodoEntries(data.id)
                            .whenComplete(() => Navigator.of(context).pop());
                      },
                      color: Theme.of(context).accentColor,
                      textColor: Colors.white,
                    ),
                  ]),
                ),
              );
            });
      },
      onLongPress: () {
        showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    Text("Удалить задачу",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    SizedBox(
                      height: 24,
                    ),
                    Text(data.task),
                    SizedBox(
                      height: 24,
                    ),
                    Text(new DateFormat("dd-MM-yyyy").format(data.date)),
                    SizedBox(
                      height: 24,
                    ),
                    CustomButton(
                      buttonText: "Удалить",
                      onPressed: () {
                        provider
                            .deleteTodoEntries(data.id)
                            .whenComplete(() => Navigator.of(context).pop());
                      },
                      color: Theme.of(context).accentColor,
                      textColor: Colors.white,
                    ),
                  ]),
                ),
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        child: Row(
          children: <Widget>[
            _simpleLineStyle(data),
            _displayTime(data),
            _displayContent(data)
          ],
        ),
      ),
    );
  }

  Widget _eventComplete(TodoData data) {
    return InkWell(
      onLongPress: () {
        showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    Text("Удалить задачу",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    SizedBox(
                      height: 24,
                    ),
                    Text(data.task),
                    SizedBox(
                      height: 24,
                    ),
                    Text(new DateFormat("dd-MM-yyyy").format(data.date)),
                    SizedBox(
                      height: 24,
                    ),
                    CustomButton(
                      buttonText: "Удалить",
                      onPressed: () {
                        provider
                            .deleteTodoEntries(data.id)
                            .whenComplete(() => Navigator.of(context).pop());
                      },
                      color: Theme.of(context).accentColor,
                      textColor: Colors.white,
                    ),
                  ]),
                ),
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        child: Row(
          children: <Widget>[
            _simpleLineStyle(data),
            _displayTime(data),
            _displayContent(data)
          ],
        ),
      ),
    );
  }

  Widget _displayContent(TodoData data) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
        child: Container(
          padding: const EdgeInsets.all(14.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12)),
              boxShadow: [
                BoxShadow(
                  color: Color(0x20000000),
                  blurRadius: 5,
                  offset: Offset(0, 3),
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data.task),
              SizedBox(
                height: 12,
              ),
              Text(data.description),
            ],
          ),
        ),
      ),
    );
  }

  Container _displayTime(TodoData data) {
    return Container(
      width: 80,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text(new DateFormat("hh : mm").format(data.time)),
      ),
    );
  }

  // Container _lineStyle(BuildContext context, double iconSize, int index,
  //     int listLenght, bool isFinish) {
  //   return Container(
  //       decoration: CustomIconDecoration(
  //           iconSize: iconSize,

  //           lineWidth: 1,
  //           firstData: index == 0 ?? true,
  //           lastData: index == listLenght - 1 ?? true),
  //       child: Container(
  //         decoration: BoxDecoration(
  //             borderRadius: BorderRadius.all(Radius.circular(50)),
  //             boxShadow: [
  //               BoxShadow(
  //                   offset: Offset(0, 3),
  //                   color: Color(0x20000000),
  //                   blurRadius: 5)
  //             ]),
  //         child: Icon(
  //           isFinish
  //           ? Icons.fiber_manual_record
  //           : Icons.radio_button_unchecked,
  //           size: 20,
  //           color: Theme.of(context).accentColor,
  //         ),
  //       ));
  // }
}

Container _simpleLineStyle(TodoData data) {
  return Container(
      child: Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 3), color: Color(0x20000000), blurRadius: 5)
        ]),
    child: Icon(
      data.isFinish ? Icons.radio_button_checked : Icons.radio_button_unchecked,
      size: 20,
      color: Colors.redAccent,
    ),
  ));
}

class IconDecoration extends Decoration {
  final double iconSize;
  final double lineWidth;
  final bool firstData;
  final bool lastData;

  IconDecoration({
    @required double iconSize,
    @required double lineWidth,
    @required bool firstData,
    @required bool lastData,
  })  : this.iconSize = iconSize,
        this.lineWidth = lineWidth,
        this.firstData = firstData,
        this.lastData = lastData;

  @override
  BoxPainter createBoxPainter([onChanged]) {
    // TODO: implement createBoxPainter
    return IconLine(
      iconSize: iconSize,
      lineWidth: lineWidth,
      firstData: firstData,
      lastData: lastData,
    );
  }
}

class IconLine extends BoxPainter {
  final double iconSize;
  final bool firstData;
  final bool lastData;

  final Paint paintLine;

  IconLine({
    @required double iconSize,
    @required double lineWidth,
    @required bool firstData,
    @required bool lastData,
  })  : this.iconSize = iconSize,
        this.firstData = firstData,
        this.lastData = lastData,
        paintLine = Paint()
          ..color = Colors.red
          ..strokeCap = StrokeCap.round
          ..strokeWidth = lineWidth
          ..style = PaintingStyle.stroke;
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final leftOffset = Offset((iconSize / 2) + 24, offset.dy);
    final double iconSpace = iconSize / 1.5;

    final Offset top = configuration.size.topLeft(Offset(leftOffset.dx, 0.0));
    final Offset centerTop = configuration.size
        .centerLeft(Offset(leftOffset.dx, leftOffset.dy - iconSpace));
    final Offset centerBottom = configuration.size
        .centerLeft(Offset(leftOffset.dx, leftOffset.dy + iconSpace));
    final Offset end =
        configuration.size.bottomLeft(Offset(leftOffset.dx, leftOffset.dy * 2));

    if (!firstData) canvas.drawLine(top, centerTop, paintLine);
    if (!lastData) canvas.drawLine(centerBottom, end, paintLine);
  }
}
