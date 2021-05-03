## 导论

bash快捷键

```bash
ctrl+a #光标到行首
ctrl+e #光标到行尾
ctrl+u #剪切整行
ctrl+k #剪切光标位置到行尾
ctrl+w #删除光标前一个单词
ctrl+y #粘贴
ctrl+d #退出当前shell
ctrl+z #暂停任务 bg fg可以恢复
ctrl+r #搜索历史命令
```

开关机

```bash
#-h:halt的意思
#shutdown会进行一些清理工作 然后调用init 0
shutdown -h now #立刻关机
shutdown -h 1 #1分钟之后 shutdown不加参数默认就是这个
shutdown -h 11:00 #11点关机
shutdown -r  now #立刻重启
sync #将内存数据同步到磁盘 关机前都要执行这个命令
last #查看关机和启动的日志
```

​    

## 文件和目录

### mkdir

```bash
-p  #递归创建 如果存在则忽略不会报错
```

### tree

```bash
-a #显示所有文件
-d #只显示目录
-i #不显示树枝
```

### ls

```bash
-l #长格式输出
-t #按最后修改时间降序(默认按照文件名)
-r #反序 ps: -tr按照时间升序号
-h #以人类可读的方式显示大小等信息
-a #列出所有文件
-S #根据文件大小降序
--time-style long-iso #指定时间格式 long-iso最完美

#--------不常用----------
--time atime#默认输出的是修改的时间,指定输出哪种时间 atime ctime
-u #按最后访问时间atime降序
-c #按最后状态修改时间ctime降序
-p #目录后面加上'/'
-F #在每个文件下加上文件类型指示符号 @/|=*....
-i #显示inode号
-d #只显示当前目录本身信息
```

