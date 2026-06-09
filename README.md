# 🖨️ 打印机故障排查知识库

![Platform](https://img.shields.io/badge/Platform-Windows-blue)
![Topic](https://img.shields.io/badge/Topic-Printer%20Troubleshooting-green)
![Version](https://img.shields.io/badge/Version-v1.3.0-success)

> 一个面向办公室和企业环境的中文打印机故障排查知识库，涵盖 Windows 打印队列、Print Spooler、打印缓存清理、WSD 与 TCP/IP 端口、网络打印机固定 IP、DHCP 保留、打印机脱机、IP 变化、Ping 网络检测和企业部署建议。

---

## 📌 当前版本

```text
v1.3.0 - 新增打印机脱机、IP 变化、Ping 网络检测排查指南
```

本版本在 v1.2.0 的 WSD / TCP-IP 端口与固定 IP 配置基础上，继续扩展网络打印机常见故障排查：

- 打印机显示脱机的原因与处理流程
- 如何取消“脱机使用打印机”
- 如何判断打印机是否真的在线
- 打印机 IP 变化导致无法打印的排查方法
- 如何查看、修改或重新添加 TCP/IP 端口 IP
- 如何使用 Ping 判断网络连通性
- Ping 通但无法打印、Ping 不通的不同处理方向
- 常用网络检测命令速查

---

## 📚 文档导航

### 真实案例

| 文档 | 说明 |
|---|---|
| [HP 网络打印机故障排查与 TCP/IP 端口优化指南](docs/printer/hp-network-printer-troubleshooting.md) | 基于 HP LaserJet Professional M1216nfh MFP 的真实故障处理记录，包含 Print Spooler 修复、WSD 转 TCP/IP 端口和企业部署建议。 |

### 打印队列与系统服务

| 文档 | 说明 |
|---|---|
| [打印队列卡住、Print Spooler 与清空缓存指南](docs/printer/printer-queue-spooler-cache-guide.md) | 系统说明打印任务卡住的现象、原因、排查流程、Print Spooler 重启方法，以及手动清空 spool 打印缓存的完整步骤。 |

### 网络端口与 IP 配置

| 文档 | 说明 |
|---|---|
| [WSD 与 TCP/IP 打印端口专题](docs/printer/wsd-vs-tcpip-port.md) | 说明 WSD 与 Standard TCP/IP Port 的区别、适用场景、常见问题和企业环境推荐配置。 |
| [网络打印机固定 IP 与 DHCP 保留配置建议](docs/printer/printer-static-ip-guide.md) | 说明打印机固定 IP、DHCP 保留、IP 冲突、IP 变化后的处理流程和企业设备登记建议。 |
| [打印机脱机状态排查指南](docs/printer/printer-offline-troubleshooting.md) | 处理打印机显示脱机、Windows 状态异常、端口错误、队列异常和网络不通等问题。 |
| [打印机 IP 变化导致无法打印排查指南](docs/printer/printer-ip-changed.md) | 说明打印机 IP 变化的原因、判断方法、端口修改方法和 DHCP 保留建议。 |
| [Ping 网络检测与打印机连通性排查指南](docs/printer/printer-ping-network-check.md) | 使用 Ping、ipconfig、连续 Ping 和浏览器访问后台等方法判断网络打印机连通性。 |

---

## 🚀 快速处理流程

当用户反馈“打印不了”时，可以先按下面顺序判断：

```text
确认打印机开机
    ↓
检查打印机是否显示脱机
    ↓
检查打印队列是否卡住
    ↓
尝试取消异常任务
    ↓
重启 Print Spooler
    ↓
必要时清空 spool 打印缓存
    ↓
确认端口类型：WSD / TCP/IP
    ↓
Ping 打印机 IP
    ↓
检查打印机 IP 是否变化
    ↓
必要时改用 TCP/IP 端口并设置固定 IP
    ↓
重新打印测试页
```

---

## 🧭 推荐排查思路

### 1. 任务卡住类问题

优先查看：

```text
打印队列
Print Spooler
spool 缓存目录
```

### 2. 脱机状态类问题

优先查看：

```text
是否勾选“脱机使用打印机”
打印机是否开机/休眠
端口 IP 是否正确
Ping 是否成功
```

### 3. 网络不通类问题

优先查看：

```text
打印机 IP
Ping 测试
电脑 IP 网段
网线 / Wi-Fi
路由器 / DHCP 分配
```

### 4. 端口不稳定类问题

优先查看：

```text
当前是否使用 WSD
是否已切换 TCP/IP
TCP/IP 端口 IP 是否正确
打印机 IP 是否发生变化
```

### 5. 企业部署类问题

优先采用：

```text
DHCP 保留
Standard TCP/IP Port
官方驱动
统一设备登记表
```

---

## 🗂️ 目录结构

```text
printer-troubleshooting-knowledge-base/
├── README.md
├── CHANGELOG.md
├── docs/
│   └── printer/
│       ├── README.md
│       ├── hp-network-printer-troubleshooting.md
│       ├── printer-queue-spooler-cache-guide.md
│       ├── wsd-vs-tcpip-port.md
│       ├── printer-static-ip-guide.md
│       ├── printer-offline-troubleshooting.md
│       ├── printer-ip-changed.md
│       └── printer-ping-network-check.md
├── images/
│   └── printer/
└── scripts/
    └── windows/
        └── clear-printer-queue.bat
```

---

## 🛠️ 脚本工具

| 脚本 | 说明 |
|---|---|
| [clear-printer-queue.bat](scripts/windows/clear-printer-queue.bat) | 停止 Print Spooler、清空 Windows 打印缓存、重新启动 Print Spooler。 |

---

## 📝 后续扩展方向

计划继续补充：

```text
v1.4.0 - 新增打印机驱动安装、重装与打印乱码排查指南
v1.5.0 - 新增共享打印机、企业部署规范和故障速查总表
```

---

## 📚 关键词

```text
Printer Troubleshooting
Print Spooler
Printer Queue
Printer Offline
WSD Port
TCP/IP Port
Static IP
DHCP Reservation
Ping
Network Printer
HP Printer
Windows Printer
IT Support
Helpdesk
```
