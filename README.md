# osinit

一键安装go开发环境和docker环境。
支持ubuntu22.04版本。
安装完成后，是不带界面的ubuntu环境.
可以在windows环境下，使用virtualbox安装ubuntu22.04版本.然后在22.04ubuntu版本中执行这个仓库的脚本搭建环境。
也可以在远程ubuntu22.04机器中执行安装脚本.
安装完成后，可在本地windows环境下，安装vscode，安装远程插件(Remote Explorer,Remote - SSH),即可远程连接virtualbox或者远程机器中的ubuntu环境进行开发。


#### 软件架构
软件架构说明


#### 安装教程
```shell
git clone https://gitee.com/gcy3y/osinit.git
cd osinit/ubuntu/
bash init.22.04.sh
```

#### 使用说明
1. 重复安装，需要修改 ~/.bashrc 最后的多行，去除重复的即可
2. 安装前，可先看下脚本内容,根据个人需要删减
#### 参与贡献

1.  Fork 本仓库
2.  新建 Feat_xxx 分支
3.  提交代码
4.  新建 Pull Request


#### 特技

1.  使用 Readme\_XXX.md 来支持不同的语言，例如 Readme\_en.md, Readme\_zh.md
2.  Gitee 官方博客 [blog.gitee.com](https://blog.gitee.com)
3.  你可以 [https://gitee.com/explore](https://gitee.com/explore) 这个地址来了解 Gitee 上的优秀开源项目
4.  [GVP](https://gitee.com/gvp) 全称是 Gitee 最有价值开源项目，是综合评定出的优秀开源项目
5.  Gitee 官方提供的使用手册 [https://gitee.com/help](https://gitee.com/help)
6.  Gitee 封面人物是一档用来展示 Gitee 会员风采的栏目 [https://gitee.com/gitee-stars/](https://gitee.com/gitee-stars/)
