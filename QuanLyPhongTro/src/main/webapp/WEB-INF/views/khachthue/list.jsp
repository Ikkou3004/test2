<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Danh sách khách thuê</title>
    <style>
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid #ddd; padding: 8px; }
        th { background: #f6f6f6; }
        a.button { display: inline-block; padding: 6px 10px; background: #1976d2; color: #fff; text-decoration: none; border-radius: 4px; }
        a.button.delete { background: #d32f2f; }
        a.button.edit { background: #0288d1; }
    </style>
</head>
<body>
<h1>Danh sách khách thuê</h1>
<p>
    <a class="button" href="${pageContext.request.contextPath}/khachthue/new">+ Thêm khách thuê</a>
    <a class="button" href="${pageContext.request.contextPath}/">Về trang chủ</a>
</p>
<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Họ tên</th>
        <th>SĐT</th>
        <th>CCCD</th>
        <th>Địa chỉ</th>
        <th>Ngày sinh</th>
        <th>Hành động</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${items}" var="it">
        <tr>
            <td>${it.id}</td>
            <td>${it.hoTen}</td>
            <td>${it.soDienThoai}</td>
            <td>${it.cccd}</td>
            <td>${it.diaChi}</td>
            <td>${it.ngaySinh}</td>
            <td>
                <a class="button edit" href="${pageContext.request.contextPath}/khachthue/${it.id}/edit">Sửa</a>
                <a class="button delete" href="${pageContext.request.contextPath}/khachthue/${it.id}/delete" onclick="return confirm('Xóa khách thuê này?');">Xóa</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
