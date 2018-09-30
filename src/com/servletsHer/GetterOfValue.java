package com.servletsHer;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class GetterOfValue  extends HttpServlet {
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException{
        String[] i = req.getParameterValues("product[]");
        String[] d = req.getParameterValues("qty[]");
        String[] j = req.getParameterValues("price[]");
        String[] c = req.getParameterValues("total[]");

        res.getWriter().println("result"+i[1]);
        res.getWriter().println("result"+d[1]);
        res.getWriter().println("result"+j[1]);
        res.getWriter().println("result"+c[1]);


    }






}
