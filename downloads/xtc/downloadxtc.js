
        // 模拟从服务器获取的文件列表数据
        const files = [
            { name: '【解决非法降级和非法安装】xtcmodule.zip', url: '/download_files/【解决非法降级和非法安装】xtcmodule.zip', description: '暂无描述。' },
            { name: '【微信小程序】com.tencent.weapp.wear.APK', url: '/download_files/【微信小程序】com.tencent.weapp.wear.APK', description: '暂无描述。' },
            { name: '【我就有QFIL】QPST.rar', url: '/download_files/【我就有QFIL】QPST.rar', description: '暂无描述。' },
            { name: '【需解压】CaremeOS可用的EDXP框架.zip', url: '/download_files/【需解压】CaremeOS可用的EDXP框架.zip', description: '暂无描述。' },
            { name: '【需解压】skyui-1.9-Z7-release（务必先解压查看使用说明）.zip', url: '/download_files/【需解压】skyui-1.9-Z7-release（务必先解压查看使用说明）.zip', description: '暂无描述。' },
            { name: '【需解压】强力监测-8.5.6(检测手表运行状态,强力推荐).zip', url: '/download_files/【需解压】强力监测-8.5.6(检测手表运行状态,强力推荐).zip', description: '暂无描述。' },
            { name: 'adb移除所有Magisk模块.bat', url: '/download_files/adb移除所有Magisk模块.bat', description: '暂无描述。' },
            { name: 'ANA OS2-1.6-Z7 200.zip', url: '/download_files/ANA OS2-1.6-Z7 200.zip', description: '暂无描述。' },
            { name: 'ANA OS附属模块2-Z7.zip', url: '/download_files/ANA OS附属模块2-Z7.zip', description: '暂无描述。' },
            { name: 'CaremeOSPro_1.1_release.zip', url: '/download_files/CaremeOSPro_1.1_release.zip', description: '暂无描述。' },
            { name: 'fdac22ba-delta修改自动响应.APK', url: '/download_files/fdac22ba-delta修改自动响应.APK', description: '暂无描述。' },
            { name: 'HarmonyOS Sans字体模块 .zip', url: '/download_files/HarmonyOS Sans字体模块 .zip', description: '暂无描述。' },
            { name: 'Magisk Delta 25210_f470988f.Apk', url: '/download_files/Magisk Delta 25210_f470988f.Apk', description: '暂无描述。' },
            { name: 'Magisk卡刷包(低版本当模块刷).zip', url: '/download_files/Magisk卡刷包(低版本当模块刷).zip', description: '暂无描述。' },
            { name: 'prog_emmc_firehose_8937_ddr_hisen.mbn', url: '/download_files/prog_emmc_firehose_8937_ddr_hisen.mbn', description: '暂无描述。' },
            //{ name: '', url: '/download_files/', description: '暂无描述。' },
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
