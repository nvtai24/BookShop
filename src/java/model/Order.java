/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;
import java.util.List;

/**
 *
 * @author trung
 */
public class Order {

    private int orderId;
    private User userId;
    private Date orderDate;
    private double totalAmount;
    private String status;
    private List<OrderDetail> OrderDetail;

    public Order() {
    }

    public Order(int orderId, User userId, Date orderDate, double totalAmount, String status, List<OrderDetail> OrderDetail) {
        this.orderId = orderId;
        this.userId = userId;
        this.orderDate = orderDate;
        this.totalAmount = totalAmount;
        this.status = status;
        this.OrderDetail = OrderDetail;
    }

    public List<OrderDetail> getOrderDetail() {
        return OrderDetail;
    }

    public void setOrderDetail(List<OrderDetail> OrderDetail) {
        this.OrderDetail = OrderDetail;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public User getUserId() {
        return userId;
    }

    public void setUserId(User userId) {
        this.userId = userId;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Order{" + "orderId=" + orderId + ", userId=" + userId + ", orderDate=" + orderDate + ", totalAmount=" + totalAmount + ", status=" + status + '}';
    }

}
