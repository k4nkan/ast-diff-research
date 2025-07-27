# ベースイメージとして、OpenJDKの公式イメージを使用 / Java 17 LTS (Long Term Support)
FROM openjdk:17-jdk-slim

# 環境変数の設定 (GumTreeのバージョンとダウンロードURL)
ENV GUMTREE_VERSION="4.0.0-beta4"
ENV GUMTREE_DOWNLOAD_URL="https://github.com/GumTreeDiff/gumtree/releases/download/v${GUMTREE_VERSION}/gumtree-${GUMTREE_VERSION}.zip"
ENV GUMTREE_DIR="/opt/gumtree"

# 必要なツールのインストール
RUN apt-get update && \
    apt-get install -y --no-install-recommends wget unzip && \
    rm -rf /var/lib/apt/lists/*

# GumTreeのダウンロードと展開
RUN mkdir -p ${GUMTREE_DIR} && \
    wget -O /tmp/gumtree.zip ${GUMTREE_DOWNLOAD_URL} && \
    unzip /tmp/gumtree.zip -d ${GUMTREE_DIR} && \
    rm /tmp/gumtree.zip && \
    mv ${GUMTREE_DIR}/gumtree-* ${GUMTREE_DIR}/gumtree_home

# GumTreeの実行可能ファイルへのパスをPATHに追加
ENV PATH="${GUMTREE_DIR}/gumtree_home/bin:$PATH"

# 作業ディレクトリの設定
WORKDIR /app

# コンテナの起動時にデフォルトで実行されるコマンド
CMD ["gumtree", "--help"]