package com.rr.beans;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.jsp.JspWriter;

public class AgLandSaveBean {

    JspWriter out;
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    String surveyno;
    int distid, divid, villageid, mandalid;

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

    public void setSurveyno(String surveyno) {
        this.surveyno = surveyno;
    }

    public boolean insert() throws IOException, ClassNotFoundException, SQLException {
        boolean stat = false;
        try {
            String sql1 = "insert into agland_master values(?,?,?,?,?) ";
            con = DBCon.getConnection();
            con.setAutoCommit(false);
            try (PreparedStatement ps = con.prepareStatement(sql1)) {
                ps.setInt(1, distid);
                ps.setInt(2, divid);
                ps.setInt(3, mandalid);
                ps.setInt(4, villageid);
                ps.setString(5, surveyno);
                ps.executeUpdate();
                stat = true;
            } catch (Exception e1) {
                stat = false;
                out.println("<tr><td  class=fail>" + "AgLandSaveBean:" + e1 + "</td></tr>");
                try {
                    con.rollback();
                } catch (Exception e2) {
                    out.println("<tr><td  class=fail>" + "AgLandSaveBean:" + e2 + "</td></tr>");
                }
            }
        } finally {
            try {
                con.commit();
                con.close();
            } catch (Exception e3) {
                out.println("<tr><td  class=fail>" + "AgLandSaveBean:" + e3 + "</td></tr>");
            }
        }
        return stat;
    }
}
