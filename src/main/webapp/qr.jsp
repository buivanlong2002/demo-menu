<%--
  Created by IntelliJ IDEA.
  User: LONGBV
  Date: 29/05/2025
  Time: 10:59 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tạo QR theo số bàn</title>
</head>
<body>
<h2>Tạo mã QR cho từng bàn</h2>
<form method="get" action="generateQR">
    <label>Nhập số bàn:</label>
    <input type="number" name="table" required min="1" />
    <button type="submit">Tạo mã QR</button>
</form>
</body>
</html>

