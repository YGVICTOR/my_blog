# 第零章

[gitbook发布github pages教程](https://blog.csdn.net/xixihahalelehehe/article/details/125115061)

[搭建Gitbook并通过Git推送部署](https://www.eula.club/blogs/%E6%90%AD%E5%BB%BAGitbook%E5%B9%B6%E9%80%9A%E8%BF%87Git%E6%8E%A8%E9%80%81%E9%83%A8%E7%BD%B2.html#_4-%E6%89%98%E7%AE%A1%E5%88%B0-github-page)

### 上传到Github仓库的master分支

为了提交方便，可以创建一个脚本文件`commit.sh`来自动执行将本地仓库`push`到远端仓库的指令，脚本如下

```shell
# 保存所有的修改
echo '执行命令：git add -A\n'
git add -A

# 把修改的文件提交
echo "执行命令：git commit -m 'update notebook CSAPP'\n"
git commit -m 'update gitbook' 

# 将本地仓库推送至远程仓库
echo '执行命令：git push origin master\n'
git push origin master
```

编写好后，在终端运行以下命令即可：

```shell
$ bash commit.sh
```



### 上传到 Github 仓库的 gh-pages 分支

打包命令太多，为了部署方便，可以创建一个脚本文件 `deploy.sh` 来自动执行，内容如下：

```shell
# 构建Gitbook
echo '执行命令：gitbook build .'
gitbook build .

# 进入生成的文件夹
echo "执行命令：cd ./_book\n"
cd ./_book

# 初始化一个仓库，仅仅是做了一个初始化的操作，项目里的文件还没有被跟踪
echo "执行命令：git init\n"
git init

# 解决使用git add命令时报错LF will be replaced by CRLF的问题
echo '执行命令：git config auto.crlf true\n'
git config auto.crlf true

# 保存所有的修改
echo "执行命令：git add -A"
git add -A

# 把修改的文件提交
echo "执行命令：commit -m 'deploy gitbook'"
git commit -m 'deploy gitbook'

# 发布到 https://<USERNAME>.github.io/<REPO>
echo "执行命令：git push -f 仓库地址.git master:gh-pages"
git push -f 仓库地址.git master:gh-pages

# 返回到上一次的工作目录
echo "回到刚才工作目录"
cd -
```

文件保存后，在终端执行如下命令，把生成的项目推送到 github 仓库上的 `gh-pages` 分支：

```shell
$ bash deploy.sh
```

