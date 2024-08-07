package com.rr.beans;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.jsp.JspWriter;

public class DistSaveBean {

    JspWriter out;
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    String distname;

    public void setOut(JspWriter out) {
        this.out = out;
    }

    public void setDistname(String distname) {
        this.distname = distname;
    }

    int getNextId() throws SQLException {
        int maxid = 1;
        try (PreparedStatement ps = con.prepareStatement("select max(distid) from dist_master");
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                maxid = rs.getInt(1);
            }
        }
        return maxid + 1;
    }

    public boolean insert() throws IOException, ClassNotFoundException, SQLException {
        boolean stat = false;
        int distid = 0;
        try {
            String sql1 = "insert into dist_master values(?, ?) ";
            con = DBCon.getConnection();
            con.setAutoCommit(false);
            distid = getNextId();
            try (PreparedStatement ps = con.prepareStatement(sql1)) {
                ps.setInt(1, distid);
                ps.setString(2, distname);
                ps.executeUpdate();
                stat = true;
            } catch (Exception e1) {
                stat = false;
                out.println("<tr><td  class=fail>" + "DistSaveBean:" + e1 + "</td></tr>");
                try {
                    con.rollback();
                } catch (Exception e2) {
                    out.println("<tr><td  class=fail>" + "DistSaveBean:" + e2 + "</td></tr>");
                }
            }
        } finally {
            try {
                if (con != null) {
                    con.commit();
                    con.close();
                }
            } catch (Exception e3) {
                out.println("<tr><td  class=fail>" + "DistSaveBean:" + e3 + "</td></tr>");
            }
        }
        return stat;
    }
}
