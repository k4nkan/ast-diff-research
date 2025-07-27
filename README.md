# AST-DIFF-RESEARCH
## 📕 概要
このリポジトリは、GumTree を用いたAST（抽象構文木）差分比較の研究・検証のためのコードと結果をまとめたものです。  
ソースコードや出力された差分については公開していません。

## ⚙️ コマンド
### イメージのビルドコマンド
```bash
docker build -t gumtree-c-comparator .
```
### 構文木差分をXML形式で取得
```bash
docker run --rm \
           -v "$(pwd):/app" \
           gumtree-c-comparator \
           gumtree axmldiff files/file1.c files/file2.c > result/diff_output.xml
```

### 差分をHTML形式で視覚化
```bash
docker run --rm \
           -v "$(pwd):/app" \
           gumtree-c-comparator \
           gumtree htmldiff files/file1.c files/file2.c > result/diff_output.html
```