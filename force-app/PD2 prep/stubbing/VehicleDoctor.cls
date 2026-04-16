public with sharing class VehicleDoctor {
  public Boolean checkVehicleStatus(Vehicle v) {
    Boolean status = true;
    Decimal miles = v.getTotalMilesTraveled();

    if (miles > 10000) {
      status = false;
    }
    return status;
  }
}
