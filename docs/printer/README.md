# 打印机故障排查专题

本目录用于收集 Windows 与企业办公环境中常见的打印机故障排查文档。

## 文档列表

| 文档 | 说明 |
|---|---|
| [HP 网络打印机故障排查与 TCP/IP 端口优化指南](hp-network-printer-troubleshooting.md) | 基于真实 HP 网络打印机案例，记录 Print Spooler 修复、WSD 转 TCP/IP 端口优化和企业部署建议。 |
| [打印队列卡住、Print Spooler 与清空缓存指南](printer-queue-spooler-cache-guide.md) | 处理打印任务卡住、任务无法删除、Print Spooler 异常和 Windows 打印缓存清理问题。 |
| [WSD 与 TCP/IP 打印端口专题](wsd-vs-tcpip-port.md) | 说明 WSD 与 Standard TCP/IP Port 的区别、适用场景、常见故障，以及企业环境为什么更推荐 TCP/IP 端口。 |
| [网络打印机固定 IP 与 DHCP 保留配置建议](printer-static-ip-guide.md) | 说明固定 IP、DHCP 保留、IP 冲突、IP 变化后的处理流程，以及企业打印机信息登记建议。 |
| [打印机脱机状态排查指南](printer-offline-troubleshooting.md) | 处理打印机显示脱机、状态异常、网络不通、端口错误和 Windows 误判脱机等问题。 |
| [打印机 IP 变化导致无法打印排查指南](printer-ip-changed.md) | 说明打印机 IP 变化原因、旧端口失效的判断方法、端口 IP 修改和 DHCP 保留建议。 |
| [Ping 网络检测与打印机连通性排查指南](printer-ping-network-check.md) | 使用 Ping、ipconfig、连续 Ping 和浏览器访问打印机后台来判断网络连通性。 |
| [打印机驱动安装、卸载与重装指南](printer-driver-install-reinstall-guide.md) | 说明驱动安装、驱动包删除、干净重装、PCL / PS 驱动选择和企业统一驱动建议。 |
| [打印乱码、格式错乱与输出异常排查指南](printer-garbled-output-troubleshooting.md) | 处理打印乱码、中文方框、PDF 打印错位、字体缺失、表格错乱和偶发输出异常等问题。 |
| [共享打印机故障排查指南](shared-printer-troubleshooting.md) | 处理共享打印机无法连接、访问被拒绝、共享主机不可用、客户端驱动异常和防火墙阻止等问题。 |
| [企业打印机部署规范与最佳实践](printer-enterprise-deployment-standard.md) | 说明企业环境中的打印机命名、固定 IP / DHCP 保留、TCP/IP 端口、官方驱动、设备登记和变更记录建议。 |
| [打印机常见故障速查总表](printer-common-errors-quick-reference.md) | 汇总打印队列、脱机、IP 变化、Ping、端口、驱动、乱码和共享打印机等常见故障的快速判断方法。 |

## 推荐排查顺序

```text
打印机是否开机
↓
是否显示脱机
↓
是否勾选“脱机使用打印机”
↓
打印队列是否卡住
↓
Print Spooler 是否正常
↓
是否需要清空缓存
↓
端口是否正确：WSD 还是 TCP/IP
↓
Ping 打印机 IP 是否成功
↓
打印机 IP 是否变化
↓
是否需要固定 IP 或 DHCP 保留
↓
Windows 测试页是否正常
↓
驱动是否异常
↓
是否存在乱码、字体或 PDF 渲染问题
↓
是否为共享打印机问题
↓
是否需要按企业部署规范统一配置
```

## 常用命令

```cmd
ping 打印机IP
ping 打印机IP -t
ipconfig
ipconfig /all
net stop spooler
net start spooler
del /Q /F %systemroot%\System32\spool\PRINTERS\*.*
```

## 常见判断逻辑

```text
测试页正常，但某个软件不能打印
    ↓
优先检查软件设置、文件内容、字体和 PDF 渲染方式

测试页乱码或格式错乱
    ↓
优先检查驱动类型、驱动语言和打印机本体

所有电脑连接同一台打印机都乱码
    ↓
优先检查打印机本体、固件、内存或耗材

只有一台电脑异常
    ↓
优先检查该电脑的驱动、端口、队列和软件设置

共享打印机所有客户端异常
    ↓
优先检查共享主机是否开机、主机能否打印、共享权限和防火墙
```

## 推荐企业部署方案

```text
打印机固定 IP / DHCP 保留
        ↓
Standard TCP/IP Port
        ↓
官方驱动 / 统一测试过的通用驱动
        ↓
所有电脑统一连接
        ↓
建立打印机设备登记表
        ↓
记录驱动版本和安装包路径
        ↓
建立故障速查总表和变更记录
```
