/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Order;

/**
 *
 * @author win
 */
public class OrderDAO extends DBContext {
    public List<Order> getAllOrder(int userId) {
        List<Order> list = new ArrayList<>();
        String sql = "select * from [Order] join Status_Order\n"
                + "on [Order].status_order= Status_Order.status_order_id\n"
                + "where userId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order c = Order.builder()
                        .orderID(rs.getInt(1))
                        .date(rs.getDate(2))
                        .total_cost(rs.getInt(3))
                        .countProduct(getCountProduct(rs.getInt(1)))
                        .fullNameFirstProduct(getFullNameFirstProduct(rs.getInt(1)))
                        .fullName(rs.getString(4))
                        .mobile(rs.getString(5))
                        .address(rs.getString(6))
                        .status_order(rs.getInt(7))
                        .status_order_name(rs.getString(12))
                        .build();

                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }
    
    private int getCountProduct(int id) {
        String sql = "select count(*) from Order_Detail join Product \n"
                + "on Order_Detail.product_id = Product.product_id\n"
                + "where order_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1) - 1;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    private String getFullNameFirstProduct(int id) {
        String sql = "select top 1 Product.product_name from Order_Detail join Product \n"
                + "                on Order_Detail.product_id = Product.product_id\n"
                + "                where order_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
}
