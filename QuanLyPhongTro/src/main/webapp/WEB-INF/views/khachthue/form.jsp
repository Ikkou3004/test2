<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title><c:choose><c:when test="${item.id != null}">Sửa khách thuê</c:when><c:otherwise>Thêm khách thuê</c:otherwise></c:choose></title>
    <style>
        label { display:block; margin-top:10px; }
        input, textarea { width: 320px; padding:6px; }
        .actions { margin-top: 12px; }
        button, a.button { padding: 6px 12px; background:#1976d2; color:#fff; border:none; border-radius:4px; text-decoration:none; }
        a.button { background:#616161; }
        .error { color:#d32f2f; }
    </style>
</head>
<body>
<h1><c:choose><c:when test="${item.id != null}">Sửa khách thuê</c:when><c:otherwise>Thêm khách thuê</c:otherwise></c:choose></h1>
<form method="post" action="${pageContext.request.contextPath}/khachthue<c:if test='${item.id != null}'>/${item.id}/update</c:if>">
    <label>Họ tên *</label>
    <input type="text" name="hoTen" value="${item.hoTen}" required />

    <label>Số điện thoại *</label>
    <input type="text" name="soDienThoai" value="${item.soDienThoai}" required />

    <label>CMND/CCCD *</label>
    <input type="text" name="cccd" value="${item.cccd}" required />

    <label>Địa chỉ</label>
    <textarea name="diaChi" rows="3">${item.diaChi}</textarea>

    <label>Ngày sinh</label>
    <input type="date" name="ngaySinh" value="${item.ngaySinh}" />

    <div class="actions">
        <button type="submit">Lưu</button>
        <a class="button" href="${pageContext.request.contextPath}/khachthue">Hủy</a>
    </div>
</form>
</body>
</html>