![](https://raw.githubusercontent.com/biningo/cdn/master/2021-04/linux_file.png)

### stat

通过`stat`可以查看文件的详细信息

```bash
stat a.txt
```

### cp

```bash
cp -r abc ../home #递归copy abc->../home拷贝目录
cp -i  #如果有覆盖则提示是否需要覆盖
cp -d #如果copy的是符号连接则copy的是原文件 -d表示仅仅copy符号链接
cp -a #拷贝所有 -r -d 结合 包括创建时间等
```

### mv

```bash
mv -i #覆盖提示
mv -f #强制覆盖
```

### rm

删除应对策略:

- 禁止使用`rm -rf`
- `rm`指令用`mv`代替，将文件移动到其它路径

```bash
rm -f #强制删除
rm -i #删除确认
rm -r #递归删除
```

### rmdir

删除空目录

```bash
rmdir -p A/AA/AAA  #递归删除 如果父子目录都为空
```

### ln

建立软硬链接

```bash
ln target newfile #建立硬连接 目录不可以建立硬连接
ln -s target newfile #建立软连接 目录可以建立软连接
```

### find

`-atime`: 访问时间

`-mtime`: 修改时间

+1: 1天前    -1: 1天内

```bash
find . -atime -2 #查找两天内被访问过的文件
find . -mtime -5 #查找两天内被修改过的文件
```

`-type`按类型查找

```bash
find . -type f #f|d|s|p 普通文件|目录|socket|管道
```

反向查找`!`

```bash
find . ! -type d #查找不是目录的文件 
```

`-perm`按照目录权限来查找

```bash
find . -perm 700
```

`-size`按照大小来查找`cwbkMG`

```bash
find . -size +100M #查找大于100M的文件
find . -size -10b #查找小于10字节的文件
```

`-path` `-prune` 忽略搜索路径

```bash
#-prune 和-path结合使用表示忽略搜索路径  -path为真时执行-prune忽略,为假时执行-pint 这句话其实是 -path "xxx" -a -prune -o -print的缩写
find $PWD -path "$PWD/pkg" -prune -o -print
```

`-user`查找指定用户的文件

```bash
find .  -user abc
```

`-newer`查找比指定文件新的文件

```bash
ind . -newer act ! -newer caddy #查找比act新 比caddy旧的文件
```

`-maxdepth`指定查找的目录深度

```bash
find . -maxdepth 1 #查找当前路径下所有一级深度的文件
```

`-name`按照文件名进行查找

```bash
find . -name "*.jpg" #查找以jpg结尾的文件
find . -name "?.jpg" #查找a.jpg这样的文件
find . -name "[abcdef].jpg" #查找a.jpg b.jpg c.jpg d.jpg e.jpg f.jpg
```

`-exec`执行: 如果文件很多则效率很低，exec和xargs的区别就是exec是逐一执行的xargs是一起执行的

```bash
find . -type f -exec ls -l {} \; #最后\是转义;号的 -exec必须以;结尾 {}是占位符
#和下面的命令效果一样
find . -name "go*"  | xargs ls -l
```

`find`结合`xargs`

```bash
find . -type f | xargs -i mv {} dir/ #-i表示将查询出来的插入到{}中
find . -type f | xargs -p rm #-p表示有提示
find . -type f | xargs  tar -zcvf file.tar.gz #将当前路径下的文件都打包
find . -type f | xargs sed -i "s/hello/hi/g" #将所有文件中的hello替换为hi
```

多条件

```bash
find src1 src2 -name README.md #也可以指定多个目录
```

通过find移动文件的3种方法

```bash
find . -name "a" | xargs -i  mv {} dir/
find . -name "a" | xargs -i  mv -t dir/ #mv -t表示反转
mv `find . -name "c"` ./B #反引号表示解析命令结果
```

### xargs

```bash
cat a | xargs #表示合并为一行 这里没有接命令 所以会输出到屏幕上
cat a | xargs -n 2 #只显示两列 每行最多输出2个

find -name "*.js" | xargs wc -l # 等价于 wc -l a.js b.js c.js ...
cat download.txt | xargs wget #批量下载
find . -name "*.js" | xargs -i mv {} dir1/ #{}代表占位符 -I [] 指定占位符
find . -name "*.js" | xargs -ip mv {} dir1/ #-p表示询问
```

### basename、dirname

```bash
basename /a/b/c #显示文件名或者目录名  c
dirname /a/b/c #显示目录路径 /a/b
```

### lsattr、chattr

[TODO]列出和改变文件的扩展熟悉

展示和改变文件的扩展属性

### file

```bash
file A #显示文件的类型
file -b A #不输出文件名 只显示精简信息
file *
```

### md5sum

生成文件的md5值，可以用于校验备份文件是否损坏

```bash
md5sum fil
e #计算文件的md5值
md5sum -c #检查是否改变
```

### chown

更改文件所属的用户或则用户组

```bash
chown 用户 a.txt
chown :组 a.txt
chown 用户:组 a.txt
chown -R #递归更改
```

### chmod

更改文件的读写权限

```bash
chmod u+x
chmod a+x #a=u+g+oaa
chmod a-x
chmod 653 #用数字代替
chmod u=rwx,g=xw
chmod -R #递归
```

### umask

定义了文件创建时的默认权限的掩码

```bash
666 #默认初始权限
022 - #掩码
-----
644

umask #默认是数值方式输出
umask -S #以字符方式输出掩码
umask 003 #修改掩码
```

> 文件权限和数字的一个对应可以查看这个网址 https://linxz.github.io/tianyizone/linux-chmod-permissions.html

​    

## 文件过滤和内容编辑

### cat

使用`cat`实现文件编辑 (注意这个在`zsh`中无效)

```bash
cat >a.txt<<EOF #EOF可以是其他符号 代表结束开始的符号
hello,world
hello,world
EOF

#没有指定文件则是直接输出到屏幕中
cat <<EOF
hello,world
hello,world
EOF
```

下面是cat一些常用的选项，cat还可以一次性合并输出多个文件

```bash
cat -n a.txt  #输出行号(包括空行)
cat -b a.txt #输出行号 (不包括空行)
cat -s a.txt #如果有空行则将多个空行合并为1个
cat a.txt | grep -v "^$" #过滤掉所有空行
```

### more

### less

TODO

### head、tail

```bash
head -2 a.txt #只输出前2行 -n 2 同理
head -c 10 a.txt #只输出指定字节
#tail同理 只列出一些特殊操作
tail -f a.txt #实时监控文件追加的数据
tail -f -s 10 a.txt #-s表示监控间隔为10s
```

### cut

分割文本

```bash
cat a | cut -d ' ' -f 1 #以空格为单位 并取第一列
cat a | cut -d ' ' -f 1,4 #以空格为单位 并取第一列
cat a | cut -b 1 #去第一列字节
cat a | cut -b 1,4 #取1 4两列
cat a | cut -b 1-4 #[1,4) 取范围
cat a | cut -b 1-6,7-10 #[1,6) [7,10) 多个范围合并的列
cat a | cur -c 1 #取第一列字符
```

### split

分割文件

```bash
split -l 2 a new_ #2行分割为一个文件 新文件以new_开头 默认使用字符后缀 -d可以指定使用数字后缀
split -b 500K a new_ #按照大小进行分割
```

### paste

```bash
paste a b #合并 输出到屏幕
paste a b -d : #以:为分隔符
paste a b -s #每个文件分别占用一行
```

### sort

TODO



​    

## 参考

[https://github.com/xjh22222228/linux-manual#cp](https://github.com/xjh22222228/linux-manual#cp)

《跟老男孩学Linux运维:核心命令系统实战》    

《鸟哥的Linux私房菜》

《Linux命令行与Shell脚本编程大全》

