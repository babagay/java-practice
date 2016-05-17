package ru.babagay.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ru.babagay.social.service.NameService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("/register")
public class RegisterController extends HttpServlet {

    private static final Logger LOGGER = LoggerFactory.getLogger(RegisterController.class);

    // JDBC driver name and database URL
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost/pet";

    //  Database credentials
    static final String USER = "root";
    static final String PASS = "";

    private Connection conn = null;
    private Statement stmt = null;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        LOGGER.debug("doGet register");
        req.getRequestDispatcher("/WEB-INF/JSP/register.jsp").forward(req, resp);
    }

    private boolean isValid(String name) {
        return name != null && name.trim().length() != 0;
    }

    private void initConnection(){

        try {
            //STEP 2: Register JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            //STEP 3: Open a connection
            System.out.println("Connecting to database...");
            conn = DriverManager.getConnection(DB_URL,USER,PASS);

        } catch(SQLException se){
            //Handle errors for JDBC
            se.printStackTrace();
        }catch(Exception e){
            //Handle errors for Class.forName
            e.printStackTrace();
        }
        /*
        finally{
            //finally block used to close resources
            try{
                if(stmt!=null)
                    stmt.close();
            }catch(SQLException se2){
            }// nothing we can do
            try{
                if(conn!=null)
                    conn.close();
            }catch(SQLException se){
                se.printStackTrace();
            }//end finally try
        }//end try
        */
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        LOGGER.debug("doPost register: {}", req.getParameterMap());

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String message = "Ok";
        String sql;

        if(!isValid(username)) {
            req.setAttribute("invalid", Boolean.TRUE);
            req.getRequestDispatcher("/WEB-INF/JSP/register.jsp").forward(req, resp);
            return;
        }

        /**
         * http://www.tutorialspoint.com/jdbc/jdbc-sample-code.htm
         */
        initConnection();

        //STEP 4: Execute a query
        System.out.println("Creating statement...");
        try {
            stmt = conn.createStatement();
            sql = "INSERT INTO `user` SET login = '"+ username +"', password = '"+ password +"'; ";
            ResultSet rs = stmt.executeQuery(sql);

            //STEP 6: Clean-up environment
            rs.close();
            stmt.close();
            conn.close();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            //finally block used to close resources
            try{
                if(stmt!=null)
                    stmt.close();
            }catch(SQLException se2){
            }// nothing we can do
            try{
                if(conn!=null)
                    conn.close();
            }catch(SQLException se){
                se.printStackTrace();
            }//end finally try
        }



//        String result = NameService.getInstance().convertName(username);
//        req.setAttribute("name", username);
        req.setAttribute("message", message);
        req.getRequestDispatcher("/WEB-INF/JSP/register.jsp").forward(req, resp);
    }

}
