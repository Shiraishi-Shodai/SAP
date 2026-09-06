
FROM opensuse/leap:15.3
RUN zypper refresh
RUN zypper install -y uuidd
RUN zypper install -y iproute2
RUN zypper install -y vim
RUN zypper install -y tcsh
RUN zypper install -y hostname
RUN zypper install -y iputils
RUN zypper install -y unrar

# RUN zypper install -y libnsl1
# RUN ldconfig

# hostnameのチェック
# RUN cat /etc/hostname

# ipaddrの設定
# ip addr show
# vim  /etc/hosts
# 172.18.0.2 vhcalnplci.dummy.nodomain vhcalnplci

# libnslがインストール済みか確認
# ldconfig -p | grep libnsl
# libnsl.so.2 (libc6,x86-64) => /usr/lib64/libnsl.so.2

# 解凍
# RUN unrar x ./TD752SP04part01.rar
# # 存在するlibnslの確認

# ASEのラインセンスを指定の場所に保存
# https://community.sap.com/t5/technology-q-a/error-installing-abap-7-5-2-assertion-failed-unable-to-generate-a-new/qaq-p/13689584
# cp ./SYBASE_ASE_TestDrive.lic ./server/TAR/x86_64/SYBASE_ASE_TestDrive.lic

# 必要であれば(元のインストール済みディレクトリを削除)
# rm -r /sybase /usr/sap /sapmnt

# ラインセンスの説明を抜けるための環境変数をセット
# export PAGER=cat

# install実行
# aseのセットアップを抜けるためにinstall.shを改造したcp_install.shを実行
# https://community.sap.com/t5/technology-blog-posts-by-members/adjusting-installer-script-for-sap-netweaver-dev-edition-for-distros-with/ba-p/13492318

# 途中で設定するASEのmasterパスワードは英数字(大文字小文字含む)で8文字以上(例: shotadaYo91)
# ./cp_install.sh

# sapstart all

# sapを止める
# sapcontrol -nr 00 -function Stop