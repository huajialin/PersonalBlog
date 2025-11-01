// 登录表单验证
document.addEventListener('DOMContentLoaded', function() {
    const loginForm = document.querySelector('.login-form');

    if (loginForm) {
        loginForm.addEventListener('submit', function(e) {
            const username = document.getElementById('username').value.trim();
            const password = document.getElementById('password').value.trim();
            let isValid = true;

            // 清除之前的错误提示
            clearErrors();

            // 验证用户名
            if (username === '') {
                showError('username', '用户名不能为空');
                isValid = false;
            } else if (username.length < 3) {
                showError('username', '用户名至少3个字符');
                isValid = false;
            }

            // 验证密码
            if (password === '') {
                showError('password', '密码不能为空');
                isValid = false;
            } else if (password.length < 6) {
                showError('password', '密码至少6个字符');
                isValid = false;
            }

            if (!isValid) {
                e.preventDefault();
            }
        });

        function showError(fieldId, message) {
            const field = document.getElementById(fieldId);
            const formGroup = field.closest('.form-group');

            // 添加错误样式
            field.style.borderColor = '#e74c3c';

            // 创建错误消息
            const errorDiv = document.createElement('div');
            errorDiv.className = 'error-message';
            errorDiv.style.cssText = 'color: #e74c3c; font-size: 0.8rem; margin-top: 0.25rem;';
            errorDiv.textContent = message;

            formGroup.appendChild(errorDiv);
        }

        function clearErrors() {
            // 清除错误样式
            document.querySelectorAll('.form-control').forEach(field => {
                field.style.borderColor = '';
            });

            // 移除错误消息
            document.querySelectorAll('.error-message').forEach(error => {
                error.remove();
            });
        }

        // 实时验证
        document.getElementById('username').addEventListener('blur', validateUsername);
        document.getElementById('password').addEventListener('blur', validatePassword);

        function validateUsername() {
            const username = document.getElementById('username').value.trim();
            clearFieldError('username');

            if (username === '') {
                showError('username', '用户名不能为空');
                return false;
            } else if (username.length < 3) {
                showError('username', '用户名至少3个字符');
                return false;
            }
            return true;
        }

        function validatePassword() {
            const password = document.getElementById('password').value.trim();
            clearFieldError('password');

            if (password === '') {
                showError('password', '密码不能为空');
                return false;
            } else if (password.length < 6) {
                showError('password', '密码至少6个字符');
                return false;
            }
            return true;
        }

        function clearFieldError(fieldId) {
            const field = document.getElementById(fieldId);
            const formGroup = field.closest('.form-group');
            field.style.borderColor = '';

            const errorMsg = formGroup.querySelector('.error-message');
            if (errorMsg) {
                errorMsg.remove();
            }
        }
    }
});