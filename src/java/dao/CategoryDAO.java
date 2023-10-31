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
import model.Category;

/**
 *
 * @author win
 */
public class CategoryDAO extends DBContext {
    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String sql = "Select * from Category where status = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = Category.builder()
                        .id(rs.getInt(1))
                        .name(rs.getString(2))
                        .gender(rs.getString(4))
                        .build();

                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }


    public List<Category> getAllCategoryMale() {
        List<Category> list = new ArrayList<>();
        String sql = "Select * from Category where status = 1 and gender = N'Nam'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = Category.builder()
                        .id(rs.getInt(1))
                        .name(rs.getString(2))
                        .gender(rs.getString(4))
                        .build();

                list.add(c);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public List<Category> getAllCategoryFemale() {
        List<Category> list = new ArrayList<>();
        String sql = "Select * from Category where status = 1 and gender = N'Nữ'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = Category.builder()
                        .id(rs.getInt(1))
                        .name(rs.getString(2))
                        .gender(rs.getString(4))
                        .build();

                list.add(c);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }
}
