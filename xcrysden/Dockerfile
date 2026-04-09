FROM debian:9-slim

# 1. 修复Debian 9源并安装核心依赖
RUN sed -i 's/deb.debian.org/archive.debian.org/g' /etc/apt/sources.list && \
    sed -i 's|security.debian.org/debian-security|archive.debian.org/debian-security|g' /etc/apt/sources.list && \
    sed -i '/stretch-updates/d' /etc/apt/sources.list && \
    apt-get update && apt-get install -y --no-install-recommends \
    tcl8.5 tk8.5 libglu1-mesa libx11-6 \
    tigervnc-standalone-server tigervnc-common \
    fluxbox xcrysden mesa-utils xvfb x11-apps \
    libgl1-mesa-glx libgl1-mesa-dri mesa-utils \
    xfonts-base unifont sudo geany rox-filer \
    xterm procps net-tools \
    x11-utils stterm suckless-tools nano lsb-compat lsb-release \
    && \
    apt-get clean

# 2. 创建非Root用户（安全最佳实践）
RUN useradd -m -s /bin/bash xcuser && \
    usermod -aG sudo xcuser && \
    echo "xcuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER xcuser
WORKDIR /home/xcuser

# 3. 配置VNC密码（密码：xcrysden）
RUN mkdir -p ~/.vnc && \
    echo "xcrysden" | vncpasswd -f > ~/.vnc/passwd && \
    chmod 600 ~/.vnc/passwd

# 4. 编写启动脚本
RUN echo '#!/bin/bash\n\
\n\
export LIBGL_ALWAYS_SOFTWARE=1  \n\
export XCRYSDEN_MESA=1          \n\
\n\
vncserver -kill :1 > /dev/null 2>&1 || true\n\
vncserver :1 -geometry 1280x800 -depth 24 -localhost no -dpi 196 -xstartup /usr/bin/fluxbox \n\
\n\
export DISPLAY=:1\n\
' > ~/vncstart.sh && \
    chmod +x ~/vncstart.sh

# 5. 暴露VNC端口
EXPOSE 5901

# 启动命令
CMD ["/bin/bash", "/home/xcuser/vncstart.sh"]

