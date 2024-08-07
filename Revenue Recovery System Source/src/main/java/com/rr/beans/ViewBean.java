package com.rr.beans;

import jakarta.servlet.http.HttpSession;
import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.JspWriter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ViewBean {

    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    private JspWriter out;
    private HttpSession hs;

    private String dist, div, mandal, village, doorno, srctype;
    private String distid, divid, villageid, mandalid;
    private boolean watercon;

    public void setOut(JspWriter out) {
        this.out = out;
    }

    public void setSession(HttpSession hs) {
        this.hs = hs;
    }

    public void viewHouses() throws JspException, IOException {
        try {
            retrieveAttributes();
            con = DBCon.getConnection();
            ps = con.prepareStatement("select * from house_list where distid=? and divid=? and mandalid=? and villageid=?");
            setParameters();
            rs = ps.executeQuery();
            while (rs.next()) {
                displayHouseDetails();
            }
        } catch (Exception e) {
            out.println(e);
        } finally {
            closeResources();
        }
    }

    public void viewLands(boolean val) throws JspException, IOException {
        try {
            retrieveAttributes();
            con = DBCon.getConnection();
            if (val) {
                ps = con.prepareStatement("select * from resland_list where distid=? and divid=? and mandalid=? and villageid=?");
            } else {
                ps = con.prepareStatement("select * from agland_list where distid=? and divid=? and mandalid=? and villageid=?");
            }
            setParameters();
            rs = ps.executeQuery();
            while (rs.next()) {
                displayLandDetails();
            }
        } catch (Exception e) {
            out.println(e);
        } finally {
            closeResources();
        }
    }

    private void retrieveAttributes() {
        distid = (String) hs.getAttribute("distid");
        divid = (String) hs.getAttribute("divid");
        mandalid = (String) hs.getAttribute("mandalid");
        villageid = (String) hs.getAttribute("villageid");
    }

    private void setParameters() throws Exception {
        ps.setString(1, distid);
        ps.setString(2, divid);
        ps.setString(3, mandalid);
        ps.setString(4, villageid);
    }

    private void displayHouseDetails() throws IOException, SQLException {
        dist = rs.getString("distname");
        div = rs.getString("divname");
        mandal = rs.getString("mandalname");
        village = rs.getString("villagename");
        doorno = rs.getString("houseno");
        srctype = rs.getString("srctype");
        watercon = rs.getBoolean("water_con");
        out.println("<tr><td>" + dist + "</td>");
        out.println("<td>" + div + "</td>");
        out.println("<td>" + mandal + "</td>");
        out.println("<td>" + village + "</td>");
        out.println("<td>" + doorno + "</td>");
        out.println("<td>" + srctype + "</td>");
        out.println("<td>" + (watercon ? "Yes" : "No") + "</td></tr>");
    }

    private void displayLandDetails() throws IOException, SQLException {
        dist = rs.getString("distname");
        div = rs.getString("divname");
        mandal = rs.getString("mandalname");
        village = rs.getString("villagename");
        doorno = rs.getString("surveyno");
        out.println("<tr><td>" + dist + "</td>");
        out.println("<td>" + div + "</td>");
        out.println("<td>" + mandal + "</td>");
        out.println("<td>" + village + "</td>");
        out.println("<td>" + doorno + "</td></tr>");
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
            out.println("<tr><td  class=fail>" + "ViewBean:" + e + "</td></tr>");
        }
    }
}
