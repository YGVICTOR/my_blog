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
git push -f https://github.com/YGVICTOR/my_blog.git master:gh-pages

# 返回到上一次的工作目录
echo "回到刚才工作目录"
cd ..
