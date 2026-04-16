package model;

public class OrderItem {
  private int id;
  private int orderId;
  private int itemId;
  private int quantity;
  private double subtotal;

  public OrderItem() {
  }

  public OrderItem(int orderId, int itemId, int quantity, double subtotal) {
    this.orderId = orderId;
    this.itemId = itemId;
    this.quantity = quantity;
    this.subtotal = subtotal;
  }

  public int getId() {
    return id;
  }

  public int getOrderId() {
    return orderId;
  }

  public int getItemId() {
    return itemId;
  }

  public int getQuantity() {
    return quantity;
  }

  public double getSubtotal() {
    return subtotal;
  }

  public void setId(int id) {
    this.id = id;
  }

  public void setOrderId(int orderId) {
    this.orderId = orderId;
  }

  public void setItemId(int itemId) {
    this.itemId = itemId;
  }

  public void setQuantity(int quantity) {
    this.quantity = quantity;
  }

  public void setSubtotal(double subtotal) {
    this.subtotal = subtotal;
  }
}