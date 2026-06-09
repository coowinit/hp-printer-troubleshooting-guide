# 打印机故障排查专题

本目录用于收集 Windows 与企业办公环境中常见的打印机故障排查文档。

## 文档列表

| 文档 | 说明 |
|---|---|
| [HP 网络打印机故障排查与 TCP/IP 端口优化指南](hp-network-printer-troubleshooting.md) | 基于真实 HP 网络打印机案例，记录 Print Spooler 修复、WSD 转 TCP/IP 端口优化和企业部署建议。 |
| [打印队列卡住、Print Spooler 与清空缓存指南](printer-queue-spooler-cache-guide.md) | 处理打印任务卡住、任务无法删除、Print Spooler 异常和 Windows 打印缓存清理问题。 |
| [WSD 与 TCP/IP 打印端口专题](wsd-vs-tcpip-port.md) | 说明 WSD 与 Standard TCP/IP Port 的区别、适用场景、常见故障，以及企业环境为什么更推荐 TCP/IP 端口。 |
| [网络打印机固定 IP 与 DHCP 保留配置建议](printer-static-ip-guide.md) | 说明固定 IP、DHCP 保留、IP 冲突、IP 变化后的处理流程，以及企业打印机信息登记建议。 |

## 推荐排查顺序

```text
打印机是否开机
↓
打印队列是否卡住
↓
Print Spooler 是否正常
↓
是否需要清空缓存
↓
端口是否正确：WSD 还是 TCP/IP
↓
打印机 IP 是否变化
↓
是否需要固定 IP 或 DHCP 保留
↓
驱动是否异常
```

## 推荐企业部署方案

```text
打印机固定 IP / DHCP 保留
        ↓
Standard TCP/IP Port
        ↓
官方驱动
        ↓
所有电脑统一连接
        ↓
建立打印机设备登记表
```
