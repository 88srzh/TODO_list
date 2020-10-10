import 'package:flutter/material.dart';
import 'package:todo_list/widgets/custom_icon_decoration.dart';

class EventPage extends StatefulWidget {
  EventPage({Key key}) : super(key: key);

  @override
  _EventPageState createState() => _EventPageState();
}

class Event {
  final String time;
  final String task;
  final String desc;
  final bool isFinish;

  const Event(this.time, this.task, this.desc, this.isFinish);
}

final List<Event> _eventList = [
  new Event("08:00", "Попить чая с Георгичем", "Личное", true),
  new Event("10:00", "Написать отчет", "Работа", true),
  new Event("12:00", "Сходить за молоком", "Лично", false),
  new Event("14:00", "Сделать документацию", "Работа", false),
  new Event("16:00", "Посмотреть теоритический курс", "Лично", false),
  new Event("18:00", "Помыть кота", "Лично", false),
  new Event("20:00", "Еще чего-нибудь поделать", "Лично", false),
  new Event("22:00", "Настроить ило", "Работа", false),
];

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    double iconSize = 20;
    return ListView.builder(
      itemCount: _eventList.length,
      padding: const EdgeInsets.all(0),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          child: Row(
            children: <Widget>[
              _lineStyle(context, iconSize, index, _eventList.length, _eventList[index].isFinish),
              _displayTime(_eventList[index].time),
              _displayContent(_eventList[index])
            ],
          ),
        );
      },
    );
  }

  Expanded _displayContent(Event event) {
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
                      Text(event.task),
                      SizedBox(
                        height: 12,
                      ),
                      Text(event.desc),
                    ],
                  ),
                ),
              ),
            );
  }

  Container _displayTime(String time) {
    return Container(
                width: 80,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(time),
                ));
  }

  Container _lineStyle(BuildContext context, double iconSize, int index, int listLenght, bool isFinish) {
    return Container(
                decoration: CustomIconDecoration(
                    iconSize: iconSize,
                    lineWidth: 1,
                    firstData: index == 0 ?? true,
                    lastData: index == listLenght - 1 ?? true),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 3),
                            color: Color(0x20000000),
                            blurRadius: 5)
                      ]),
                  child: Icon(
                    isFinish
                        ? Icons.fiber_manual_record
                        : Icons.radio_button_unchecked,
                    size: 20,
                    color: Theme.of(context).accentColor,
                  ),
                ));
  }
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
