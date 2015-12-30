package com.diyiliu.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;

/**
 * Description: ${NAME}
 * Author: DIYILIU
 * Update: 2015-12-30 14:28
 */
@MultipartConfig
@WebServlet(name = "UploadServlet", urlPatterns = "/upload")
public class UploadServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("doPost() ... ");

        request.setCharacterEncoding("UTF-8");
        Part part = request.getPart("file");
        String disposition = part.getHeader("content-disposition");

        System.out.println(disposition);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("doGet() ... ");
        doPost(request, response);
    }
}
