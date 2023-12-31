import 'package:flutter/material.dart';

class PushNotificationFilters extends StatefulWidget {
  final Function(int) onPressed; // onPressed 함수 추가

  PushNotificationFilters({Key? key, required this.onPressed})
      : super(key: key);

  @override
  State<PushNotificationFilters> createState() =>
      _PushNotificationFiltersState();
}

class _PushNotificationFiltersState extends State<PushNotificationFilters> {
  int selectedBtnIdx = 0; // 선택된 버튼의 인덱스

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // 좌우 정렬 추가
        children: [
          _RequestMoneyFilter(
            value: 0,
            text: '전체',
            isSelected: selectedBtnIdx == 0,
            onPressed: () {
              setState(() {
                selectedBtnIdx = 0;
              });
              widget.onPressed(selectedBtnIdx); // onPressed 콜백 호출
            },
          ),
          _RequestMoneyFilter(
            value: 1,
            text: '미션',
            isSelected: selectedBtnIdx == 1,
            onPressed: () {
              setState(() {
                selectedBtnIdx = 1;
              });
              widget.onPressed(selectedBtnIdx); // onPressed 콜백 호출
            },
          ),
          _RequestMoneyFilter(
            value: 2,
            text: '질문',
            isSelected: selectedBtnIdx == 2,
            onPressed: () {
              setState(() {
                selectedBtnIdx = 2;
              });
              widget.onPressed(selectedBtnIdx); // onPressed 콜백 호출
            },
          ),
          _RequestMoneyFilter(
            value: 3,
            text: '계좌',
            isSelected: selectedBtnIdx == 3,
            onPressed: () {
              setState(() {
                selectedBtnIdx = 3;
                widget.onPressed(selectedBtnIdx); // onPressed 콜백 호출
              });
            },
          ),
        ],
      ),
    );
  }
}

class _RequestMoneyFilter extends StatelessWidget {
  final int value;
  final String text;
  final bool isSelected;
  final Function onPressed;

  _RequestMoneyFilter({
    super.key,
    required this.value,
    required this.text,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: ElevatedButton(
          onPressed: () {
            onPressed();
          },
          style: isSelected
              ? _selectedRequestMoneyFilterBtnStyle()
              : _unselectedRequestMoneyFilterBtnStyle(),
          child: Text(
            text,
            style: isSelected
                ? _selectedRequestMoneyFilterTextStyle()
                : _unselectedRequestMoneyFilterTextStyle(),
          ),
        ));
  }
}

ButtonStyle _unselectedRequestMoneyFilterBtnStyle() {
  return ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      side: BorderSide(
        // color: const Color(0xFF8320E7), // 테두리 색상 설정
        color: const Color(0xFFB9B9B9),
        width: 1.0, // 테두리 두께 설정
      ),
    )),
  );
}

TextStyle _unselectedRequestMoneyFilterTextStyle() {
  return TextStyle(color: Color.fromARGB(255, 146, 146, 146));
}

ButtonStyle _selectedRequestMoneyFilterBtnStyle() {
  return ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFF3E6FF)),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      side: BorderSide(
        // color: const Color(0xFF8320E7), // 테두리 색상 설정
        color: const Color(0xFF8320E7),
        width: 2.0, // 테두리 두께 설정
      ),
    )),
  );
}

TextStyle _selectedRequestMoneyFilterTextStyle() {
  return TextStyle(color: const Color(0xFF8320E7), fontWeight: FontWeight.bold);
}
