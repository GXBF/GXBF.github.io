// 模拟从服务器获取的文件列表数据
const files = [
    { name: '【解决非法降级和非法安装】xtcmodule.zip', url: '/download_files/【解决非法降级和非法安装】xtcmodule.zip' },
    { name: '文件2', url: 'https://example.com/file2' },
    { name: '文件3', url: 'https://example.com/file3' },
];

// 获取文件列表的DOM元素
const fileList = document.getElementById('file-list');

// 遍历文件列表数据，创建并添加列表项
files.forEach(file => {
    const listItem = document.createElement('li');
    listItem.textContent = file.name;
    listItem.addEventListener('click', () => {
        window.location.href = file.url;
    });
    fileList.appendChild(listItem);
});
