// 表单提交前验证
$(function() {
    $("#loginForm").submit(function() {
        let isValidate = true;
        const username = $("#username").val().trim();
        const password = $("#password").val().trim();

        // 1. 用户名验证：非空 + 3-12位
        if (username === "") {
            $("#usernameError").text("用户名不能为空").show();
            isValidate = false;
        } else if (username.length < 3 || username.length > 12) {
            $("#usernameError").text("用户名长度需为3-12位").show();
            isValidate = false;
        } else {
            $("#usernameError").hide();
        }

        // 2. 密码验证：非空 + 长度≥6位
        if (password === "") {
            $("#passwordError").text("密码不能为空").show();
            isValidate = false;
        } else if (password.length < 6) {
            $("#passwordError").text("密码长度需≥6位").show();
            isValidate = false;
        } else {
            $("#passwordError").hide();
        }

        return isValidate; // 验证通过则提交表单，否则不提交
    });

    // 输入框聚焦时隐藏错误提示
    $("#username, #password").focus(function() {
        $(this).next(".error-message").hide();
    });
});