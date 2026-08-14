import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController num1TextController = TextEditingController();
  final TextEditingController num2TextController = TextEditingController();
  List<String> calcResults = List<String>.filled(4, '');
  final List<String> fruitscalc = [
    'images/Apple.png',
    'images/Banana.png',
    'images/Grape.png',
    'images/Orange.png',
  ];

  bool _isAdditionOn = true;
  bool _isSubtractionOn = true;
  bool _isMultiplicationOn = true;
  bool _isDivisionOn = true;

  @override
  void dispose() {
    num1TextController.dispose();
    num2TextController.dispose();
    super.dispose();
  }

  void _calculate() {
    final num1 = double.tryParse(num1TextController.text.trim());
    final num2 = double.tryParse(num2TextController.text.trim());

    if (num1 == null || num2 == null) {
      setState(() => calcResults = List<String>.filled(4, ''));
      return;
    }

    setState(() {
      calcResults = [
        _isAdditionOn ? _formatNumber(num1 + num2) : '',
        _isSubtractionOn ? _formatNumber(num1 - num2) : '',
        _isMultiplicationOn ? _formatNumber(num1 * num2) : '',
        _isDivisionOn
            ? (num2 == 0 ? '0으로 나눌 수 없습니다.' : _formatNumber(num1 / num2))
            : '',
      ];
    });
  }

  String _formatNumber(double value) {
    return value == value.roundToDouble()
        ? value.toInt().toString()
        : value.toString();
  }

  void _clear() {
    num1TextController.clear();
    num2TextController.clear();
    setState(() {
      calcResults = List<String>.filled(4, '');
      _isAdditionOn = true;
      _isSubtractionOn = true;
      _isMultiplicationOn = true;
      _isDivisionOn = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text('간단한 계산기'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _numberField(
                controller: num1TextController,
                label: '첫번째 숫자를 입력하세요',
                autofocus: true,
              ),
              const SizedBox(height: 12),
              _numberField(
                controller: num2TextController,
                label: '두번째 숫자를 입력하세요',
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: _calculate, child: const Text('계산하기')),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: _clear,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('지우기'),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 4,
                runSpacing: 4,
                children: [
                  _operationSwitch('덧셈', _isAdditionOn, (value) => setState(() => _isAdditionOn = value)),
                  _operationSwitch('뺄셈', _isSubtractionOn, (value) => setState(() => _isSubtractionOn = value)),
                  _operationSwitch('곱셈', _isMultiplicationOn, (value) => setState(() => _isMultiplicationOn = value)),
                  _operationSwitch('나눗셈', _isDivisionOn, (value) => setState(() => _isDivisionOn = value)),
                ],
              ),
              const SizedBox(height: 26),
              _resultField('덧셈 결과', calcResults[0]),
              _resultField('뺄셈 결과', calcResults[1]),
              _resultField('곱셈 결과', calcResults[2]),
              _resultField('나눗셈 결과', calcResults[3]),
              const SizedBox(height: 16),
              Center(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(fruitscalc.length, (index) {
                      if (!_isOperationOn(index)) {
                        return const SizedBox.shrink();
                      }

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(fruitscalc[index]),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _numberField({
    required TextEditingController controller,
    required String label,
    bool autofocus = false,
  }) {
    return TextField(
      controller: controller,
      autofocus: autofocus,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(labelText: label),
    );
  }

  Widget _operationSwitch(String label, bool value, ValueChanged<bool> onChanged) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label),
        Switch(
          value: value,
          onChanged: (isOn) {
            onChanged(isOn);
            if (!isOn) {
              setState(() {
                calcResults = [
                  _isAdditionOn ? calcResults[0] : '',
                  _isSubtractionOn ? calcResults[1] : '',
                  _isMultiplicationOn ? calcResults[2] : '',
                  _isDivisionOn ? calcResults[3] : '',
                ];
              });
            }
          },
        ),
      ],
    );
  }

  bool _isOperationOn(int index) {
    return switch (index) {
      0 => _isAdditionOn,
      1 => _isSubtractionOn,
      2 => _isMultiplicationOn,
      _ => _isDivisionOn,
    };
  }

  Widget _resultField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: TextEditingController(text: value),
        readOnly: true,
        decoration: InputDecoration(labelText: label),
      ),
    );
  }
}
