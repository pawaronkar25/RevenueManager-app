package com.rr.beans;

import jakarta.servlet.jsp.JspWriter;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MandalSaveBean {

    private JspWriter out;
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    private String mandalname;
    private int distid, divid, mandalid;

    public void setOut(JspWriter out) {
        this.out = out;
    }

    public void setDistid(int distid) {
        this.distid = distid;
    }

    public void setDivid(int divid) {
        this.divid = divid;
    }

    public void setMandalname(String mandalname) {
        this.mandalname = mandalname;
    }

    int getNextId() throws Exception {
        int maxid = 0;
        ps = con.prepareStatement("select max(mandalid) from mandal_master");
        rs = ps.executeQuery();
        if (rs.next())
            maxid = rs.getInt(1);
        rs.close();
        return maxid + 1;
    }

    public boolean insert() throws Exception {
        boolean stat = false;
        int mandalid = 0;
        try {
            String sql1 = "insert into mandal_master values(?,?,?,?) ";
            con = DBCon.getConnection();
            con.setAutoCommit(false);
            mandalid = getNextId();
            try (PreparedStatement ps = con.prepareStatement(sql1)) {
                ps.setInt(1, distid);
                ps.setInt(2, divid);
                ps.setInt(3, mandalid);
                ps.setString(4, mandalname);
                ps.executeUpdate();
                stat = true;
            } catch (Exception e1) {
                stat = false;
                out.println("<tr><td  class=fail>" + "MandalSaveBean:" + e1 + "</td></tr>");
                try {
                    con.rollback();
                } catch (Exception e2) {
                    out.println("<tr><td  class=fail>" + "MandalSaveBean:" + e2 + "</td></tr>");
                }
            }
        } finally {
            try {
                if (con != null) {
                    con.commit();
                    con.close();
                }
            } catch (Exception e3) {
                out.println("<tr><td  class=fail>" + "MandalSaveBean:" + e3 + "</td></tr>");
            }
        }
        return stat;
    }
}
