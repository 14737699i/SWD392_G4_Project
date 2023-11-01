/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.User;

/**
 *
 * @author win
 */
public class UserDAO extends DBContext{
    public User login(String email, String password) {
        String sql = "select * from dbo.[User]\n"
                + "where email = ? and [password] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = User.builder()
                        .user_Id(rs.getInt(1))
                        .full_Name(rs.getString(2))
                        .password(rs.getString(3))
                        .avatar(rs.getString(4))
                        .gender(rs.getBoolean(5))
                        .email(rs.getString(6))
                        .mobile(rs.getString(7))
                        .address(rs.getString(8))
                        .status(rs.getBoolean(9))
                        .role_Id(rs.getString(10))
                        .build();
                return u;

            }
        } catch (Exception e) {
        }
        return null;
    }
}
