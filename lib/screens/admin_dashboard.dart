import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 25.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: ListView(
            shrinkWrap: true,
            children: [
              Text(
                'Admin Dashboard',
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Recent employee entries and there are estiamted insurance costs.',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.black, width: 0.5),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name: John Wamala'),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text('Age: 45'),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text('Weight: 89'),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Estimated: UGX 145,000',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ]),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.black, width: 0.5),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name: Susan Nalubega'),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text('Age: 39'),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text('Weight: 73'),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Estimated: UGX 120,000',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ]),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.black, width: 0.5),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name: Kakooza Peter'),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text('Age: 35'),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text('Weight: 23'),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Estimated: UGX 150,000',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
