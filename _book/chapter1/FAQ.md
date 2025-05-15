如果报`Invalid CEN header (invalid zip64 extra data field size)`异常，请更换Jdk版本，参见[JDK-8313765](https://gitee.com/link?target=https%3A%2F%2Fbugs.openjdk.org%2Fbrowse%2FJDK-8313765)

如下图所示。



> hvigor ERROR: Tools execution failed.
> 07-15 21:50:58 ERROR - hap-sign-tool: error: Invalid CEN header (invalid zip64 extra data field size)
>     Detail: Please check the message from tools.


> hvigor ERROR: BUILD FAILED in 9 s 403 ms 


hvigorw assembleHap --no-daemon invoke 



这里我们就要注意，Java版本要是17才可以，

在这儿下载

https://www.oracle.com/hk/java/technologies/downloads/#java8-mac

这两个都可以

![image-20240715221806766](https://luckly007.oss-cn-beijing.aliyuncs.com/uPic/image-20240715221806766.png)

这里的 区别在于，前面的需要我们自己在环境变量里配置，后者不需要

前者配置如下：

```
export JAVA_HOME=/Users/jianguo/huawei/jdk-17.0.11.jdk/Contents/Home
export PATH=$JAVA_HOME/bin:$PATH
```



然后

```
source ~/.zshrc
```

才可以解决。

