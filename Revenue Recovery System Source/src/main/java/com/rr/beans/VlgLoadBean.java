package com.rr.beans;

import jakarta.servlet.jsp.JspWriter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class VlgLoadBean {

    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    private JspWriter out;

    public void setOut(JspWriter out) {
        this.out = out;
    }

    public void load(String distid, String divid, String mandalid) throws IOException {
        int givendiv = 1, givendist = 1, givenmandal = 1;

        if (distid != null && divid != null) {
            givendist = Integer.parseInt(distid);
            givendiv = Integer.parseInt(divid);
            givenmandal = Integer.parseInt(mandalid);
        }

        try {
            con = DBCon.getConnection();

            // Load Districts
            loadOptions("select *from dist_master where distid>0", givendist, "[Select District]");

            // Load Divisions
            loadOptions("select *from div_master where distid=?", givendiv, "[Select Division]");

            // Load Mandals
            loadOptions("select *from mandal_master where distid=? and divid=?", givenmandal, "[Select Mandal]");

            rs.close();
        } catch (Exception e) {
            out.println(e);
        }
    }

    public void load(int distid, int divid, int mandalid) throws IOException {
        try {
            con = DBCon.getConnection();
            ps = con.prepareStatement("select *from village_master where distid=? and divid=? and mandalid=?");
            ps.setInt(1, distid);
            ps.setInt(2, divid);
            ps.setInt(3, mandalid);
            rs = ps.executeQuery();

            // Load Villages
            loadOptions(rs, "[Select Village]");

            rs.close();
        } catch (Exception e) {
            out.println(e);
        }
    }

    private void loadOptions(String query, int givenId, String defaultOption) throws Exception {
        ps = con.prepareStatement(query);
        rs = ps.executeQuery();

        out.println("<tr><td>" + defaultOption + "</td>");
        out.println("<td class=\"t1\"><select name=\"distid\" onchange=\"reload()\">");

        while (rs.next()) {
            int curId = rs.getInt(1);
            String selected = (curId == givenId) ? " selected" : "";
            out.println("<option value=\"" + curId + "\"" + selected + ">" + rs.getString(2) + "</option>");
        }

        out.println("</select></td></tr>");
    }

    private void loadOptions(ResultSet rs, String defaultOption) throws Exception {
        out.println("<tr><td>Village Name</td>");
        out.println("<td class=\"t1\"><select name=\"villageid\">");
        out.println("<option value=0>" + defaultOption + "</option>");

        while (rs.next()) {
            out.println("<option value=\"" + rs.getInt(4) + "\">" + rs.getString(5) + "</option>");
        }

        out.println("</select></td></tr>");
    }
}
