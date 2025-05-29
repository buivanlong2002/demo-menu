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