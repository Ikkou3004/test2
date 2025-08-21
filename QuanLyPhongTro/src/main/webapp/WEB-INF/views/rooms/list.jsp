<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Danh sách phòng</title>
    <style>
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid #ddd; padding: 8px; }
        th { background: #f6f6f6; }
        a.button { display: inline-block; padding: 6px 10px; background: #1976d2; color: #fff; text-decoration: none; border-radius: 4px; }
        a.button.delete { background: #d32f2f; }
        a.button.edit { background: #0288d1; }
        form.inline { display:inline; margin:0; }
        button.small { padding:4px 8px; }
    </style>
</head>
<body>
<h1>Danh sách phòng</h1>
<p>
    <a class="button" href="${pageContext.request.contextPath}/rooms/new">+ Thêm phòng</a>
    <a class="button" href="${pageContext.request.contextPath}/">Về trang chủ</a>
</p>
<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Số phòng</th>
        <th>Giá phòng</th>
        <th>Diện tích</th>
        <th>Trạng thái</th>
        <th>Ghi chú</th>
        <th>Hành động</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${rooms}" var="r">
        <tr>
            <td>${r.id}</td>
            <td>${r.soPhong}</td>
            <td>${r.giaPhong}</td>
            <td>${r.dienTich}</td>
            <td>${r.trangThai}</td>
            <td>${r.ghiChu}</td>
            <td>
                <a class="button edit" href="${pageContext.request.contextPath}/rooms/${r.id}/edit">Sửa</a>
                <form class="inline" method="post" action="${pageContext.request.contextPath}/rooms/${r.id}/status">
                    <input type="hidden" name="value" value="${r.trangThai == 'TRONG' ? 'DANG_THUE' : 'TRONG'}" />
                    <button class="small" type="submit">
                        <c:choose>
                            <c:when test="${r.trangThai == 'TRONG'}">Đánh dấu ĐANG THUÊ</c:when>
                            <c:otherwise>Đánh dấu TRỐNG</c:otherwise>
                        </c:choose>
                    </button>
                </form>
                <a class="button delete" href="${pageContext.request.contextPath}/rooms/${r.id}/delete" onclick="return confirm('Xóa phòng này?');">Xóa</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>

