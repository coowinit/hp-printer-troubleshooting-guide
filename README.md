# 🖨️ 打印机故障排查知识库

![Platform](https://img.shields.io/badge/Platform-Windows-blue)
![Topic](https://img.shields.io/badge/Topic-Printer%20Troubleshooting-green)
![Version](https://img.shields.io/badge/Version-v1.1.0-success)

> 一个面向办公室和企业环境的中文打印机故障排查知识库，涵盖 Windows 打印队列、Print Spooler、打印缓存清理、WSD 与 TCP/IP 端口、网络打印机 IP 检测和企业部署建议。

---

## 📌 当前版本

```text
v1.1.0 - 新增打印队列卡住、Print Spooler 与清空缓存指南
```

本版本在原有 HP 网络打印机故障排查案例基础上，新增了更通用的 Windows 打印队列故障处理文档，适用于以下常见场景：

- 打印任务一直卡在队列中
- 点击打印后打印机没有任何反应
- 测试页无法打印
- 删除打印任务失败
- 打印队列显示“正在删除”但长时间不消失
- Print Spooler 服务异常
- 需要清空 Windows 打印缓存

---

## 📚 文档导航

### 真实案例

| 文档 | 说明 |
|---|---|
| [HP 网络打印机故障排查与 TCP/IP 端口优化指南](docs/printer/hp-network-printer-troubleshooting.md) | 基于 HP LaserJet Professional M1216nfh MFP 的真实故障处理记录，包含 Print Spooler 修复、WSD 转 TCP/IP 端口和企业部署建议。 |

### v1.1.0 新增专题

| 文档 | 说明 |
|---|---|
| [打印队列卡住、Print Spooler 与清空缓存指南](docs/printer/printer-queue-spooler-cache-guide.md) | 系统说明打印任务卡住的现象、原因、排查流程、Print Spooler 重启方法，以及手动清空 spool 打印缓存的完整步骤。 |

---

## 🚀 快速处理流程

当用户反馈“打印不了”时，可以先按下面顺序判断：

```text
确认打印机开机
    ↓
检查打印队列是否卡住
    ↓
尝试取消异常任务
    ↓
重启 Print Spooler
    ↓
必要时清空 spool 打印缓存
    ↓
重新打印测试页
    ↓
若仍失败，再检查 IP、端口、驱动和网络
```

---

## 🧰 常用命令

### 重启 Print Spooler

```cmd
net stop spooler
net start spooler
```

### 清空打印缓存

> 建议以管理员身份运行命令提示符。

```cmd
net stop spooler
del /Q /F %systemroot%\System32\spool\PRINTERS\*.*
net start spooler
```

---

## 🗂️ 推荐目录结构

```text
printer-troubleshooting-knowledge-base/
├── README.md
├── docs/
│   └── printer/
│       ├── hp-network-printer-troubleshooting.md
│       └── printer-queue-spooler-cache-guide.md
├── images/
│   └── printer/
└── scripts/
    └── windows/
        └── clear-printer-queue.bat
```

---

## 📝 版本记录

### v1.1.0

- 新增打印队列卡住排查指南
- 新增 Print Spooler 服务说明
- 新增 Windows 打印缓存清理步骤
- 新增命令行处理方式
- 新增批处理脚本示例
- 优化 README 首页导航结构

### v1.0.0

- 新增 HP 网络打印机故障排查案例
- 新增 WSD 与 TCP/IP 端口对比
- 新增网络打印机 IP 检测方法
- 新增企业环境最佳实践建议

---

## 📚 关键词

```text
Printer Troubleshooting
Print Spooler
Windows Printer
Printer Queue
Spool Cache
Network Printer
HP Printer
TCP/IP Port
WSD
IT Support
Helpdesk
```
