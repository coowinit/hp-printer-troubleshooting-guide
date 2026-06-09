# 打印机常见故障速查总表

> 用于 Helpdesk 和 IT 运维快速判断打印机故障方向。建议先根据“故障现象”定位，再进入对应专题文档处理。

---

## 1. 快速判断流程

```text
打印异常
    ↓
先看打印队列是否卡住
    ↓
再看打印机是否脱机
    ↓
检查 Ping 是否能通
    ↓
检查端口是否为 TCP/IP
    ↓
检查 IP 是否变化
    ↓
检查驱动和软件输出
    ↓
必要时重装驱动或重新添加打印机
```

---

## 2. 故障现象速查表

| 故障现象 | 优先检查 | 常见原因 | 推荐处理 | 关联文档 |
|---|---|---|---|---|
| 打印任务卡住 | 打印队列 / Spooler | 任务损坏、Spooler 异常 | 清空队列并重启 Spooler | `printer-queue-spooler-cache-guide.md` |
| 任务显示正在删除但删不掉 | Spooler / 缓存目录 | 缓存文件锁定 | 停止 Spooler 后删除缓存 | `printer-queue-spooler-cache-guide.md` |
| 打印机显示脱机 | 状态 / 网络 / 端口 | IP 变化、WSD 异常、网络不通 | 取消脱机、Ping、检查端口 | `printer-offline-troubleshooting.md` |
| Ping 不通打印机 | 网络 | 打印机关机、断网、IP 变化 | 检查网线、Wi-Fi、IP | `printer-ping-network-check.md` |
| Ping 通但无法打印 | 端口 / 队列 / 驱动 | 端口错误、驱动异常 | 检查 TCP/IP 端口和驱动 | `printer-ping-network-check.md` |
| 原来能打，突然不能打 | IP / 端口 | 打印机 IP 变化 | 查看新 IP 并修改端口 | `printer-ip-changed.md` |
| 找不到打印机 | 网络发现 / WSD | 自动发现失败 | 使用 TCP/IP 手动添加 | `wsd-vs-tcpip-port.md` |
| 多台电脑状态不一致 | 端口 / 驱动 | 有的用 WSD，有的用 TCP/IP | 统一 TCP/IP 端口 | `wsd-vs-tcpip-port.md` |
| 测试页正常，PDF 不正常 | 软件 / 文件 / 字体 | PDF 渲染异常、字体缺失 | 尝试作为图像打印 | `printer-garbled-output-troubleshooting.md` |
| 打印乱码 | 驱动 / 字体 | 驱动语言不匹配、字体未嵌入 | 更换 PCL/PS 或重装驱动 | `printer-garbled-output-troubleshooting.md` |
| 打印格式错乱 | 驱动 / 软件 | 纸张、缩放、驱动异常 | 检查页面设置和驱动 | `printer-garbled-output-troubleshooting.md` |
| 驱动程序不可用 | 驱动 | 驱动损坏、不兼容 | 删除旧驱动并安装官方驱动 | `printer-driver-install-reinstall-guide.md` |
| 共享打印机无法连接 | 主机 / 权限 | 主机关机、防火墙、凭据 | 检查共享主机和权限 | `shared-printer-troubleshooting.md` |
| 主机能打印，客户端不能打印 | 共享 / 客户端 | 共享权限、客户端驱动 | 重新连接共享打印机 | `shared-printer-troubleshooting.md` |
| 打印速度慢 | 端口 / 文件 / 网络 | WSD、PDF 大、网络慢 | 改 TCP/IP，优化文件 | `wsd-vs-tcpip-port.md` |

---

## 3. 按原因分类速查

### 3.1 系统服务类

| 问题 | 典型表现 | 处理 |
|---|---|---|
| Print Spooler 异常 | 所有任务卡住 | 重启 Spooler |
| 打印缓存损坏 | 任务删不掉 | 停止服务后清空缓存 |
| Windows 状态误判 | 显示脱机 | 取消脱机并重启服务 |

### 3.2 网络类

| 问题 | 典型表现 | 处理 |
|---|---|---|
| 打印机断网 | Ping 不通 | 检查网线 / Wi-Fi |
| IP 变化 | 原端口失效 | 修改 TCP/IP 端口 |
| IP 冲突 | 时通时断 | 更换 IP 或设置 DHCP 保留 |
| 不同网段 | 无法发现打印机 | 检查网关和 VLAN |

### 3.3 端口类

| 问题 | 典型表现 | 处理 |
|---|---|---|
| WSD 不稳定 | 状态异常、偶发失败 | 改用 TCP/IP |
| TCP/IP 指向旧 IP | 任务发送不到打印机 | 修改端口地址 |
| 端口选错 | 打印无反应 | 勾选正确端口 |

### 3.4 驱动类

| 问题 | 典型表现 | 处理 |
|---|---|---|
| 驱动损坏 | 无法打印或乱码 | 重装官方驱动 |
| 驱动语言不匹配 | 乱码、格式错乱 | 切换 PCL / PS |
| 通用驱动不兼容 | 功能缺失 | 安装型号专用驱动 |

### 3.5 文件和软件类

| 问题 | 典型表现 | 处理 |
|---|---|---|
| PDF 渲染异常 | PDF 打印错位 | 作为图像打印 |
| 字体未嵌入 | 中文方框、符号异常 | 嵌入字体或换字体 |
| 软件页面设置错误 | 纸张或缩放异常 | 检查页面设置 |

---

## 4. 常用命令速查

### 重启 Print Spooler

```cmd
net stop spooler
net start spooler
```

### 清空打印缓存

```cmd
net stop spooler
del /Q /F %systemroot%\System32\spool\PRINTERS\*.*
net start spooler
```

### Ping 打印机

```cmd
ping 192.168.0.193
```

### 连续 Ping

```cmd
ping 192.168.0.193 -t
```

### 查看电脑网络配置

```cmd
ipconfig /all
```

### 查看 ARP 记录

```cmd
arp -a
```

---

## 5. 一线处理建议

如果用户只说“打印不了”，建议按以下顺序询问或检查：

```text
1. 是所有人不能打印，还是只有一台电脑不能打印？
2. 打印机是否开机、是否有错误灯？
3. 打印任务是否卡在队列？
4. 电脑上打印机是否显示脱机？
5. Ping 打印机 IP 是否正常？
6. 当前端口是否为 TCP/IP，IP 是否正确？
7. Windows 测试页能否打印？
8. 是否只有某个软件或某个文件不能打印？
```

---

## 6. 升级处理建议

以下情况建议升级给 IT 管理员或现场人员：

- 多台电脑同时无法打印
- Ping 不通且无法确认打印机 IP
- 打印机面板有硬件错误
- 网络端口、VLAN、防火墙可能存在限制
- 驱动重装后仍然乱码或无法打印
- 打印机频繁掉线或自动重启
- 涉及财务、仓库、标签等关键业务打印

---

## 7. 推荐标准化方案

```text
固定 IP / DHCP 保留
        ↓
Standard TCP/IP Port
        ↓
官方驱动
        ↓
统一打印机名称
        ↓
登记设备信息
        ↓
保留常见故障处理记录
```

