package dao;

import model.Order;
import model.OrderItem;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.BestSellerItem;
import model.DailyRevenue;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class OrderDAO {

  // Places full order — inserts into customer_order then each order_item
  public int placeOrder(Order order, List<OrderItem> items) {
    String orderSql = "INSERT INTO customer_order (customer_name, table_number, total_amount) VALUES (?, ?, ?)";
    String itemSql = "INSERT INTO order_item (order_id, item_id, quantity, subtotal) VALUES (?, ?, ?, ?)";

    try (Connection con = DBConnection.getConnection()) {
      con.setAutoCommit(false); // treat as one transaction

      int orderId = -1;
      try (PreparedStatement ps = con.prepareStatement(orderSql, Statement.RETURN_GENERATED_KEYS)) {
        ps.setString(1, order.getCustomerName());
        ps.setInt(2, order.getTableNumber());
        ps.setDouble(3, order.getTotalAmount());
        ps.executeUpdate();

        ResultSet rs = ps.getGeneratedKeys();
        if (rs.next())
          orderId = rs.getInt(1);
      }

      if (orderId != -1) {
        try (PreparedStatement ps = con.prepareStatement(itemSql)) {
          for (OrderItem item : items) {
            ps.setInt(1, orderId);
            ps.setInt(2, item.getItemId());
            ps.setInt(3, item.getQuantity());
            ps.setDouble(4, item.getSubtotal());
            ps.addBatch();
          }
          ps.executeBatch();
        }
      }

      con.commit();
      return orderId;

    } catch (SQLException e) {
      e.printStackTrace();
      return -1;
    }
  }

  public List<Order> getAllOrders() {
    List<Order> list = new ArrayList<>();
    String sql = "SELECT * FROM customer_order ORDER BY ordered_at DESC";
    try (Connection con = DBConnection.getConnection();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(sql)) {
      while (rs.next()) {
        list.add(new Order(
            rs.getInt("order_id"),
            rs.getString("customer_name"),
            rs.getInt("table_number"),
            rs.getDouble("total_amount"),
            rs.getString("status"),
            rs.getString("ordered_at")));
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return list;
  }

  public boolean updateStatus(int orderId, String status) {
    String sql = "UPDATE customer_order SET status = ? WHERE order_id = ?";
    try (Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement(sql)) {
      ps.setString(1, status);
      ps.setInt(2, orderId);
      return ps.executeUpdate() > 0;
    } catch (SQLException e) {
      e.printStackTrace();
      return false;
    }
  }
  public List<BestSellerItem> getBestSellers() {
	    List<BestSellerItem> list = new ArrayList<>();
	    String sql = "SELECT m.item_name, SUM(oi.quantity) AS totalSold, " +
	                 "SUM(oi.subtotal) AS revenue " +
	                 "FROM order_item oi " +
	                 "JOIN menu_item m ON oi.item_id = m.item_id " +
	                 "GROUP BY m.item_id, m.item_name " +
	                 "ORDER BY totalSold DESC";
	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql);
	         ResultSet rs = ps.executeQuery()) {

	        while (rs.next()) {
	            String itemName  = rs.getString("item_name");
	            int totalSold    = rs.getInt("totalSold");
	            double revenue   = rs.getDouble("revenue");
	            list.add(new BestSellerItem(itemName, totalSold, revenue));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}

	public List<DailyRevenue> getDailyRevenue() {
	    List<DailyRevenue> list = new ArrayList<>();
	    String sql = "SELECT DATE(ordered_at) AS day, COUNT(*) AS orderCount, " +
	                 "SUM(total_amount) AS dailyTotal " +
	                 "FROM customer_order " +
	                 "GROUP BY DATE(ordered_at) " +
	                 "ORDER BY day DESC";
	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql);
	         ResultSet rs = ps.executeQuery()) {

	        while (rs.next()) {
	            String day      = rs.getString("day");
	            int orderCount  = rs.getInt("orderCount");
	            double daily    = rs.getDouble("dailyTotal");
	            list.add(new DailyRevenue(day, orderCount, daily));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}
}