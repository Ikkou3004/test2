<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Thêm phòng</title>
    <style>
        label { display:block; margin-top:10px; }
        input, select, textarea { width: 300px; padding:6px; }
        .error { color:#d32f2f; }
        .actions { margin-top: 12px; }
        button, a.button { padding: 6px 12px; background:#1976d2; color:#fff; border:none; border-radius:4px; text-decoration:none; }
        a.button { background:#616161; }
    </style>
</head>
<body>
<h1><c:choose><c:when test="${room.id != null}">Sửa phòng</c:when><c:otherwise>Thêm phòng</c:otherwise></c:choose></h1>
<form method="post" action="${pageContext.request.contextPath}/rooms<c:if test='${room.id != null}'>/${room.id}/update</c:if>">
    <label>Số phòng *</label>
    <input type="text" name="soPhong" value="${room.soPhong}" required />

    <label>Giá phòng (VND) *</label>
    <input type="number" name="giaPhong" step="0.01" min="0.01" value="${room.giaPhong}" required />

    <label>Diện tích (m²) *</label>
    <input type="number" name="dienTich" step="0.01" min="0.01" value="${room.dienTich}" required />

    <label>Trạng thái</label>
    <select name="trangThai">
        <c:forEach items="${statuses}" var="s">
            <c:set var="selected" value=""/>
            <c:if test="${room.trangThai == s}"><c:set var="selected" value="selected"/></c:if>
            <option value="${s}" ${selected}>${s}</option>
        </c:forEach>
    </select>

    <label>Ghi chú</label>
    <textarea name="ghiChu" rows="3">${room.ghiChu}</textarea>

    <div class="actions">
        <button type="submit">Lưu</button>
        <a class="button" href="${pageContext.request.contextPath}/rooms">Hủy</a>
    </div>
</form>
</body>
</html>

