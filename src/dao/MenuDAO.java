package dao;

import model.MenuItem;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MenuDAO {

  public List<MenuItem> getAllItems() {
    List<MenuItem> list = new ArrayList<>();
    String sql = "SELECT * FROM menu_item WHERE is_available = 1 ORDER BY category";
    try (Connection con = DBConnection.getConnection();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(sql)) {
      while (rs.next()) {
        list.add(new MenuItem(
            rs.getInt("item_id"),
            rs.getString("item_name"),
            rs.getString("category"),
            rs.getDouble("price"),
            rs.getString("description"),
            rs.getBoolean("is_available")));
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return list;
  }

  public boolean addItem(MenuItem item) {
    String sql = "INSERT INTO menu_item (item_name, category, price, description) VALUES (?, ?, ?, ?)";
    try (Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement(sql)) {
      ps.setString(1, item.getItemName());
      ps.setString(2, item.getCategory());
      ps.setDouble(3, item.getPrice());
      ps.setString(4, item.getDescription());
      return ps.executeUpdate() > 0;
    } catch (SQLException e) {
      e.printStackTrace();
      return false;
    }
  }

  public boolean deleteItem(int itemId) {
    String sql = "UPDATE menu_item SET is_available = 0 WHERE item_id = ?";
    try (Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement(sql)) {
      ps.setInt(1, itemId);
      return ps.executeUpdate() > 0;
    } catch (SQLException e) {
      e.printStackTrace();
      return false;
    }
  }

  public List<MenuItem> getAllItemsForAdmin() {
    List<MenuItem> list = new ArrayList<>();
    String sql = "SELECT * FROM menu_item ORDER BY category";
    try (Connection con = DBConnection.getConnection();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(sql)) {
      while (rs.next()) {
        list.add(new MenuItem(
            rs.getInt("item_id"),
            rs.getString("item_name"),
            rs.getString("category"),
            rs.getDouble("price"),
            rs.getString("description"),
            rs.getBoolean("is_available")));
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return list;
  }
}