
        // 模拟从服务器获取的文件列表数据
        const files = [
            { name: '【解决非法降级和非法安装】xtcmodule.zip', url: '/download_files/【解决非法降级和非法安装】xtcmodule.zip', description: '暂无描述。' },
            { name: '文件2', url: 'https://example.com/file2', description: '暂无描述。' },
            { name: '文件3', url: 'https://example.com/file3', description: '暂无描述。' },
        ];

        // 获取文件列表的DOM元素
        const fileList = document.getElementById('file-list');
        const fileDescription = document.getElementById('file-description');

        // 遍历文件列表数据，创建并添加列表项
        files.forEach(file => {
            const listItem = document.createElement('li');
            listItem.textContent = file.name;
            listItem.addEventListener('click', () => {
                fileDescription.textContent = file.description;
                const downloadButton = document.createElement('a');
                downloadButton.href = file.url;
                downloadButton.textContent = '下载';
                downloadButton.style.marginLeft = '1rem';
                fileDescription.appendChild(downloadButton);
            });
            fileList.appendChild(listItem);
        });
