<#import "parts/pager.ftl" as p>
<@p.pager url page />
<!DOCTYPE html>
<html lang="en">
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <meta charset="UTF-8">
    <title>Users</title>
</head>
<body>
<div class="form-group" >
    <h1>Search to Users list</h1>
    <input type="text" class="form-control pull-right" id="search" placeholder="Search" >
</div>
<h1>Users list</h1>
<table class="table table-striped" id="mytable" cellspacing="0" style="width: 60%;">
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Active</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Role</th>
        <th>Creat Data</th>
    </tr>
<#list page.content as user>
    <tr>
        <td><a href="/user/${user.id}">${user.id}</a></td>
        <td>${user.username}</td>
        <td>${user.active?string('active','InActive')}</td>
        <td>${user.firstname}</td>
        <td>${user.lastname}</td>
        <td>${user.role}</td>
        <td>${user.creatdat}</td>
        <td><a href="/delete/${user.id}">Delete</a></td>
        <td><a href="/${user.id}/edit">Update</a></td>
    </tr>
</#list>
</table>
<@p.pager url page />
<a href="/new">Create user</a>
<script>
    $(document).ready(function(){
        $("#search").keyup(function(){
            _this = this;
            $.each($("#mytable tr"), function() {
                if($(this).text().toLowerCase().indexOf($(_this).val().toLowerCase()) === -1)
                    $(this).hide();
                else
                    $(this).show();
            });
        });
    });
</script>
<script type="text/javascript">
    var pager = new Imtech.Pager();
    $(document).ready(function() {
        pager.paragraphsPerPage = 1; // Устанавливаем количество элементов на странице
        pager.pagingContainer = $('#mytable tr'); // Устанавливаем основной контейнер
        pager.paragraphs = $('p', pager.pagingContainer); // Подсчитываемые элементы
        pager.showPage(1); // Начинаем просмотр с первой страницы
    });
</script>
</body>
</html>