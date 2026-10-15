# RustDesk 串流分支

## 项目简介

基于 RustDesk 的精简串流工具，围绕屏幕、系统声音与键鼠交互开发，以高帧率、低延迟为改造目标。主机端与客户端使用 Flutter 界面。

## 项目功能

- 屏幕共享与系统音频传输
- 键鼠控制、文字剪贴板和截图保存
- 设备认证、加密连接与权限控制
- 独立的 60、90、120 FPS 串流目标，以及积压时的画面呈现合并
- 保留现有硬件编解码和 GPU 纹理路径

## 适用平台

保留 Windows、macOS、Linux、Android 和 iOS 的现有平台代码。Linux 仅支持 Wayland 会话，已移除 X11 后备路径。本轮改造尚未完成全平台构建和实机验收。

## 快速部署

当前重构分支尚未提供经验证的安装包。上游 RustDesk 安装包不包含本分支的精简和串流改动。

## 编译部署

初始化仓库子模块，按 `.github/workflows/flutter-build.yml` 准备固定版本的 Rust、Flutter、原生依赖与桥接生成产物，再在仓库根目录执行：

```sh
python3 build.py --flutter
```

硬件编解码构建需使用对应平台工作流中的功能参数。Linux 需要运行中的 Wayland 桌面及其屏幕共享、远程输入后端。Docker 构建仅覆盖 Rust 库，不能替代完整 Flutter 应用构建。

[项目文档](docs/streaming.md)
