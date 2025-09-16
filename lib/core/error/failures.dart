abstract class Failures {
  String? message;

  Failures({this.message});
}

class GeneralFailure extends Failures {
  GeneralFailure({super.message});
}


class WrongPasswordFailure extends Failures {
  WrongPasswordFailure({super.message});
}


class NetworkFailure extends Failures {
  NetworkFailure({super.message});
}

