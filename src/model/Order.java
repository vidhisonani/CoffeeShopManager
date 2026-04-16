package model;

public class Order {
  private int orderId;
  private String customerName;
  private int tableNumber;
  private double totalAmount;
  private String status;
  private String orderedAt;

  public Order() {
  }

  public Order(int orderId, String customerName, int tableNumber, double totalAmount, String status, String orderedAt) {
    this.orderId = orderId;
    this.customerName = customerName;
    this.tableNumber = tableNumber;
    this.totalAmount = totalAmount;
    this.status = status;
    this.orderedAt = orderedAt;
  }

  public int getOrderId() {
    return orderId;
  }

  public String getCustomerName() {
    return customerName;
  }

  public int getTableNumber() {
    return tableNumber;
  }

  public double getTotalAmount() {
    return totalAmount;
  }

  public String getStatus() {
    return status;
  }

  public String getOrderedAt() {
    return orderedAt;
  }

  public void setOrderId(int orderId) {
    this.orderId = orderId;
  }

  public void setCustomerName(String customerName) {
    this.customerName = customerName;
  }

  public void setTableNumber(int tableNumber) {
    this.tableNumber = tableNumber;
  }

  public void setTotalAmount(double totalAmount) {
    this.totalAmount = totalAmount;
  }

  public void setStatus(String status) {
    this.status = status;
  }

  public void setOrderedAt(String orderedAt) {
    this.orderedAt = orderedAt;
  }
}