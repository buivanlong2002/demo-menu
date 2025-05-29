package org.example.demomenu;

import java.io.IOException;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Food items
        List<Map<String, String>> foodItems = Arrays.asList(
                new HashMap<String, String>() {{
                    put("name", "Phở bò");
                    put("price", "60000");
                    put("description", "Phở bò truyền thống với nước dùng thơm lừng, thịt bò mềm.");
                    put("image", "https://images.unsplash.com/photo-1615928889902-7aa7a59807f8");
                }},
                new HashMap<String, String>() {{
                    put("name", "Bún chả");
                    put("price", "50000");
                    put("description", "Chả nướng thơm, ăn kèm bún và nước mắm chua ngọt.");
                    put("image", "https://images.unsplash.com/photo-1620292760780-172b9c4a0b6c");
                }},
                new HashMap<String, String>() {{
                    put("name", "Cơm tấm");
                    put("price", "45000");
                    put("description", "Cơm tấm sườn nướng, trứng ốp la và dưa chua.");
                    put("image", "https://images.unsplash.com/photo-1603133872878-684f1e9e8a8b");
                }}
        );

        // Drink items
        List<Map<String, String>> drinkItems = Arrays.asList(
                new HashMap<String, String>() {{
                    put("name", "Trà đá");
                    put("price", "10000");
                    put("description", "Trà đá mát lạnh, giải nhiệt ngày hè.");
                    put("image", "https://images.unsplash.com/photo-1551537482-9a8f8e12d4aa");
                }},
                new HashMap<String, String>() {{
                    put("name", "Cà phê sữa đá");
                    put("price", "25000");
                    put("description", "Cà phê đậm đà hòa quyện với sữa béo ngậy.");
                    put("image", "https://images.unsplash.com/photo-1512568400610-6a6d8e283bf9");
                }}
        );

        // Fruit items
        List<Map<String, String>> fruitItems = Arrays.asList(
                new HashMap<String, String>() {{
                    put("name", "Dĩa trái cây");
                    put("price", "30000");
                    put("description", "Hỗn hợp trái cây tươi: dưa hấu, xoài, dứa.");
                    put("image", "https://images.unsplash.com/photo-1600585154340-be6161a56a0c");
                }}
        );

        // Store categorized items in request scope
        request.setAttribute("foodItems", foodItems);
        request.setAttribute("drinkItems", drinkItems);
        request.setAttribute("fruitItems", fruitItems);

        // Forward to menu.jsp
        request.getRequestDispatcher("/menu.jsp").forward(request, response);
    }
}