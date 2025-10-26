public class AirtableApiWrapper {
  public List<recordsClass> records;

  public class recordsClass {
    public String id, createdTime;
    public Map<String, Object> fields;
    public String getWarehouseLocation() {
      return (String) fields.get('Warehouse Location');
    }
  }
  public class fieldsClass {
    public String SKU;
    @JsonProperty('Warehouse Location')
    public String warehouse_Location;
    @JsonProperty('Last Updated')
    public String Last_Updated;
    @JsonProperty('Stock Status')
    public String Stock_Status;
    @JsonProperty('Stock Quantity')
    public Integer Stock_Quantity;
    @JsonProperty('Stock Value')
    public Integer Stock_Value;
  }
}
