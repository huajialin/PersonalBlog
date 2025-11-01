// 文章页面功能
class ArticleManager {
    constructor() {
        this.init();
    }

    init() {
        this.bindEvents();
        this.initCodeHighlight();
        this.initCommentForm();
    }

    bindEvents() {
        // 点赞功能
        const likeBtn = document.getElementById('like-btn');
        if (likeBtn) {
            likeBtn.addEventListener('click', this.handleLike.bind(this));
        }

        // 收藏功能
        const favoriteBtn = document.getElementById('favorite-btn');
        if (favoriteBtn) {
            favoriteBtn.addEventListener('click', this.handleFavorite.bind(this));
        }

        // 评论回复
        document.querySelectorAll('.reply-btn').forEach(btn => {
            btn.addEventListener('click', this.handleReply.bind(this));
        });

        // 评论点赞
        document.querySelectorAll('.comment-like').forEach(btn => {
            btn.addEventListener('click', this.handleCommentLike.bind(this));
        });
    }

    initCodeHighlight() {
        // 简单的代码高亮
        document.querySelectorAll('pre code').forEach(block => {
            const lines = block.innerHTML.split('\n');
            const highlighted = lines.map(line => {
                // 简单的关键词高亮
                return line
                    .replace(/\b(function|var|let|const|if|else|for|while|return|class)\b/g,
                        '<span class="keyword">$1</span>')
                    .replace(/\b(\d+)\b/g, '<span class="number">$1</span>')
                    .replace(/(\/\/.*)/g, '<span class="comment">$1</span>');
            }).join('\n');
            block.innerHTML = highlighted;
        });
    }

    initCommentForm() {
        const form = document.getElementById('comment-form');
        if (form) {
            form.addEventListener('submit', this.handleCommentSubmit.bind(this));

            // 实时字符计数
            const textarea = form.querySelector('textarea');
            const counter = document.createElement('div');
            counter.className = 'char-counter';
            counter.style.cssText = 'text-align: right; font-size: 12px; color: #666; margin-top: 5px;';
            form.querySelector('.form-group').appendChild(counter);

            textarea.addEventListener('input', BlogUtils.throttle(() => {
                const count = textarea.value.length;
                counter.textContent = `${count}/1000`;

                if (count > 1000) {
                    counter.style.color = '#dc3545';
                } else if (count > 800) {
                    counter.style.color = '#ffc107';
                } else {
                    counter.style.color = '#666';
                }
            }, 100));
        }
    }

    async handleLike() {
        const articleId = document.getElementById('article-id').value;

        try {
            const response = await BlogUtils.ajax('/api/like', {
                method: 'POST',
                body: { articleId }
            });

            if (response.success) {
                const likeCount = document.querySelector('.like-count');
                likeCount.textContent = response.likeCount;
                BlogUtils.showMessage('点赞成功', 'success');
            }
        } catch (error) {
            BlogUtils.showMessage('点赞失败', 'error');
        }
    }

    async handleFavorite() {
        const articleId = document.getElementById('article-id').value;

        try {
            const response = await BlogUtils.ajax('/api/favorite', {
                method: 'POST',
                body: { articleId }
            });

            if (response.success) {
                const favoriteBtn = document.getElementById('favorite-btn');
                favoriteBtn.innerHTML = response.favorited ?
                    '❤️ 已收藏' : '🤍 收藏';
                BlogUtils.showMessage(
                    response.favorited ? '收藏成功' : '取消收藏',
                    'success'
                );
            }
        } catch (error) {
            BlogUtils.showMessage('操作失败', 'error');
        }
    }

    handleReply(event) {
        const commentId = event.target.dataset.commentId;
        const commentForm = document.getElementById('comment-form');
        const textarea = commentForm.querySelector('textarea');

        // 在评论内容中引用原评论
        const originalComment = event.target.closest('.comment-item')
            .querySelector('.comment-text').textContent;

        textarea.value = `@${event.target.dataset.username} ${originalComment}\n\n`;
        textarea.focus();

        // 添加父评论ID
        const parentInput = document.createElement('input');
        parentInput.type = 'hidden';
        parentInput.name = 'parentId';
        parentInput.value = commentId;
        commentForm.appendChild(parentInput);
    }

    async handleCommentLike(event) {
        const commentId = event.target.dataset.commentId;

        try {
            const response = await BlogUtils.ajax('/api/comment/like', {
                method: 'POST',
                body: { commentId }
            });

            if (response.success) {
                const likeCount = event.target.querySelector('.like-count') ||
                    event.target.closest('.comment-action').querySelector('.like-count');
                likeCount.textContent = response.likeCount;
            }
        } catch (error) {
            BlogUtils.showMessage('操作失败', 'error');
        }
    }

    async handleCommentSubmit(event) {
        event.preventDefault();

        const form = event.target;
        const formData = new FormData(form);
        const submitBtn = form.querySelector('button[type="submit"]');
        const originalText = submitBtn.textContent;

        // 禁用提交按钮
        submitBtn.disabled = true;
        submitBtn.textContent = '提交中...';

        try {
            const response = await fetch(form.action, {
                method: 'POST',
                body: formData
            });

            if (response.ok) {
                BlogUtils.showMessage('评论发布成功', 'success');
                form.reset();

                // 重新加载页面以显示新评论
                setTimeout(() => {
                    window.location.reload();
                }, 1000);
            } else {
                throw new Error('提交失败');
            }
        } catch (error) {
            BlogUtils.showMessage('评论发布失败', 'error');
        } finally {
            submitBtn.disabled = false;
            submitBtn.textContent = originalText;
        }
    }
}

// 页面加载完成后初始化
document.addEventListener('DOMContentLoaded', function() {
    if (document.querySelector('.article-content')) {
        new ArticleManager();
    }
});