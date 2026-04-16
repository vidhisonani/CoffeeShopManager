package model;

public class MenuItem {
  private int itemId;
  private String itemName;
  private String category;
  private double price;
  private String description;
  private boolean isAvailable;

  public MenuItem() {
  }
  public MenuItem(int itemId, String itemName, String category, double price, String description, boolean isAvailable) {
    this.itemId = itemId;
    this.itemName = itemName;
    this.category = category;
    this.price = price;
    this.description = description;
    this.isAvailable = isAvailable;
  }

  public int getItemId() {
    return itemId;
  }

  public String getItemName() {
    return itemName;
  }

  public String getCategory() {
    return category;
  }

  public double getPrice() {
    return price;
  }

  public String getDescription() {
    return description;
  }

  public boolean isAvailable() {
    return isAvailable;
  }

  public void setItemId(int itemId) {
    this.itemId = itemId;
  }

  public void setItemName(String itemName) {
    this.itemName = itemName;
  }

  public void setCategory(String category) {
    this.category = category;
  }

  public void setPrice(double price) {
    this.price = price;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public void setAvailable(boolean isAvailable) {
    this.isAvailable = isAvailable;
  }
}