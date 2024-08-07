package com.rr.beans;

import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.JspWriter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ViewEmpBean {

    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    private JspWriter out;

    private String dist, div, mandal, village, headname, headtype;
    private int headid;

    public void setOut(JspWriter out) {
        this.out = out;
    }

    public void viewAll() throws JspException, IOException {
        try {
            con = DBCon.getConnection();
            ps = con.prepareStatement("select * from vlg_head_view");
            rs = ps.executeQuery();
            while (rs.next()) {
                retrieveData();
                displayEmployeeDetails();
            }
        } catch (Exception e) {
            out.println(e);
        } finally {
            closeResources();
        }
    }

    private void retrieveData() throws Exception {
        dist = rs.getString(1);
        div = rs.getString(2);
        mandal = rs.getString(3);
        village = rs.getString(4);
        headtype = rs.getString(5);
        headid = rs.getInt(6);
        headname = rs.getString(7);
    }

    private void displayEmployeeDetails() throws IOException {
        out.println("<tr><td>" + dist + "</td>");
        out.println("<td>" + div + "</td>");
        out.println("<td>" + mandal + "</td>");
        out.println("<td>" + village + "</td>");
        out.println("<td>" + headtype + "</td>");
        out.println("<td>" + headid + "</td>");
        out.println("<td>" + headname + "</td></tr>");
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
            out.println("<tr><td  class=fail>" + "ViewEmpBean:" + e + "</td></tr>");
        }
    }
}
