## 导论

bash快捷键

```bash
ctrl+a #光标到行首
ctrl+e #光标到行尾
ctrl+u #删除整行
ctrl+k #删除到行尾
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

通过`stat`可以查看文件的详细信息

### cp

```bash
cp -r abc ../home #递归copy abc->../home拷贝目录
cp -i  #如果有覆盖则提示是否需要覆盖

cp -t ../home abc #颠倒顺序 abc->../home
cp -d #如果copy的是符号连接则copy的是原文件 -d表示仅仅copy符号链接
cp -a #拷贝所有 -r -d 结合
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
ln target newfile #建立硬连接 不能用于目录
ln -s target newfile #建立软连接 目录可以建立软连接
```

### find

```bash
find /home -name README.md #递归的在/home路径下查找README文件
find src1 src2 -name README.md #也可以指定多个目录
find ./ -name "*.jpg"  #通配符
find . ! -name "*.md" #反向查找
find . -type f
find ./   -type d -name "*.xml" #多条件
find . -maxdepth 3  # 最大递归3个目录
# 查找10天前文件 -mtime 修改时间、 -ctime 创建时间、 -atime 访问时间
find /root -mtime +10
```

### xargs

```bash
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

### rename

```bash
rename .jpg .png *.jpg #将所有jpg文件改名为png
```

### file

```bash
file A #显示文件的类型
file -b A #不输出文件名 只显示精简信息
file *
```

### md5sum

```bash
md5sum file #计算文件的md5值
md5sum -c #检查是否改变
```

​    

## 参考

[https://github.com/xjh22222228/linux-manual#cp](https://github.com/xjh22222228/linux-manual#cp)

《跟老男孩学Linux运维:核心命令系统实战》    