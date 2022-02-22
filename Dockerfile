FROM ubuntu:16.04
ARG DEBIAN_FRONTEND=noninteractive

# 安装语言依赖
RUN apt-get update \
    && apt-get install -y --no-install-recommends apt-utils \
    && apt-get install -y locales \
    && localedef -i zh_CN -c -f UTF-8 -A /usr/share/locale/locale.alias zh_CN.UTF-8 \
    # 删除缓存，避免镜像太大
    && rm -rf /var/lib/apt/lists/*
ENV LANG zh_CN.utf8


COPY bootstrap/bootstrap_1_dependent.sh /data/bootstrap/bootstrap_1_dependent.sh
RUN sh /data/bootstrap/bootstrap_1_dependent.sh
#
#COPY bootstrap/bootstrap_2_data.sh /data/bootstrap/bootstrap_2_data.sh
#RUN sh /data/bootstrap/bootstrap_2_data.sh
#
#COPY bootstrap /data/bootstrap
#RUN sh /data/bootstrap/bootstrap_3_projects.sh
#
#COPY entrypoint.sh /entrypoint.sh
EXPOSE 7000
EXPOSE 8000
#CMD ["/entrypoint.sh"]
