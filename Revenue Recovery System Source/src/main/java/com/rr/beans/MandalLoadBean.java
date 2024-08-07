package com.rr.beans;

import jakarta.servlet.jsp.JspWriter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MandalLoadBean {

    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    private JspWriter out;

    public void setOut(JspWriter out) {
        this.out = out;
    }

    public void load(String distid, String divid) throws IOException {
        int curid, givendist = 1, givenid = 1;
        if (distid != null && divid != null) {
            givendist = Integer.parseInt(distid);
            givenid = Integer.parseInt(divid);
        }
        try {
            con = DBCon.getConnection();
            ps = con.prepareStatement("select * from dist_master where distid>0");
            rs = ps.executeQuery();

            while (rs.next()) {
                curid = rs.getInt(1);
                if (curid == givendist)
                    out.println("<option value=\"" + curid + "\" selected>" + rs.getString(2) + "</option>");
                else
                    out.println("<option value=\"" + curid + "\">" + rs.getString(2) + "</option>");
            }

            out.println("</select></td></tr>");

            ps = con.prepareStatement("select * from div_master where distid=?");
            ps.setInt(1, Integer.parseInt(distid));
            rs = ps.executeQuery();

            out.println("<tr><td>Divison Name</td>");
            out.println("<td class=\"t1\"><select name=\"divid\" onchange=\"reload()\">");
            out.println("<option value=0>[Select Division]</option>");

            while (rs.next()) {
                curid = rs.getInt(2);
                if (curid == givenid)
                    out.println("<option value=\"" + curid + "\" selected>" + rs.getString(3) + "</option>");
                else
                    out.println("<option value=\"" + curid + "\">" + rs.getString(3) + "</option>");
            }

            out.println("</select></td></tr>");

            rs.close();
        } catch (Exception e) {
            out.println(e);
        }
    }

    public void load(int distid, int divid) throws IOException {
        try {
            con = DBCon.getConnection();
            ps = con.prepareStatement("select * from mandal_master where distid=? and divid=?");
            ps.setInt(1, distid);
            ps.setInt(2, divid);
            rs = ps.executeQuery();

            out.println("<tr><td>Mandal Name</td>");
            out.println("<td class=\"t1\"><select name=\"mandalid\">");
            out.println("<option value=0>[Select Mandal]</option>");

            while (rs.next()) {
                out.println("<option value=\"" + rs.getInt(3) + "\">" + rs.getString(4) + "</option>");
            }

            out.println("</select></td></tr>");
            rs.close();
        } catch (Exception e) {
            out.println(e);
        }
    }
}
