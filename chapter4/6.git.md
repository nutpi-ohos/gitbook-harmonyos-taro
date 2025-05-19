## 1.平台

### Gitcode

https://gitcode.com/

### Atomgit

https://atomgit.com/

### gitee

https://gitee.com/

### github

https://github.com/

## 2.Git

下载：https://git-scm.com/



```
git -v

jianguo@nutpi flutter % git -v
git version 2.39.2 (Apple Git-143)


```



## 网址

打开网址，https://gitcode.com/



![image-20250514143334564](https://nutpi-e41b.obs.cn-north-4.myhuaweicloud.com/image-20250514143334564.png)



### 打开个人设置

![image-20250514143459386](https://nutpi-e41b.obs.cn-north-4.myhuaweicloud.com/image-20250514143459386.png)



![image-20250514143707143](https://nutpi-e41b.obs.cn-north-4.myhuaweicloud.com/image-20250514143707143.png)

开发者向码云版本库写入最常用到的协议是 SSH 协议，因为 SSH 协议使用公钥认证，可以实现无口令访问，而若使用 HTTPS 协议每次身份认证时都需要提供口令。使用 SSH 公钥认证，就涉及到公钥的管理。

### 3.如何生成ssh公钥

------

你可以按如下命令来生成sshkey:

这个邮箱就是你的上面的邮箱

```
ssh-keygen -t rsa -C "xxxxx@xxxxx.com"  

# Generating public/private rsa key pair...
# 三次回车即可生成 ssh key
```

比如我的

```
ssh-keygen -t rsa -C "852851198@qq.com"  
```

然后三次回车即可生成 ssh key，

查看你的 public key，

#### mac

```
cat ~/.ssh/id_rsa.pub
# ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC6eNtGpNGwstc....
```

#### windows

在C:\Users\用户.ssh目录下找到id_rsa.pub复制里面所有内容

![image-20220719111429271](https://luckly007.oss-cn-beijing.aliyuncs.com/macimages/image-20220719111429271.png)

### 4.添加public key到码云

并把他添加到码云（Gitcode.com） [SSH key添加地址](https://gitcode.com/setting/key-ssh)

![image-20220719110915806](https://luckly007.oss-cn-beijing.aliyuncs.com/macimages/image-20220719110915806.png)

添加后，在终端（Terminal）中输入

```
ssh -T git@gitcode.com
```

若返回

```
Welcome to Gitee.com, yourname!
```

则证明添加成功。