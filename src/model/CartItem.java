package model;

public class CartItem {

    // Fields
    private int itemId;
    private String name;
    private double price;
    private int quantity;

    // Constructor — used when adding item to cart
    public CartItem(int itemId, String name, double price, int quantity) {
        this.itemId   = itemId;
        this.name     = name;
        this.price    = price;
        this.quantity = quantity;
    }

    // ✅ Your special method — price × quantity
    public double getSubtotal() {
        return price * quantity;
    }

    // Getters
    public int    getItemId()   { return itemId;   }
    public String getName()     { return name;     }
    public double getPrice()    { return price;    }
    public int    getQuantity() { return quantity; }

    // Setters
    public void setItemId(int itemId)      { this.itemId   = itemId;   }
    public void setName(String name)       { this.name     = name;     }
    public void setPrice(double price)     { this.price    = price;    }
    public void setQuantity(int quantity)  { this.quantity = quantity; }
}