import 'dart:async';

Future<String> fetchUserData() {
  return Future.delayed(Duration(seconds: 3), () {
    String myID = '6430402074';
    int lastDigit = int.parse(myID[myID.length - 1]);

    if (lastDigit % 2 == 0) {
      return 'Complete with value: The last digit of my ($lastDigit) is an even number';
    } else {
      throw Exception(
          'Complete with error: Exption: The last digit of my ID ($lastDigit) is an odd number');
    }
  });
}

void main() {
  fetchUserData().then((userData) {
    print('$userData');
  }).catchError((error) {
    print('$error');
  });
}
