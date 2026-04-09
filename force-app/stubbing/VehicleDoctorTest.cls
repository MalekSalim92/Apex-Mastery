@isTest
private class VehicleDoctorTest {
  @isTest
  static void checkStatusTest() {
    Vehicle vm = (Vehicle) Test.createStub(
      Vehicle.class,
      new VehicleMock(10090000)
    );

    VehicleDoctor vd = new VehicleDoctor();
    Boolean status;
    Test.startTest();
    status = vd.checkVehicleStatus(vm);
    Test.stopTest();

    Assert.areEqual(false, status, 'Expected FALSE');
  }
}
