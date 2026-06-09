# 🖨️ 打印机故障排查知识库

![Platform](https://img.shields.io/badge/Platform-Windows-blue)
![Topic](https://img.shields.io/badge/Topic-Printer%20Troubleshooting-green)
![Version](https://img.shields.io/badge/Version-v1.5.0-success)

> 一个面向办公室和企业环境的中文打印机故障排查知识库，涵盖 Windows 打印队列、Print Spooler、打印缓存清理、WSD 与 TCP/IP 端口、网络打印机固定 IP、IP 变化、Ping 网络检测、打印机脱机、驱动安装重装、打印乱码、共享打印机、企业部署规范和故障速查总表。

---

## 📌 当前版本

```text
v1.5.0 - 新增共享打印机、企业部署规范和故障速查总表
```

本版本在 v1.4.0 的驱动安装、重装与打印乱码专题基础上，继续补充企业环境中更常见的共享打印、标准化部署和快速定位能力：

- 共享打印机故障排查流程
- 共享主机、权限、凭据、防火墙和客户端驱动检查方法
- 企业打印机部署规范与最佳实践
- 打印机命名、固定 IP / DHCP 保留、TCP/IP 端口和官方驱动统一建议
- 打印机设备登记表、部署前检查清单和变更记录模板
- 打印机常见故障速查总表，便于 Helpdesk 快速定位问题

---

## 📚 文档导航

### 真实排查案例

| 文档                                                                                | 说明                                                                                                                                                                                                                                          |
| --------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [HP 网络打印机故障排查与 TCP/IP 端口优化指南](docs/printer/hp-network-printer-troubleshooting.md) | 这是一个可长期复用的真实打印机故障排查案例，基于 HP LaserJet Professional M1216nfh MFP 网络打印机的实际处理过程整理。文档完整记录了打印无反应、任务卡在队列、测试页无法打印、Print Spooler 服务异常、WSD 端口不稳定以及切换为 Standard TCP/IP Port 的完整排查与优化流程。后续遇到类似的网络打印机无法打印、队列卡住、端口异常或 IP 配置问题时，可直接参考本案例进行快速判断、逐步排查和标准化处理。 |

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

### 共享打印机与企业部署

| 文档 | 说明 |
|---|---|
| [共享打印机故障排查指南](docs/printer/shared-printer-troubleshooting.md) | 处理共享打印机无法连接、访问被拒绝、共享主机不可用、客户端驱动异常和防火墙阻止等问题。 |
| [企业打印机部署规范与最佳实践](docs/printer/printer-enterprise-deployment-standard.md) | 说明企业环境中打印机命名、固定 IP / DHCP 保留、TCP/IP 端口、官方驱动、设备登记和变更记录建议。 |
| [打印机常见故障速查总表](docs/printer/printer-common-errors-quick-reference.md) | 汇总打印队列、脱机、IP 变化、Ping、端口、驱动、乱码和共享打印机等常见故障的快速判断方法。 |

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
    ↓
如果是共享打印机，检查共享主机 / 权限 / 凭据 / 防火墙
    ↓
按企业部署规范统一 IP、端口、驱动和设备登记
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

### 5. 共享打印机类问题

优先查看：

```text
共享主机是否开机
共享主机本机能否打印
客户端能否访问 \\主机名
共享权限 / Windows 凭据 / 防火墙
客户端驱动是否匹配
```

### 6. 企业部署类问题

优先采用：

```text
DHCP 保留
Standard TCP/IP Port
官方驱动
统一打印机命名
统一设备登记表
统一驱动版本
故障速查表
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
│       ├── printer-garbled-output-troubleshooting.md
│       ├── shared-printer-troubleshooting.md
│       ├── printer-enterprise-deployment-standard.md
│       └── printer-common-errors-quick-reference.md
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