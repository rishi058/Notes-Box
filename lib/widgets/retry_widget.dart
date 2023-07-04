import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:notes_box/Sizer/sizer.dart';

class RetryWidget extends StatefulWidget {
  final Function onRetry;

  const RetryWidget({super.key, required this.onRetry});

  @override
  RetryWidgetState createState() => RetryWidgetState();
}

class RetryWidgetState extends State<RetryWidget> {
  bool _showProgressIndicator = true;

  setLoading(){
    setState(() {
      _showProgressIndicator = true;
    });
    Future.delayed(const Duration(seconds: 5), () {
      if(mounted){
        setState(() {
          _showProgressIndicator = false;
        });
      }
    });
  }

  @override
  void initState() {
    setLoading();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _showProgressIndicator
          ? const CircularProgressIndicator()
          : Column(
        mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 25.h,
                  width: 25.h,
                  child: Lottie.asset('assets/no-internet-connection.json')),
              SizedBox(height: 2.5.h),
              ElevatedButton(
        onPressed: (){
              widget.onRetry();
              setLoading();
              },
        child: const Text('Retry'),
      ),
            ],
          ),
    );
  }
}
