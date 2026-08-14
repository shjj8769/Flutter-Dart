import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  double? _bmi;

  @override
  void dispose() {
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }

  void _calculateBmi() {
    final heightCm = double.tryParse(heightController.text.trim());
    final weight = double.tryParse(weightController.text.trim());
    if (heightCm == null || weight == null || heightCm <= 0 || weight <= 0) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('신장과 몸무게를 올바르게 입력해주세요.')));
      return;
    }
    // 입력 cm를 m로 변환: BMI = 체중 / (신장(m) * 신장(m)).
    final height = heightCm / 100;
    setState(() => _bmi = weight / (height * height));
  }

  _BmiLevel get _level {
    final bmi = _bmi ?? 0;
    if (bmi < 18.5) return _BmiLevel.underweight;
    if (bmi < 23) return _BmiLevel.normal;
    if (bmi < 25) return _BmiLevel.overweight;
    if (bmi < 30) return _BmiLevel.obese;
    return _BmiLevel.severelyObese;
  }

  @override
  Widget build(BuildContext context) {
    final level = _level;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text('BMI 계산기'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(14, 12, 14, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _numberField(heightController, '신장을 입력하세요 (단위: cm)'),
              const SizedBox(height: 14),
              _numberField(weightController, '몸무게를 입력하세요 (단위: kg)'),
              const SizedBox(height: 18),
              Center(
                child: ElevatedButton(
                  onPressed: _calculateBmi,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  child: const Text('BMI 계산'),
                ),
              ),
              const SizedBox(height: 38),
              if (_bmi != null) ...[
                Text(
                  '귀하의 bmi지수는 ${_bmi!.toStringAsFixed(1)}이고 ${level.label} 입니다.',
                  style: const TextStyle(
                    color: Color(0xffff5252),
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
              ],
              _bmiChart(level),
            ],
          ),
        ),
      ),
    );
  }

  Widget _numberField(TextEditingController controller, String label) =>
      TextField(
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.blue, fontSize: 13),
          isDense: true,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
        ),
      );

  Widget _bmiChart(_BmiLevel level) => LayoutBuilder(
    builder: (context, constraints) => AspectRatio(
      aspectRatio: 1000 / 667,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: Image.asset('images/bmi.png', fit: BoxFit.contain),
          ),
          if (_bmi != null)
            Positioned(
              top: 0,
              // 그림을 5등분한 각 칸의 중앙에만 화살표를 배치합니다.
              left: (constraints.maxWidth * ((level.slot + 0.5) / 5)) - 15,
              child: const Icon(
                Icons.arrow_drop_down,
                color: Colors.black,
                size: 42,
              ),
            ),
        ],
      ),
    ),
  );
}

enum _BmiLevel {
  underweight('저체중', 0),
  normal('정상체중', 1),
  overweight('과체중', 2),
  obese('비만', 3),
  severelyObese('고도비만', 4);

  const _BmiLevel(this.label, this.slot);
  final String label;
  final int slot;
}
