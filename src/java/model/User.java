/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author win
 */
@Builder
@Getter
@Setter
@ToString
public class User {
    private int user_Id;
    private String role_Id;
    private String full_Name;
    private String password;
    private String avatar;
    private boolean gender;
    private String email;
    private String mobile;
    private String address;
    private boolean status;
}
