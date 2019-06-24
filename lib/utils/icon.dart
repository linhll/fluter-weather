String getIcon(int id, DateTime time) {
  switch (id) {
    case 200:
    case 201:
    case 202:
    case 210:
    case 211:
    case 212:
    case 221:
    case 230:
    case 231:
    case 232:
      return "11d";
    case 300:
    case 301:
    case 302:
    case 310:
    case 311:
    case 312:
    case 313:
    case 314:
    case 321:
      return "09d";
    case 500:
    case 501:
    case 502:
    case 503:
    case 504:
      return "10d";
    case 511:
      return "13d";
    case 520:
    case 521:
    case 522:
    case 531:
      return "09d";
    case 600:
    case 601:
    case 602:
    case 611:
    case 612:
    case 613:
    case 615:
    case 616:
    case 620:
    case 621:
    case 622:
      return "13d";
    case 701:
    case 711:
    case 721:
    case 731:
    case 741:
    case 751:
    case 761:
    case 762:
    case 771:
    case 781:
      return "50d";
    default:
      return _getOtherIcon(id, time);
  }
}

String _getOtherIcon(int id, DateTime time) {
  var t = time.hour >= 6 && time.hour <= 18 ? "d" : "n";
  switch (id) {
    case 800:
      return "01" + t;
    case 801:
      return "02" + t;
    case 802:
      return "03" + t;
    case 803:
      return "04" + t;
    case 804:
      return "04" + t;
    default:
      return "01" + t;
  }
}
