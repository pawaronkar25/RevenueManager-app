package com.rr.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginBean {
    private int distid, divid, villageid, mandalid;
    private String user, pass, role;

    public void setDistid(int distid) {
        this.distid = distid;
    }

    public int getDistid() {
        return distid;
    }

    public void setDivid(int divid) {
        this.divid = divid;
    }

    public int getDivid() {
        return divid;
    }

    public void setMandalid(int mandalid) {
        this.mandalid = mandalid;
    }

    public int getMandalid() {
        return mandalid;
    }

    public void setVillageid(int villageid) {
        this.villageid = villageid;
    }

    public int getVillageid() {
        return villageid;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getRole() {
        return role;
    }

    public boolean register() throws ClassNotFoundException {
        try (Connection con = DBCon.getConnection();
             PreparedStatement ps = con.prepareStatement("insert into users values(?,?,?,?,?,?,'C')")) {
            ps.setInt(1, distid);
            ps.setInt(2, divid);
            ps.setInt(3, mandalid);
            ps.setInt(4, villageid);
            ps.setString(5, user.trim().toUpperCase());
            ps.setString(6, pass.trim().toUpperCase());
            return ps.executeUpdate() == 1;
        } catch (SQLException e) {
            e.printStackTrace(); // Log or handle the exception properly
            return false;
        }
    }

    public boolean validate() throws ClassNotFoundException {
        try (Connection con = DBCon.getConnection();
             PreparedStatement ps = con.prepareStatement("select * from users where upper(trim(username))=? and upper(trim(pass))=?")) {
            ps.setString(1, user.trim().toUpperCase());
            ps.setString(2, pass.trim().toUpperCase());
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    role = rs.getString("role");
                    distid = rs.getInt("distid");
                    divid = rs.getInt("divid");
                    mandalid = rs.getInt("mandalid");
                    villageid = rs.getInt("villageid");
                    return true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log or handle the exception properly
        }
        return false;
    }
}
