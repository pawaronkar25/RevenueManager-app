package com.rr.beans;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.jsp.JspWriter;

public class DivLoadBean {

    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    JspWriter out;

    public void setOut(JspWriter out) {
        this.out = out;
    }

    public void load(String distid) throws IOException {
        int curid, givenid = 1;
        if (distid != null) {
            givenid = Integer.parseInt(distid);
        }
        try {
            con = DBCon.getConnection();
            ps = con.prepareStatement("select * from dist_master where distid > 0");
            rs = ps.executeQuery();
            while (rs.next()) {
                curid = rs.getInt(1);
                if (curid == givenid)
                    out.println("<option value=\"" + curid + "\" selected>" + rs.getString(2) + "</option>");
                else
                    out.println("<option value=\"" + curid + "\">" + rs.getString(2) + "</option>");
            }
            out.println("</select>");
        } catch (Exception e) {
            out.println(e);
        } finally {
            closeResources();
        }
    }

    public void load(int distid) throws IOException {
        try {
            con = DBCon.getConnection();
            ps = con.prepareStatement("select * from div_master where distid=?");
            ps.setInt(1, distid);
            rs = ps.executeQuery();
            out.println("<tr><td>Division Name</td>");
            out.println("<td class=\"t1\"><select name=\"divid\">");
            out.println("<option value=0>[Select Division]</option>");
            while (rs.next()) {
                out.println("<option value=\"" + rs.getInt(2) + "\">" + rs.getString(3) + "</option>");
            }
            out.println("</select></td></tr>");
        } catch (Exception e) {
            out.println(e);
        } finally {
            closeResources();
        }
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
            out.println(e);
        }
    }
}
