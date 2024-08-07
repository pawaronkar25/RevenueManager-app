package com.rr.beans;

import jakarta.servlet.jsp.JspWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RevTgtSaveBean {

    private JspWriter out;
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    private int distid, divid, mandalid, villageid, from, to, typeid;
    private double target;

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

    public void setFrom(int from) {
        this.from = from;
    }

    public void setTo(int to) {
        this.to = to;
    }

    public void setTypeid(int typeid) {
        this.typeid = typeid;
    }

    public void setTarget(double target) {
        this.target = target;
    }

    public void report() throws IOException {
        try {
            String sql1 = "select * from rev_tgt_view";
            con = DBCon.getConnection();
            con.setAutoCommit(false);
            ps = con.prepareStatement(sql1);
            rs = ps.executeQuery();
            while (rs.next()) {
                printTableRow(rs);
            }
            rs.close();
        } catch (Exception e1) {
            out.println("<tr><td  class=fail>" + "RevTgtSaveBean:" + e1 + "</td></tr>");
        } finally {
            closeResources();
        }
    }

    public void soloreport() throws IOException {
        try {
            String sql1 = "select * from rev_tgt_view where distid=? and divid=? and mandalid=? and villageid=?";
            con = DBCon.getConnection();
            con.setAutoCommit(false);
            ps = con.prepareStatement(sql1);
            ps.setInt(1, distid);
            ps.setInt(2, divid);
            ps.setInt(3, mandalid);
            ps.setInt(4, villageid);
            rs = ps.executeQuery();
            while (rs.next()) {
                printTableRow(rs);
            }
            rs.close();
        } catch (Exception e1) {
            out.println("<tr><td  class=fail>" + "RevTgtSaveBean:" + e1 + "</td></tr>");
        } finally {
            closeResources();
        }
    }

    public boolean insert() throws IOException {
        boolean stat = false;
        try {
            String sql1 = "insert into rev_target values(?,?,?,?,?,?,?,?)";
            con = DBCon.getConnection();
            con.setAutoCommit(false);
            ps = con.prepareStatement(sql1);
            ps.setInt(1, distid);
            ps.setInt(2, divid);
            ps.setInt(3, mandalid);
            ps.setInt(4, villageid);
            ps.setInt(5, from);
            ps.setInt(6, to);
            ps.setInt(7, typeid);
            ps.setDouble(8, target);
            if (ps.executeUpdate() == 1) stat = true;
        } catch (Exception e1) {
            stat = false;
            out.println("<tr><td  class=fail>" + "RevTgtSaveBean:" + e1 + "</td></tr>");
            try {
                con.rollback();
            } catch (Exception e2) {
                out.println("<tr><td  class=fail>" + "RevTgtSaveBean:" + e2 + "</td></tr>");
            }
        } finally {
            closeResources();
        }
        return stat;
    }

    private void printTableRow(ResultSet rs) throws IOException, SQLException {
        out.println("<tr>");
        out.println("<td>" + rs.getInt("yrfrom") + "-" + rs.getInt("yrto") + "</td>");
        out.println("<td>" + rs.getString("headtype") + "</td>");
        out.println("<td>" + rs.getDouble("target") + "</td>");
        out.println("</tr>");
    }

    private void closeResources() throws IOException {
        try {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (Exception e) {
            out.println("<tr><td  class=fail>" + "RevTgtSaveBean:" + e + "</td></tr>");
        }
    }
}
