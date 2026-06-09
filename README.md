# 🖨️ 打印机故障排查知识库

![Platform](https://img.shields.io/badge/Platform-Windows-blue)
![Topic](https://img.shields.io/badge/Topic-Printer%20Troubleshooting-green)
![Version](https://img.shields.io/badge/Version-v1.4.0-success)

> 一个面向办公室和企业环境的中文打印机故障排查知识库，涵盖 Windows 打印队列、Print Spooler、打印缓存清理、WSD 与 TCP/IP 端口、网络打印机固定 IP、IP 变化、Ping 网络检测、打印机脱机、驱动安装重装、打印乱码和企业部署建议。

---

## 📌 当前版本

```text
v1.4.0 - 新增打印机驱动安装、重装与打印乱码排查指南
```

本版本在 v1.3.0 的脱机、IP 变化和 Ping 网络检测专题基础上，继续扩展打印机驱动与输出异常相关内容：

- 打印机驱动安装、卸载与重装流程
- 官方驱动、通用驱动、Windows 自动驱动的区别
- PCL、PS、UFR、XPS 驱动语言的基础说明
- 打印乱码、字体异常、PDF 打印错乱的排查方法
- Windows 测试页正常但软件打印异常的判断思路
- 企业环境统一驱动版本和端口配置建议

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

### 网络检测与脱机排查

| 文档 | 说明 |
|---|---|
| [打印机脱机状态排查指南](docs/printer/printer-offline-troubleshooting.md) | 处理打印机显示脱机、状态异常、网络不通、端口错误和 Windows 误判脱机等问题。 |
| [打印机 IP 变化导致无法打印排查指南](docs/printer/printer-ip-changed.md) | 说明打印机 IP 变化原因、旧端口失效判断方法、端口 IP 修改和 DHCP 保留建议。 |
| [Ping 网络检测与打印机连通性排查指南](docs/printer/printer-ping-network-check.md) | 使用 Ping、ipconfig、连续 Ping 和浏览器访问打印机后台来判断网络连通性。 |

### 驱动与输出异常

| 文档 | 说明 |
|---|---|
| [打印机驱动安装、卸载与重装指南](docs/printer/printer-driver-install-reinstall-guide.md) | 说明打印机驱动安装、干净重装、官方驱动与通用驱动区别、PCL / PS 驱动选择和企业统一驱动建议。 |
| [打印乱码、格式错乱与输出异常排查指南](docs/printer/printer-garbled-output-troubleshooting.md) | 处理打印乱码、中文方框、PDF 打印错位、字体缺失、表格错乱、偶发输出异常等问题。 |

---

## 🚀 快速处理流程

当用户反馈“打印不了”时，可以先按下面顺序判断：

```text
确认打印机开机
    ↓
检查是否显示脱机
    ↓
检查打印队列是否卡住
    ↓
重启 Print Spooler，必要时清空缓存
    ↓
确认端口类型：WSD / TCP/IP
    ↓
Ping 打印机 IP
    ↓
检查打印机 IP 是否变化
    ↓
打印 Windows 测试页
    ↓
测试页正常但软件异常：检查驱动 / 软件 / 文件 / 字体
    ↓
测试页异常：检查驱动 / 端口 / 打印机本体
    ↓
必要时重装官方驱动
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

### 2. 网络不通类问题

优先查看：

```text
打印机 IP
Ping 测试
网线 / Wi-Fi
同网段情况
```

### 3. 端口不稳定类问题

优先查看：

```text
当前是否使用 WSD
是否已切换 TCP/IP
TCP/IP 端口 IP 是否正确
```

### 4. 驱动与乱码类问题

优先查看：

```text
Windows 测试页
官方驱动 / 通用驱动
PCL / PS 驱动语言
PDF 是否需要作为图像打印
字体是否缺失或未嵌入
```

### 5. 企业部署类问题

优先采用：

```text
DHCP 保留
Standard TCP/IP Port
官方驱动
统一设备登记表
统一驱动版本
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
│       ├── printer-ping-network-check.md
│       ├── printer-driver-install-reinstall-guide.md
│       └── printer-garbled-output-troubleshooting.md
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
v1.5.0 - 新增共享打印机、企业部署规范和故障速查总表
v1.6.0 - 新增打印机扫描功能、纸盒/双面打印和耗材问题排查指南
v2.0.0 - 整理为更完整的办公室打印机运维知识库
```

---

## 📚 关键词

```text
Printer Troubleshooting
Printer Driver
Garbled Print
Print Spooler
Printer Queue
WSD Port
TCP/IP Port
Static IP
DHCP Reservation
Network Printer
HP Printer
Windows Printer
IT Support
Helpdesk
```
