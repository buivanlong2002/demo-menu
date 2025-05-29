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

    // Retrieve categorized items from request scope
    List<Map<String, String>> foodItems = (List<Map<String, String>>) request.getAttribute("foodItems");
    List<Map<String, String>> drinkItems = (List<Map<String, String>>) request.getAttribute("drinkItems");
    List<Map<String, String>> fruitItems = (List<Map<String, String>>) request.getAttribute("fruitItems");
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
            background: #f8fafc;
            font-family: 'Poppins', sans-serif;
            color: #2d3748;
        }
        .hero-header {
            background: url('https://images.unsplash.com/photo-1515003197210-e0cd71810b5f') no-repeat center center;
            background-size: cover;
            padding: 6rem 0;
            position: relative;
            text-align: center;
            color: white;
        }
        .hero-header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(to bottom, rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.7));
        }
        .sidebar {
            background: #ffffff;
            box-shadow: 2px 0 10px rgba(0, 0, 0, 0.1);
            height: 100vh;
            position: sticky;
            top: 0;
            padding-top: 2rem;
        }
        .sidebar .nav-link {
            color: #4b5563;
            font-weight: 500;
            padding: 1rem 2rem;
            border-radius: 10px;
            margin: 0.5rem 1rem;
            transition: all 0.3s ease;
        }
        .sidebar .nav-link:hover, .sidebar .nav-link.active {
            background: linear-gradient(to right, #f472b6, #fb7185);
            color: white;
        }
        .menu-card {
            border: none;
            border-radius: 15px;
            background: white;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            overflow: hidden;
        }
        .menu-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        }
        .menu-card img {
            height: 180px;
            object-fit: cover;
        }
        .card-body {
            padding: 1.5rem;
        }
        .quantity-input {
            width: 70px;
            border-radius: 8px;
            border: 1px solid #d1d5db;
            text-align: center;
        }
        .add-btn {
            background: linear-gradient(to right, #f472b6, #fb7185);
            border: none;
            border-radius: 8px;
            transition: all 0.3s ease;
        }
        .add-btn:hover {
            background: linear-gradient(to right, #ec4899, #f43f5e);
        }
        .order-summary {
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            padding: 2rem;
            margin-top: 2rem;
        }
        .confirm-btn {
            background: linear-gradient(to right, #3b82f6, #60a5fa);
            border: none;
            border-radius: 8px;
        }
        .confirm-btn:hover {
            background: linear-gradient(to right, #2563eb, #3b82f6);
        }
        .section-title {
            color: #1f2937;
            font-weight: 700;
            margin-bottom: 2rem;
        }
        .fade-in {
            animation: fadeIn 0.5s ease-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .modal-content {
            border-radius: 15px;
            border: none;
            background: white;
        }
        .modal-header, .modal-footer {
            border: none;
        }
    </style>
</head>
<body>
<div class="d-flex min-vh-100">
    <!-- Sidebar -->
    <div class="sidebar col-md-3 col-lg-2 p-0">
        <nav class="nav flex-column">
            <a class="nav-link active" href="#food">Đồ Ăn</a>
            <a class="nav-link" href="#drinks">Đồ Uống</a>
            <a class="nav-link" href="#fruits">Trái Cây</a>
        </nav>
    </div>

    <!-- Main Content -->
    <div class="flex-grow-1">
        <!-- Hero Header -->
        <header class="hero-header position-relative">
            <div class="container position-relative">
                <h1 class="display-3 fw-bold">Nhà Hàng Việt</h1>
                <h2 class="fs-4 mt-3">Bàn số <%= table %></h2>
            </div>
        </header>

        <!-- Menu Sections -->
        <div class="container py-5">
            <!-- Food Section -->
            <section id="food">
                <h3 class="section-title fs-2 text-center fade-in">Đồ Ăn</h3>
                <div class="row row-cols-1 row-cols-sm-2 row-cols-lg-3 g-4 mb-5">
                    <% for (Map<String, String> item : foodItems) { %>
                    <div class="col">
                        <div class="menu-card fade-in">
                            <img src="<%= item.get("image") %>" alt="<%= item.get("name") %>" class="w-100">
                            <div class="card-body">
                                <h4 class="card-title fw-bold"><%= item.get("name") %></h4>
                                <p class="text-primary fw-semibold mb-2"><%= item.get("price") %> VNĐ</p>
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
            </section>

            <!-- Drinks Section -->
            <section id="drinks">
                <h3 class="section-title fs-2 text-center fade-in">Đồ Uống</h3>
                <div class="row row-cols-1 row-cols-sm-2 row-cols-lg-3 g-4 mb-5">
                    <% for (Map<String, String> item : drinkItems) { %>
                    <div class="col">
                        <div class="menu-card fade-in">
                            <img src="<%= item.get("image") %>" alt="<%= item.get("name") %>" class="w-100">
                            <div class="card-body">
                                <h4 class="card-title fw-bold"><%= item.get("name") %></h4>
                                <p class="text-primary fw-semibold mb-2"><%= item.get("price") %> VNĐ</p>
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
            </section>

            <!-- Fruits Section -->
            <section id="fruits">
                <h3 class="section-title fs-2 text-center fade-in">Trái Cây</h3>
                <div class="row row-cols-1 row-cols-sm-2 row-cols-lg-3 g-4 mb-5">
                    <% for (Map<String, String> item : fruitItems) { %>
                    <div class="col">
                        <div class="menu-card fade-in">
                            <img src="<%= item.get("image") %>" alt="<%= item.get("name") %>" class="w-100">
                            <div class="card-body">
                                <h4 class="card-title fw-bold"><%= item.get("name") %></h4>
                                <p class="text-primary fw-semibold mb-2"><%= item.get("price") %> VNĐ</p>
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
            </section>

            <!-- Order Summary Section -->
            <section class="order-summary">
                <h3 class="fs-3 fw-bold mb-4">Tóm Tắt Đơn Hàng</h3>
                <div class="table-responsive">
                    <table class="table table-borderless">
                        <thead>
                        <tr>
                            <th>Món</th>
                            <th>Số lượng</th>
                            <th>Giá</th>
                            <th>Tổng</th>
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
            </section>
        </div>
    </div>
</div>

<!-- Confirmation Modal -->
<div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="confirmModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title fs-4 fw-bold" id="confirmModalLabel">Xác Nhận Đơn Hàng</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p class="fs-5">Bạn có chắc muốn xác nhận đơn hàng này?</p>
                <p class="text-muted">Vui lòng kiểm tra lại tóm tắt đơn hàng trước khi xác nhận.</p>
            </div>
            <div class="modal-footer">
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

    // Smooth scroll for sidebar navigation
    document.querySelectorAll('.sidebar .nav-link').forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            document.querySelectorAll('.sidebar .nav-link').forEach(nav => nav.classList.remove('active'));
            this.classList.add('active');
            const target = document.querySelector(this.getAttribute('href'));
            target.scrollIntoView({ behavior: 'smooth' });
        });
    });
</script>