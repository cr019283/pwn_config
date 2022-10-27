FROM pwntools/pwntools:stable

USER root
RUN pip install --upgrade git+https://github.com/Gallopsled/pwntools@dev
RUN pip3 install --upgrade git+https://github.com/Gallopsled/pwntools@dev
RUN PWNLIB_NOTERM=1 pwn update

RUN dpkg --add-architecture i386 && \
apt-get update && \
apt-get install -y binutils bsdmainutils file rpm2cpio cpio zstd socat tmux build-essential jq strace ltrace curl wget ruby gcc dnsutils netcat gcc-multilib net-tools vim gdb gdb-multiarch python python3 python3-pip python3-dev libssl-dev libffi-dev git make procps libpcre3-dev libdb-dev libxt-dev libxaw7-dev python-pip libc6:i386 libncurses5:i386 libstdc++6:i386 && \

pip install capstone requests r2pipe && \
pip3 install keystone-engine unicorn capstone ropper && \
mkdir tools && cd tools && \
git clone https://github.com/JonathanSalwan/ROPgadget && \
git clone https://github.com/radare/radare2 && cd radare2 && sys/install.sh && \
git clone https://github.com/AFLplusplus/AFLplusplus && cd AFLplusplus && make all && make install && \
gem install one_gadget

RUN cd .. && git clone https://github.com/pwndbg/pwndbg && cd pwndbg && ./setup.sh && \
cd /tmp/ && \
curl -LO https://raw.githubusercontent.com/cr019283/pwn_config/main/config/gdb_tmux_config && \
cat gdb_tmux_config >> ~/.gdbinit && \
curl -LO https://raw.githubusercontent.com/cr019283/pwn_config/main/config/.gitconfig && \
cat .gitconfig >> ~/.gitconfig

USER pwntools
