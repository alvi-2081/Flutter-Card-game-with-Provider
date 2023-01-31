import 'dart:math';

class Utils{
  static int random() {
    Random rnd;
    int min = 0;
    int max = 3;
    rnd = Random();
    int r = min + rnd.nextInt(max - min);
    return r;
  }
}