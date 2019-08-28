<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create User page</title>
</head>
<body>

<form name="user" action="/new" method="post">
    <p>User Name</p>
    <input title="Name" type="text" name="username">
    <#if nameError??>
        <div class="invalid-feedback">
            ${nameError}
        </div>
    </#if>
    <p>User Password</p>
    <input title="Password" type="text" name="password">
    <#if passwordError??>
        <div class="invalid-feedback">
            ${passwordError}
        </div>
    </#if>
    <p>Status</p>
    <select name="active">
        <option value="0" selected>inActive</option>
        <option value="1">Active</option>
    </select>
    <p>First Name</p>
    <input title="FirstName" type="text" name="firstname">
    <#if firstNameError??>
        <div class="invalid-feedback">
            ${firstNameError}
        </div>
    </#if>
    <p>Last Name</p>
    <input title="LastName" type="text" name="lastname">
    <#if lastNameError??>
        <div class="invalid-feedback">
            ${lastNameError}
        </div>
    </#if>
    <p>Role</p>
    <select name="role">
        <option value="USER" selected>USER</option>
        <option value="ADMIN">ADMIN</option>
    </select>

    <input type="submit" value="OK">
</form>

</body>
</html>