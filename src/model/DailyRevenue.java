package model;

public class DailyRevenue {

    private String day;
    private int orderCount;
    private double dailyTotal;

    public DailyRevenue(String day, int orderCount, double dailyTotal) {
        this.day = day;
        this.orderCount = orderCount;
        this.dailyTotal = dailyTotal;
    }

    public String getDay() { return day; }
    public int getOrderCount() { return orderCount; }
    public double getDailyTotal() { return dailyTotal; }

    public void setDay(String day) { this.day = day; }
    public void setOrderCount(int orderCount) { this.orderCount = orderCount; }
    public void setDailyTotal(double dailyTotal) { this.dailyTotal = dailyTotal; }
}