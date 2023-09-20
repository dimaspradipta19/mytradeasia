abstract class UseCase<Type, Params> {
  Future<Type> call({required Params param});
}

abstract class UseCaseFourParams<Type, A, B, C, D> {
  Future<Type> call(
      {required A paramsOne,
      required B paramsTwo,
      required C paramsThree,
      required D paramsFour});
}
