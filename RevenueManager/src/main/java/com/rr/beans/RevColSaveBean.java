package com.rr.beans;

import jakarta.servlet.jsp.JspWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class RevColSaveBean {

    private JspWriter out;
    private Connection con;
    private PreparedStatement ps;
    private int distid, divid, mandalid, villageid, typeid, mon, year;
    private double colvalue;

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

    public void setTypeid(int typeid) {
        this.typeid = typeid;
    }

    public void setMon(int mon) {
        this.mon = mon;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public void setColvalue(double colvalue) {
        this.colvalue = colvalue;
    }

    public boolean insert() throws IOException {
        boolean stat = false;
        try {
            String sql1 = "insert into rev_collection values(?,?,?,?,?,?,?,?) ";
            con = DBCon.getConnection();
            con.setAutoCommit(false);
            ps = con.prepareStatement(sql1);
            ps.setInt(1, distid);
            ps.setInt(2, divid);
            ps.setInt(3, mandalid);
            ps.setInt(4, villageid);
            ps.setInt(5, typeid);
            ps.setInt(6, mon);
            ps.setInt(7, year);
            ps.setDouble(8, colvalue);
            ps.executeUpdate();
            stat = true;
        } catch (Exception e1) {
            stat = false;
            out.println("<tr><td  class=fail>" + "RevColSaveBean:" + e1 + "</td></tr>");
            try {
                con.rollback();
            } catch (Exception e2) {
                out.println("<tr><td  class=fail>" + "RevColSaveBean:" + e2 + "</td></tr>");
            }
        } finally {
            try {
                con.commit();
                con.close();
            } catch (Exception e3) {
                out.println("<tr><td  class=fail>" + "RevColSaveBean:" + e3 + "</td></tr>");
            }
        }
        return stat;
    }
}