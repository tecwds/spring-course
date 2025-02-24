package top.wpaint.servletjdbcdemo;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


@WebServlet("/students")
public class StudentAllServlet extends HttpServlet {

    // JDBC 驱动名及数据库 URL
    static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://127.0.0.1:3306/jdbc_demo?serverTimezone=Asia/Shanghai&characterEncoding=UTF-8";
    // 数据库的用户名与密码
    static final String USER = "root";
    static final String PASS = "2YiKvFaCzF9gDIAuJ/2rQlmsuO8=";


    private ObjectMapper objectMapper = new ObjectMapper();

    // 重写doGet方法
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();

        // 数据库查询操作
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName(JDBC_DRIVER);
            // 1.根据DriverManager创建conn
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            // 2.创建PreparedStatement
            ps = conn.prepareStatement("SELECT * FROM student");
            // 3.执行查询
            rs = ps.executeQuery();

            List<StudentVO> list = new ArrayList<>();
            while (rs.next()) {
                StudentVO studentVO = new StudentVO();
                studentVO.setId(rs.getInt("id"));
                studentVO.setName(rs.getString("name"));
                studentVO.setAge(rs.getInt("age"));
                studentVO.setGender(rs.getString("gender"));
                list.add(studentVO);
            }
            out.print(objectMapper.writeValueAsString(list));
        } catch (SQLException se) {
            // 处理 JDBC 错误
            ObjectNode errorResponse = objectMapper.createObjectNode();
            errorResponse.put("status", "error");
            errorResponse.put("message", "数据库错误");
            out.print(objectMapper.writeValueAsString(errorResponse));
            se.printStackTrace();
        } catch (Exception e) {
            // 处理 Class.forName 错误
            ObjectNode errorResponse = objectMapper.createObjectNode();
            errorResponse.put("status", "error");
            errorResponse.put("message", "服务器内部错误");
            out.print(objectMapper.writeValueAsString(errorResponse));
            e.printStackTrace();
        } finally {
            // 关闭资源
            try {
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }

    }


}