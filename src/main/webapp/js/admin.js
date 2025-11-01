// 后台管理功能
class AdminManager {
    constructor() {
        this.init();
    }

    init() {
        this.bindEvents();
        this.initCharts();
    }

    bindEvents() {
        // 侧边栏切换
        const sidebarToggle = document.querySelector('.sidebar-toggle');
        if (sidebarToggle) {
            sidebarToggle.addEventListener('click', this.toggleSidebar.bind(this));
        }

        // 表格操作
        this.initTableActions();

        // 评论操作
        this.initCommentActions();
    }

    toggleSidebar() {
        const sidebar = document.querySelector('.admin-sidebar');
        sidebar.classList.toggle('show');
    }

    initTableActions() {
        // 编辑按钮
        document.querySelectorAll('.btn-outline').forEach(btn => {
            btn.addEventListener('click', function() {
                const row = this.closest('tr');
                const title = row.cells[0].textContent;
                alert(`编辑文章: ${title}`);
            });
        });

        // 删除按钮
        document.querySelectorAll('.btn-danger').forEach(btn => {
            btn.addEventListener('click', function() {
                const row = this.closest('tr');
                const title = row.cells[0].textContent;

                if (confirm(`确定要删除文章 "${title}" 吗？`)) {
                    row.style.opacity = '0.5';
                    setTimeout(() => {
                        row.remove();
                        BlogUtils.showMessage('删除成功', 'success');
                    }, 300);
                }
            });
        });
    }

    initCommentActions() {
        // 通过评论
        document.querySelectorAll('.comments-list .btn-outline').forEach(btn => {
            btn.addEventListener('click', function() {
                const commentItem = this.closest('.comment-item');
                commentItem.style.background = '#e8f5e8';
                BlogUtils.showMessage('评论已通过', 'success');
            });
        });

        // 删除评论
        document.querySelectorAll('.comments-list .btn-danger').forEach(btn => {
            btn.addEventListener('click', function() {
                const commentItem = this.closest('.comment-item');

                if (confirm('确定要删除这条评论吗？')) {
                    commentItem.style.opacity = '0.5';
                    setTimeout(() => {
                        commentItem.remove();
                        BlogUtils.showMessage('评论已删除', 'success');
                    }, 300);
                }
            });
        });
    }

    initCharts() {
        // 简单的统计图表（可以使用 Chart.js 等库）
        // 这里只是示例，实际项目中可以集成完整的图表库
        console.log('初始化图表...');
    }
}

// 页面加载完成后初始化
document.addEventListener('DOMContentLoaded', function() {
    if (document.querySelector('.admin-layout')) {
        new AdminManager();
    }
});