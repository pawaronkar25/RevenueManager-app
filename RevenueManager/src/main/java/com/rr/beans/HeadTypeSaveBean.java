package com.rr.beans;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.jsp.JspWriter;

public class HeadTypeSaveBean {

    JspWriter out;
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    String headtype;

    public void setOut(JspWriter out) {
        this.out = out;
    }

    public void setHeadtype(String headtype) {
        this.headtype = headtype;
    }

    int getNextId() throws SQLException {
        int maxid = 1;
        try (PreparedStatement ps = con.prepareStatement("select max(typeid) from revhead_type");
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                maxid = rs.getInt(1);
            }
        }
        return maxid + 1;
    }

    public boolean insert() throws IOException, ClassNotFoundException, SQLException {
        boolean stat = false;
        try {
            String sql1 = "insert into revhead_type values(?,?) ";
            con = DBCon.getConnection();
            con.setAutoCommit(false);
            int typeid = getNextId();
            try (PreparedStatement ps = con.prepareStatement(sql1)) {
                ps.setInt(1, typeid);
                ps.setString(2, headtype);
                ps.executeUpdate();
                stat = true;
            } catch (Exception e1) {
                stat = false;
                out.println("<tr><td  class=fail>" + "HeadTypeSaveBean:" + e1 + "</td></tr>");
                try {
                    con.rollback();
                } catch (Exception e2) {
                    out.println("<tr><td  class=fail>" + "HeadTypeSaveBean:" + e2 + "</td></tr>");
                }
            }
        } finally {
            try {
                if (con != null) {
                    con.commit();
                    con.close();
                }
            } catch (Exception e3) {
                out.println("<tr><td  class=fail>" + "HeadTypeSaveBean:" + e3 + "</td></tr>");
            }
        }
        return stat;
    }
}
