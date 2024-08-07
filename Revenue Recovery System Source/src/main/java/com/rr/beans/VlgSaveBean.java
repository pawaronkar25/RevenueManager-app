package com.rr.beans;

import jakarta.servlet.jsp.JspWriter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class VlgSaveBean {

    private JspWriter out;
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    private String villagename;
    private int distid, divid, villageid, mandalid;

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

    public void setVillagename(String villagename) {
        this.villagename = villagename;
    }

    private int getNextId() throws Exception {
        int maxid = 0;
        ps = con.prepareStatement("SELECT MAX(villageid) FROM village_master");
        rs = ps.executeQuery();
        if (rs.next())
            maxid = rs.getInt(1);
        rs.close();
        return maxid + 1;
    }

    public boolean insert() throws IOException {
        boolean stat = false;
        try {
            String sql1 = "INSERT INTO village_master VALUES(?,?,?,?,?) ";
            con = DBCon.getConnection();
            con.setAutoCommit(false);
            villageid = getNextId();
            ps = con.prepareStatement(sql1);
            ps.setInt(1, distid);
            ps.setInt(2, divid);
            ps.setInt(3, mandalid);
            ps.setInt(4, villageid);
            ps.setString(5, villagename);
            ps.executeUpdate();
            stat = true;
        } catch (Exception e1) {
            stat = false;
            out.println("<tr><td  class=fail>" + "VlgSaveBean:" + e1 + "</td></tr>");
            try {
                con.rollback();
            } catch (Exception e2) {
                out.println("<tr><td  class=fail>" + "VlgSaveBean:" + e2 + "</td></tr>");
            }
        } finally {
            try {
                con.commit();
                con.close();
            } catch (Exception e3) {
                out.println("<tr><td  class=fail>" + "VlgSaveBean:" + e3 + "</td></tr>");
            }
        }
        return stat;
    }
}
