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
import model.Product;

/**
 *
 * @author win
 */
public class ProductDAO extends DBContext {

    public List<Product> get4ProductRandom() {
        List<Product> list = new ArrayList<>();
        String sql = "select top 4 * from Product ORDER BY NEWID()";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = Product.builder()
                        .id(rs.getInt(1))
                        .name(rs.getString(2))
                        .original_price(rs.getInt(3))
                        .sale_price(rs.getInt(4))
                        .desciption(rs.getString(5))
                        .brief_infor(rs.getString(6))
                        .status(rs.getBoolean(7))
                        .quantity(rs.getInt(8))
                        .category_id(rs.getInt(9))
                        .update_date(rs.getDate(10))
                        .image(getImgProduct(rs.getInt(1)))
                        .rated_star(getRatedProduct(rs.getInt(1)))
                        .build();

                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public String getImgProduct(int id) {
        String sql = "select images from Products_Images where product_id = ?";
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

    public double getRatedProduct(int id) {
        String sql = "select AVG(rated_star) from Feedback where product_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public List<Product> getProductsByKeyWord(String key) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT [product_id]\n"
                + "      ,[product_name]\n"
                + "      ,[original_prices]\n"
                + "      ,[sale_prices]\n"
                + "      ,[product_details]\n"
                + "      ,[brief_infor]\n"
                + "      ,[status]\n"
                + "      ,[quantity]\n"
                + "      ,[category_id]\n"
                + "      ,[update_date]\n"
                + "      ,[gender]\n"
                + "  FROM [dbo].[Product] WHERE [product_name] LIKE ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + key + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = Product.builder()
                        .id(rs.getInt(1))
                        .name(rs.getString(2))
                        .original_price(rs.getInt(3))
                        .sale_price(rs.getInt(4))
                        .desciption(rs.getString(5))
                        .brief_infor(rs.getString(6))
                        .status(rs.getBoolean(7))
                        .quantity(rs.getInt(8))
                        .category_id(rs.getInt(9))
                        .update_date(rs.getDate(10))
                        .image(getImgProduct(rs.getInt(1)))
                        .rated_star(getRatedProduct(rs.getInt(1)))
                        .build();
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
