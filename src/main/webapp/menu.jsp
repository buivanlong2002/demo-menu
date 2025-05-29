<%--
  Created by IntelliJ IDEA.
  User: LONGBV
  Date: 29/05/2025
  Time: 11:30 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%
    String table = request.getParameter("table");
    if (table == null) table = "unknown";

    // Categorized menu items: Food, Drinks, Fruits
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

    List<Map<String, String>> fruitItems = Arrays.asList(
            new HashMap<String, String>() {{
                put("name", "Dĩa trái cây");
                put("price", "30000");
                put("description", "Hỗn hợp trái cây tươi: dưa hấu, xoài, dứa.");
                put("image", "https://images.unsplash.com/photo-1600585154340-be6161a56a0c");
            }}
    );
%>
<html>
<head>
    <title>Menu Nhà Hàng</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            background: linear-gradient(135deg, #f9e2af, #6ee7b7);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .menu-card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: none;
            border-radius: 15px;
            overflow: hidden;
            background: white;
        }
        .menu-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.2);
        }
        .menu-card img {
            height: 200px;
            object-fit: cover;
        }
        .header {
            background: #198754;
            padding: 2rem 0;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .order-summary {
            position: sticky;
            top: 20px;
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            padding: 2rem;
        }
        .quantity-input {
            width: 80px;
            border-radius: 8px;
            text-align: center;
        }
        .add-btn {
            background: linear-gradient(to right, #28a745, #34d058);
            border: none;
            border-radius: 8px;
            transition: background 0.3s ease;
        }
        .add-btn:hover {
            background: linear-gradient(to right, #218838, #2cc653);
        }
        .confirm-btn {
            background: linear-gradient(to right, #0d6efd, #4d8cff);
            border: none;
            border-radius: 8px;
        }
        .confirm-btn:hover {
            background: linear-gradient(to right, #0a58ca, #3b7cff);
        }
        .section-title {
            position: relative;
            display: inline-block;
            margin-bottom: 2rem;
        }
        .section-title::after {
            content: '';
            position: absolute;
            bottom: -8px;
            left: 0;
            width: 50%;
            height: 4px;
            background: #198754;
            border-radius: 2px;
        }
        .modal-content {
            border-radius: 15px;
            border: none;
        }
        .fade-in {
            animation: fadeIn 0.5s ease-in;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
<div class="min-vh-100">
    <!-- Header -->
    <header class="header text-white text-center">
        <div class="container">
            <h1 class="display-4 fw-bold">Nhà Hàng Việt</h1>
            <h2 class="fs-3 mt-2">Bàn số <%= table %></h2>
        </div>
    </header>

    <!-- Menu Sections -->
    <div class="container py-5">
        <!-- Food Section -->
        <h3 class="section-title text-center fs-2 fw-bold text-dark mb-5 fade-in">Đồ Ăn</h3>
        <div class="row row-cols-1 row-cols-sm-2 row-cols-lg-3 g-4 mb-5">
            <% for (Map<String, String> item : foodItems) { %>
            <div class="col">
                <div class="menu-card fade-in">
                    <img src="<%= item.get("image") %>" alt="<%= item.get("name") %>" class="w-100">
                    <div class="card-body p-4">
                        <h4 class="card-title fw-bold text-dark"><%= item.get("name") %></h4>
                        <p class="text-success fw-semibold mb-2"><%= item.get("price") %> VNĐ</p>
                        <p class="card-text text-muted"><%= item.get("description") %></p>
                        <div class="d-flex align-items-center gap-3">
                            <input type="number" min="0" value="0" class="form-control quantity-input" data-name="<%= item.get("name") %>" data-price="<%= item.get("price") %>">
                            <button onclick="addToOrder(this)" class="btn add-btn text-white px-4"><i class="bi bi-plus-circle me-2"></i>Thêm</button>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>
        </div>

        <!-- Drinks Section -->
        <h3 class="section-title text-center fs-2 fw-bold text-dark mb-5 fade-in">Đồ Uống</h3>
        <div class="row row-cols-1 row-cols-sm-2 row-cols-lg-3 g-4 mb-5">
            <% for (Map<String, String> item : drinkItems) { %>
            <div class="col">
                <div class="menu-card fade-in">
                    <img src="<%= item.get("image") %>" alt="<%= item.get("name") %>" class="w-100">
                    <div class="card-body p-4">
                        <h4 class="card-title fw-bold text-dark"><%= item.get("name") %></h4>
                        <p class="text-success fw-semibold mb-2"><%= item.get("price") %> VNĐ</p>
                        <p class="card-text text-muted"><%= item.get("description") %></p>
                        <div class="d-flex align-items-center gap-3">
                            <input type="number" min="0" value="0" class="form-control quantity-input" data-name="<%= item.get("name") %>" data-price="<%= item.get("price") %>">
                            <button onclick="addToOrder(this)" class="btn add-btn text-white px-4"><i class="bi bi-plus-circle me-2"></i>Thêm</button>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>
        </div>

        <!-- Fruits Section -->
        <h3 class="section-title text-center fs-2 fw-bold text-dark mb-5 fade-in">Trái Cây</h3>
        <div class="row row-cols-1 row-cols-sm-2 row-cols-lg-3 g-4 mb-5">
            <% for (Map<String, String> item : fruitItems) { %>
            <div class="col">
                <div class="menu-card fade-in">
                    <img src="<%= item.get("image") %>" alt="<%= item.get("name") %>" class="w-100">
                    <div class="card-body p-4">
                        <h4 class="card-title fw-bold text-dark"><%= item.get("name") %></h4>
                        <p class="text-success fw-semibold mb-2"><%= item.get("price") %> VNĐ</p>
                        <p class="card-text text-muted"><%= item.get("description") %></p>
                        <div class="d-flex align-items-center gap-3">
                            <input type="number" min="0" value="0" class="form-control quantity-input" data-name="<%= item.get("name") %>" data-price="<%= item.get("price") %>">
                            <button onclick="addToOrder(this)" class="btn add-btn text-white px-4"><i class="bi bi-plus-circle me-2"></i>Thêm</button>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    </div>

    <!-- Order Summary Section -->
    <div class="container pb-5">
        <div class="order-summary">
            <h3 class="fs-3 fw-bold text-dark mb-4">Tóm Tắt Đơn Hàng</h3>
            <div class="table-responsive">
                <table class="table table-borderless">
                    <thead>
                    <tr>
                        <th class="text-dark">Món</th>
                        <th class="text-dark">Số lượng</th>
                        <th class="text-dark">Giá</th>
                        <th class="text-dark">Tổng</th>
                    </tr>
                    </thead>
                    <tbody id="orderBody"></tbody>
                    <tfoot>
                    <tr class="fw-bold">
                        <td colspan="3" class="text-end">Tổng cộng:</td>
                        <td id="totalPrice">0 VNĐ</td>
                    </tr>
                    </tfoot>
                </table>
            </div>
            <button class="btn confirm-btn text-white w-100 py-3 mt-4" data-bs-toggle="modal" data-bs-target="#confirmModal">Xác Nhận Thanh Toán</button>
        </div>
    </div>

    <!-- Confirmation Modal -->
    <div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="confirmModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header border-0">
                    <h5 class="modal-title fs-4 fw-bold" id="confirmModalLabel">Xác Nhận Đơn Hàng</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p class="fs-5">Bạn có chắc muốn xác nhận đơn hàng này?</p>
                    <p class="text-muted">Vui lòng kiểm tra lại tóm tắt đơn hàng trước khi xác nhận.</p>
                </div>
                <div class="modal-footer border-0">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <button type="button" class="btn confirm-btn text-white" onclick="confirmOrder()">Xác Nhận</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="bg-dark text-white text-center py-4">
        <p>© 2025 Nhà Hàng Việt. All rights reserved.</p>
    </footer>
</div>

<!-- Bootstrap 5 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script>
    let order = {};

    function addToOrder(button) {
        const card = button.closest('.menu-card');
        const name = card.querySelector('.quantity-input').dataset.name;
        const price = parseInt(card.querySelector('.quantity-input').dataset.price);
        const quantity = parseInt(card.querySelector('.quantity-input').value);

        if (quantity > 0) {
            if (order[name]) {
                order[name].quantity += quantity;
            } else {
                order[name] = { quantity, price };
            }
            updateOrderTable();
        }
        card.querySelector('.quantity-input').value = 0; // Reset input
    }

    function updateOrderTable() {
        const orderBody = document.getElementById('orderBody');
        orderBody.innerHTML = '';
        let total = 0;

        for (const [name, item] of Object.entries(order)) {
            const row = document.createElement('tr');
            const itemTotal = item.quantity * item.price;
            total += itemTotal;
            row.innerHTML = `
                    <td>${name}</td>
                    <td>${item.quantity}</td>
                    <td>${item.price.toLocaleString()} VNĐ</td>
                    <td>${itemTotal.toLocaleString()} VNĐ</td>
                `;
            orderBody.appendChild(row);
        }

        document.getElementById('totalPrice').textContent = `${total.toLocaleString()} VNĐ`;
    }

    function confirmOrder() {
        if (Object.keys(order).length === 0) {
            alert('Vui lòng chọn ít nhất một món!');
            return;
        }
        alert('Đơn hàng đã được xác nhận! Cảm ơn bạn.');
        order = {};
        updateOrderTable();
        bootstrap.Modal.getInstance(document.getElementById('confirmModal')).hide();
    }
</script>