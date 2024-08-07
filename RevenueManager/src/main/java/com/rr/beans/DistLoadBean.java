package com.rr.beans;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.jsp.JspWriter;

public class DistLoadBean {

    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    JspWriter out;

    public void setOut(JspWriter out) {
        this.out = out;
    }

    public void loadOptions() throws IOException {
        try {
            con = DBCon.getConnection();
            ps = con.prepareStatement("select * from dist_master where distid > 0");
            rs = ps.executeQuery();
            while (rs.next()) {
                out.println("<option value=\"" + rs.getInt(1) + "\">" + rs.getString(2) + "</option>");
            }
        } catch (Exception e) {
            out.println(e);
        } finally {
            closeResources();
        }
    }

    public void loadOptions(int distid) throws IOException {
        try {
            con = DBCon.getConnection();
            ps = con.prepareStatement("select * from dist_master where distid > 0");
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                if (id == distid)
                    out.println("<option value=\"" + id + "\" selected>" + rs.getString(2) + "</option>");
                else
                    out.println("<option value=\"" + id + "\">" + rs.getString(2) + "</option>");
            }
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
