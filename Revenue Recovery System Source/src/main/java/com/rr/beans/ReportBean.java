package com.rr.beans;

import jakarta.servlet.jsp.JspWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ReportBean {

    private JspWriter out;
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    private int distid, divid, mandalid, villageid, typeid;
    private String dist, div, mandal, village, headtype;
    private int year;
    private final String[] months = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};
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

    private void display() throws Exception {
        while (rs.next()) {
            dist = rs.getString("distname");
            div = rs.getString("divname");
            mandal = rs.getString("mandalname");
            village = rs.getString("villagename");
            headtype = rs.getString("headtype");
            int month = rs.getInt("mon");
            year = rs.getInt("yr");
            colvalue = rs.getDouble("col_value");
            out.println("<tr><td>" + dist + "</td>");
            out.println("<td>" + div + "</td>");
            out.println("<td>" + mandal + "</td>");
            out.println("<td>" + village + "</td>");
            out.println("<td>" + headtype + "</td>");
            out.println("<td>" + months[month - 1] + "</td>");
            out.println("<td>" + year + "</td>");
            out.println("<td>" + colvalue + "</td></tr>");
        }
    }

    public void viewAll() throws IOException {
        try {
            con = DBCon.getConnection();
            ps = con.prepareStatement("SELECT *FROM MONTHLY_REP_VIEW");
            rs = ps.executeQuery();
            while (rs.next()) {
                dist = rs.getString(1);
                div = rs.getString(2);
                mandal = rs.getString(3);
                village = rs.getString(4);
                headtype = rs.getString(5);
                int month = rs.getInt(6);
                year = rs.getInt(7);
                colvalue = rs.getDouble(8);
                out.println("<tr><td>" + dist + "</td>");
                out.println("<td>" + div + "</td>");
                out.println("<td>" + mandal + "</td>");
                out.println("<td>" + village + "</td>");
                out.println("<td>" + headtype + "</td>");
                out.println("<td>" + months[month - 1] + "</td>");
                out.println("<td>" + year + "</td>");
                out.println("<td>" + colvalue + "</td></tr>");
            }
        } catch (Exception e) {
            out.println(e);
        } finally {
            closeResources();
        }
    }

    // Additional view methods...

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
            out.println(e);
        }
    }
}
