package com.rr.beans;

import jakarta.servlet.jsp.JspWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class ResLandSaveBean {

    private JspWriter out;
    private Connection con;
    private PreparedStatement ps;
    private String surveyno;
    private int distid, divid, villageid, mandalid;

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

    public boolean insert() throws IOException {
        boolean stat = false;
        try {
            String sql1 = "insert into resland_master values(?,?,?,?,?) ";
            con = DBCon.getConnection();
            con.setAutoCommit(false);
            ps = con.prepareStatement(sql1);
            ps.setInt(1, distid);
            ps.setInt(2, divid);
            ps.setInt(3, mandalid);
            ps.setInt(4, villageid);
            ps.setString(5, surveyno);
            ps.executeUpdate();
            stat = true;
        } catch (Exception e1) {
            stat = false;
            out.println("<tr><td  class=fail>" + "ResLandSaveBean:" + e1 + "</td></tr>");
            try {
                con.rollback();
            } catch (Exception e2) {
                out.println("<tr><td  class=fail>" + "ResLandSaveBean:" + e2 + "</td></tr>");
            }
        } finally {
            try {
                con.commit();
                con.close();
            } catch (Exception e3) {
                out.println("<tr><td  class=fail>" + "ResLandSaveBean:" + e3 + "</td></tr>");
            }
        }
        return stat;
    }
}
