import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final String bmiResult;

  SecondScreen({required this.bmiResult});

  String getBMIStatus(double bmi) {
    if (bmi < 18.5) {
      return 'ZAYIF';
    } else if (bmi >= 18.5 && bmi < 25) {
      return 'NORMAL';
    } else if (bmi >= 25 && bmi < 30) {
      return 'FAZLA KİLOLU';
    } else {
      return 'OBEZ';
    }
  }

  Color getBMIStatusColor(String status) {
    if (status == 'NORMAL') {
      return Colors.green;
    } else if (status == 'ZAYIF') {
      return Colors.blue;
    } else {
      return Colors.red;
    }
  }

  String getBMIText(String status) {
    if (status == 'NORMAL') {
      return "Normal bir vücut ağırlığınız var.\nAferin!";
    } else if (status == 'ZAYIF') {
      return "Vücut ağırlığınız zayıf.\nKilo Alın!";
    } else if(status == 'FAZLA KİLOLU'){
      return "Fazla Kilolusunuz. \nbiraz zayıflayın!";
    } else {
      return "Obezite Seviyesindesiniz. \nAcilen zayıflayın!";
    }
  }

  @override
  Widget build(BuildContext context) {
    double bmi = double.parse(bmiResult);
    String status = getBMIStatus(bmi);
    Color statusColor = getBMIStatusColor(status);
    String statusText = getBMIText(status);


    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('BMI HESAPLAYICI'),
        centerTitle: true,
        backgroundColor: Color(0xFF0A0E21),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.center,
              child: Text(
                "BMI Değeri",
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Color(0xFF1D1E33),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    status,
                    style: TextStyle(
                      color: statusColor,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    bmiResult,
                    style: TextStyle(
                      fontSize: 100.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    statusText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              color: Color(0xFFEB1555),
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: 60.0,
              child: Center(
                child: Text(
                  'YENİDEN HESAPLA',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}