# git常用命令
------
一、git基础命令 <br>
１.git init xx # xx表示路径，通常为.，表示将当前路径初始化为git仓库 <br>
２.git add xxx yyy ccc/zzz #xxx yyy zzz表示文件名，可以跟多个文件，如果需要添加的文件在更下层目录则需要带相对路径，如ccc/zzz <br>
３.git commit -m “xxxxx” #xxx为本次提交的注释<br>
４.git push <远程主机名> <本地分支名>:<远程分支名>  #向远程服务器推送修改　<br>
    git push origin master    #将本地分支推送到远程分支，本地分支与远程分支存在追踪关系 <br>
    git push orign :master    #删除远程仓库的master分支，慎用! <br>
    如果当前分支与多个远程主机存在追踪关系，则可以通过-u选项指定一个默认主机 <br>
    git push -u origin master <br>
５.git pull  #与远程服务器上的仓库进行同步，即用远程服务器上仓库的内容更新本地仓库<br>
６.git clone  xxxx.git # 从远程服务器clone仓库并在本地创建与远程仓库同名的本地仓库<br>

二、分支操作命令 <br>
1.新建分支 <br>
git branch branch_name <br>
2.切换到分支 <br>
git checkout branch_name <br>
以上两条命令可用１条命令替换 <br>
git checkout -b branch_name    #创建branch_name分支并切换到该分支 <br>
3.查看分支 <br>
git branch <br>
有*号的分支表示是当前分支 <br>
4.删除分支 <br>
git branch -d branch_name <br>
5.合并分支 <br>
比如需要将分支Ｂ合入到分支Ａ上，则执行命令如下：<br>
a.先切换到Ａ分支上<br>
git checkout A<br>
b.执行合并命令<br>
git merge B<br>

6.比较分支间差异 <br>
git diff branch1 branch2 --stat    #显示branch1和branch2中差异部分; <br>
git diff branch1 branch2 具体文件路径 #比较指定路径下文件间的差异 <br>

三、git fetch & pull 详解 <br>
1.简单概括 <br>
git fetch 是将远程主机的最新内容拉到本地但不合并，是否合并由用户决定。 <br>
git pull 是将远程主机的最新内容拉到本地后直接合并，这样合并可能会产生冲突，冲突需要用户自行解决。 <br>
git pull = git fetch + git merge <br>
2. git fetch 用法 <br>
git fetch 命令: <br>
git fetch <远程主机名>    // 该命令将某个远程主机的更新全部取回本地，但不合并 <br>
如果只希望取回特定分支的更新，可以指定分支名： <br>
git fetch <远程主机名> <分支名>   // 主机名与分支名间有空格 <br>
常见命令如取回origin主机的master分支如下: <br>
git fetch origin master <br>
取回更新后，会返回一个FETCH_HEAD，FETCH_HEAD指的是某个branch在服务器上的最新状态，在本地可以通过FETCH_HEAD查看取回的更新信息: <br>
git log -p FETCH_HEAD <br>
可以通过log中看到的信息来判断合并是否会产生冲突，以确定是否将更新合并merge到当前本地分支中. <br>
3. git pull 用法 <br>
git pull 过程可以理解为: <br>
git fetch origin master  // 从远程主机的master分支拉取最新内容 <br>
git merge FETCH_HEAD // 将拉取下来的最新内容合并到当前所在的分支 <br>

将远程主机上的某个分支的更新取回并与本地的分支合并的完整命令格式如下: <br>
git pull <远程主机名> <远程分支名>:<本地分支名> <br>
如果希望将远程分支直接与当前分支合并，则上述命令冒号及后面的部分可以省略 <br>
git pull origin next <br>

《参考资料》 <br>
https://git-scm.com/book/zh/v2/Git-%E5%88%86%E6%94%AF-%E5%88%86%E6%94%AF%E7%9A%84%E6%96%B0%E5%BB%BA%E4%B8%8E%E5%90%88%E5%B9%B6 <br>
https://www.cnblogs.com/ydxblog/p/7988317.html  <br>