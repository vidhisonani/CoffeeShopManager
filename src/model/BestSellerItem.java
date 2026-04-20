package model;

public class BestSellerItem {

    private String itemName;
    private int totalSold;
    private double revenue;

    public BestSellerItem(String itemName, int totalSold, double revenue) {
        this.itemName = itemName;
        this.totalSold = totalSold;
        this.revenue = revenue;
    }

    public String getItemName() { return itemName; }
    public int getTotalSold() { return totalSold; }
    public double getRevenue() { return revenue; }

    public void setItemName(String itemName) { this.itemName = itemName; }
    public void setTotalSold(int totalSold) { this.totalSold = totalSold; }
    public void setRevenue(double revenue) { this.revenue = revenue; }
}