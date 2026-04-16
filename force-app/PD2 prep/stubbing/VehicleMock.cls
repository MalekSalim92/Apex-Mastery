@isTest
public with sharing class VehicleMock implements System.StubProvider {
  Decimal distance;
  public VehicleMock(Decimal distance) {
    this.distance = distance;
  }
  public Object handleMethodCall(
    Object stubbedObject,
    String stubbedMethodName,
    Type returnType,
    List<Type> listOfParamTypes,
    List<String> listOfParamNames,
    List<Object> listOfArgs
  ) {
    if (stubbedMethodName == 'getTotalMilesTraveled') {
      return this.distance;
    }
    return null;
  }
}
