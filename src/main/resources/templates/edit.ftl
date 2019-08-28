<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update user page</title>
</head>
<body>

<form name="user" action="/${user.id}/edit" method="post">
    <p>User Name</p>
    <input title="Name" type="text" name="username" value="${user.username}">
    <#if usNameError??>
        <div class="invalid-feedback">
            ${usNameError}
        </div>
    </#if>
    <p>Status</p>
    <select name="active">
        <option value="0" ${(!user.active)?string('selected','')}>inActive</option>
        <option value="1" ${(user.active)?string('selected','')}>Active</option>
    </select>
    <p>First Name</p>
    <input title="FirstName" type="text" name="firstname" value="${user.firstname}">
    <#if firstNameError??>
        <div class="invalid-feedback">
            ${firstNameError}
        </div>
    </#if>
    <p>Last Name</p>
    <input title="LastName" type="text" name="lastname" value="${user.lastname}">
    <#if lastNameError??>
        <div class="invalid-feedback">
            ${lastNameError}
        </div>
    </#if>
    <p>Role</p>
    <select name="role">
        <option value="USER" ${(user.role == "USER")?string('selected','')}>USER</option>
        <option value="ADMIN" ${(user.role == "ADMIN")?string('selected','')}>ADMIN</option>
    </select>
    <input type="submit" value="OK">
</form>

</body>
</html>