package com.rr.beans;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.jsp.JspWriter;

public class HouseSaveBean {

    JspWriter out;
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    String houseno, type;
    boolean water;
    int distid, divid, villageid, mandalid;

    public void setOut(JspWriter out) {
        this.out = out;
    }

    public void setDistid(int distid) {
        this.distid = distid;
    }

    public void setDivid(int divid) {
        this.divid = divid;
    }

    public void setMandalid(int mandalid) {
        this.mandalid = mandalid;
    }

    public void setVillageid(int villageid) {
        this.villageid = villageid;
    }

    public void setHouseno(String houseno) {
        this.houseno = houseno;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setWater(boolean water) {
        this.water = water;
    }

    public boolean insert() throws IOException, ClassNotFoundException, SQLException {
        boolean stat = false;
        try {
            String sql1 = "insert into house_master values(?,?,?,?,?,?,?) ";
            con = DBCon.getConnection();
            con.setAutoCommit(false);
            try (PreparedStatement ps = con.prepareStatement(sql1)) {
                ps.setInt(1, distid);
                ps.setInt(2, divid);
                ps.setInt(3, mandalid);
                ps.setInt(4, villageid);
                ps.setString(5, houseno);
                ps.setString(6, type);
                ps.setBoolean(7, water);
                ps.executeUpdate();
                stat = true;
            } catch (Exception e1) {
                stat = false;
                out.println("<tr><td  class=fail>" + "HouseSaveBean:" + e1 + "</td></tr>");
                try {
                    con.rollback();
                } catch (Exception e2) {
                    out.println("<tr><td  class=fail>" + "HouseSaveBean:" + e2 + "</td></tr>");
                }
            }
        } finally {
            try {
                if (con != null) {
                    con.commit();
                    con.close();
                }
            } catch (Exception e3) {
                out.println("<tr><td  class=fail>" + "HouseSaveBean:" + e3 + "</td></tr>");
            }
        }
        return stat;
    }
}
