package com.rr.beans;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.jsp.JspWriter;

public class DivSaveBean {

    JspWriter out;
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    String divname;
    int distid, divid;

    public void setOut(JspWriter out) {
        this.out = out;
    }

    public void setDistid(int distid) {
        this.distid = distid;
    }

    public void setDivname(String divname) {
        this.divname = divname;
    }

    int getNextId() throws SQLException {
        int maxid = 0;
        try (PreparedStatement ps = con.prepareStatement("select max(divid) from div_master");
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                maxid = rs.getInt(1);
            }
        }
        return maxid + 1;
    }

    public boolean insert() throws IOException, ClassNotFoundException, SQLException {
        boolean stat = false;
        int divid = 0;
        try {
            String sql1 = "insert into div_master values(?,?,?) ";
            con = DBCon.getConnection();
            con.setAutoCommit(false);
            divid = getNextId();
            try (PreparedStatement ps = con.prepareStatement(sql1)) {
                ps.setInt(1, distid);
                ps.setInt(2, divid);
                ps.setString(3, divname);
                ps.executeUpdate();
                stat = true;
            } catch (Exception e1) {
                stat = false;
                out.println("<tr><td  class=fail>" + "DivSaveBean:" + e1 + "</td></tr>");
                try {
                    con.rollback();
                } catch (Exception e2) {
                    out.println("<tr><td  class=fail>" + "DivSaveBean:" + e2 + "</td></tr>");
                }
            }
        } finally {
            try {
                if (con != null) {
                    con.commit();
                    con.close();
                }
            } catch (Exception e3) {
                out.println("<tr><td  class=fail>" + "DivSaveBean:" + e3 + "</td></tr>");
            }
        }
        return stat;
    }
}
