// 通用工具函数
class BlogUtils {
    // 格式化日期
    static formatDate(dateString) {
        const date = new Date(dateString);
        const now = new Date();
        const diff = now - date;

        // 一分钟内
        if (diff < 60000) {
            return '刚刚';
        }

        // 一小时内
        if (diff < 3600000) {
            return Math.floor(diff / 60000) + '分钟前';
        }

        // 一天内
        if (diff < 86400000) {
            return Math.floor(diff / 3600000) + '小时前';
        }

        // 一周内
        if (diff < 604800000) {
            return Math.floor(diff / 86400000) + '天前';
        }

        // 返回完整日期
        return date.toLocaleDateString('zh-CN', {
            year: 'numeric',
            month: '2-digit',
            day: '2-digit'
        });
    }

    // 防抖函数
    static debounce(func, wait) {
        let timeout;
        return function executedFunction(...args) {
            const later = () => {
                clearTimeout(timeout);
                func(...args);
            };
            clearTimeout(timeout);
            timeout = setTimeout(later, wait);
        };
    }

    // 节流函数
    static throttle(func, limit) {
        let inThrottle;
        return function(...args) {
            if (!inThrottle) {
                func.apply(this, args);
                inThrottle = true;
                setTimeout(() => inThrottle = false, limit);
            }
        };
    }

    // AJAX请求
    static ajax(url, options = {}) {
        return new Promise((resolve, reject) => {
            const xhr = new XMLHttpRequest();
            xhr.open(options.method || 'GET', url);
            xhr.setRequestHeader('Content-Type', 'application/json');

            xhr.onload = function() {
                if (xhr.status >= 200 && xhr.status < 300) {
                    try {
                        const data = JSON.parse(xhr.responseText);
                        resolve(data);
                    } catch (e) {
                        resolve(xhr.responseText);
                    }
                } else {
                    reject(new Error(xhr.statusText));
                }
            };

            xhr.onerror = function() {
                reject(new Error('Network error'));
            };

            xhr.send(JSON.stringify(options.body));
        });
    }

    // 显示消息提示
    static showMessage(message, type = 'info') {
        const messageDiv = document.createElement('div');
        messageDiv.className = `message message-${type}`;
        messageDiv.textContent = message;

        // 添加样式
        Object.assign(messageDiv.style, {
            position: 'fixed',
            top: '20px',
            right: '20px',
            padding: '12px 20px',
            borderRadius: '4px',
            color: 'white',
            zIndex: '10000',
            fontSize: '14px',
            fontWeight: '500',
            boxShadow: '0 4px 12px rgba(0,0,0,0.15)',
            transition: 'all 0.3s ease'
        });

        switch (type) {
            case 'success':
                messageDiv.style.background = '#28a745';
                break;
            case 'error':
                messageDiv.style.background = '#dc3545';
                break;
            case 'warning':
                messageDiv.style.background = '#ffc107';
                messageDiv.style.color = '#212529';
                break;
            default:
                messageDiv.style.background = '#17a2b8';
        }

        document.body.appendChild(messageDiv);

        // 3秒后自动消失
        setTimeout(() => {
            messageDiv.style.opacity = '0';
            messageDiv.style.transform = 'translateX(100%)';
            setTimeout(() => {
                if (messageDiv.parentNode) {
                    messageDiv.parentNode.removeChild(messageDiv);
                }
            }, 300);
        }, 3000);
    }
}

// 页面加载完成后执行
document.addEventListener('DOMContentLoaded', function() {
    // 格式化所有日期元素
    document.querySelectorAll('[data-date]').forEach(element => {
        const formatted = BlogUtils.formatDate(element.getAttribute('data-date'));
        element.textContent = formatted;
    });

    // 搜索功能
    const searchForm = document.getElementById('search-form');
    if (searchForm) {
        searchForm.addEventListener('submit', function(e) {
            e.preventDefault();
            const query = this.querySelector('input[name="q"]').value.trim();
            if (query) {
                window.location.href = `/search?q=${encodeURIComponent(query)}`;
            }
        });
    }

    // 回到顶部按钮
    const backToTop = document.createElement('button');
    backToTop.innerHTML = '↑';
    backToTop.className = 'back-to-top';
    Object.assign(backToTop.style, {
        position: 'fixed',
        bottom: '30px',
        right: '30px',
        width: '50px',
        height: '50px',
        borderRadius: '50%',
        background: '#007bff',
        color: 'white',
        border: 'none',
        cursor: 'pointer',
        fontSize: '18px',
        boxShadow: '0 2px 10px rgba(0,0,0,0.2)',
        opacity: '0',
        transition: 'all 0.3s ease',
        zIndex: '999'
    });

    document.body.appendChild(backToTop);

    window.addEventListener('scroll', BlogUtils.throttle(function() {
        if (window.pageYOffset > 300) {
            backToTop.style.opacity = '1';
        } else {
            backToTop.style.opacity = '0';
        }
    }, 100));

    backToTop.addEventListener('click', function() {
        window.scrollTo({ top: 0, behavior: 'smooth' });
    });
});