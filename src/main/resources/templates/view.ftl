<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Info</title>
</head>
<body>
<h1>User info</h1>
<table>
    <tr>
        <td>User Name</td>
        <td>${user.username}</td>
    </tr>
    <tr>
        <td>Status</td>
        <td>${user.active?string('active','InActive')}</td>
    </tr>
    <tr>zz
        <td>First Name</td>
        <td>${user.firstname}</td>
    </tr>
    <tr>
        <td>Last Name</td>
        <td>${user.lastname}</td>
    </tr>
    <tr>
        <td>Role</td>
        <td>${user.role}</td>
    </tr>
    <tr>
        <td>Creat Date</td>
        <td>${user.creatdat}</td>
    </tr>
</table>

<br>
<a href="/user">Back</a>
</body>
</html>