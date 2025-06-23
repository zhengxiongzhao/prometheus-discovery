<div align="center">

[![StarsL.cn](https://img.shields.io/badge/website-StarsL.cn-orange)](https://starsl.cn)
[![Commits](https://img.shields.io/github/commit-activity/m/starsliao/TenSunS?color=ffff00)](https://github.com/starsliao/TenSunS/commits/main)
[![open issues](http://isitmaintained.com/badge/open/starsliao/TenSunS.svg)](https://github.com/starsliao/TenSunS/issues)
[![Python](https://img.shields.io/badge/python-%3C=v3.10-3776ab)](https://nodejs.org)
[![Node.js](https://img.shields.io/badge/node.js-%3E=v14-229954)](https://nodejs.org)
[![GitHub license](https://img.shields.io/badge/license-WTFPL-blueviolet)](https://github.com/starsliao/TenSunS/blob/main/LICENSE)
[![OSCS Status](https://www.oscs1024.com/platform/badge/starsliao/TenSunS.svg?size=small)](https://www.murphysec.com/dr/Zoyt5g0huRavAtItj2)
</div>

![tensuns-arch](https://raw.githubusercontent.com/starsliao/TenSunS/main/screenshot/tensuns-arch.png)



## 🦄概述
>**后羿 - TenSunS**(原ConsulManager)是一个使用Flask+Vue开发，基于Consul的WEB运维平台，弥补了Consul官方UI对Services管理的不足；并且基于Consul的服务发现与键值存储：实现了Prometheus自动发现多云厂商各资源信息；基于Blackbox对站点监控的可视化维护；以及对自建与云上资源的优雅管理与展示。

## 🌈功能描述
### 🎡1. Consul管理(比官方更优雅的Consul Web UI)
- 支持Consul Services的增删改查，可以批量删除Service。
- 直观的查看每个Services实例的信息，及整体Services的健康状态。
- 可以便捷的对Services实例的Tags、Meta、健康检查配置管理与查询。

### 💎2. 自建与云资源监控管理(ECS/RDS/Redis)
>**基于Consul实现Prometheus监控目标的自动发现。**

- ✔**当前已支持对接阿里云、腾讯云、华为云、AWS。**

  - ⭐支持多云ECS/RDS/Redis的**资源、分组、标签**自动同步到Consul并接入到Prometheus自动发现！(并提供云资源信息查询与自定义页面)
  - ⭐支持多云ECS信息自动同步到**JumpServer**。
  - ⭐支持多云**账户余额**与云资源**到期日**设置阈值告警通知。
  - ⭐支持作为Exporter接入Prometheus：Prometheus增加TenSunS的JOB后可抓取云厂商的部分MySQL/Redis指标。(弥补原生Exporter无法获取部分云MySQL/Redis指标的问题)
- ✔**支持自建主机/MySQL/Redis**接入WEB管理，支持增删改查、批量导入导出，自动同步到Consul并接入到Prometheus监控！
- ✔提供了按需生成Prometheus配置与ECS/MySQL/Redis告警规则的功能。
- ✔设计了多个支持同步的各字段展示的Node_Exporter、Mysqld_Exporter、Redis_Exporter Grafana看板。

### 🚀3. 站点与接口监控管理
>**基于Consul + Prometheus + Blackbox_Exporter实现站点的自动发现与监控。**

- 使用Web页面即可对监控目标增删改查，支持站点的分级分组查询管理。
- 支持对监控目标的批量删除与批量导入，数据实时同步到Consul。
- 提供了Blackbox的配置、Prometheus的配置以及Prometheus站点监控的告警规则。
- 设计了一个支持各分级分组字段展示的Blackbox_Exporter Grafana看板。

### 💫4. 高危漏洞采集与实时告警
- 增加了高危风险漏洞采集与实时告警通知功能。
- 功能开启即可采集最新30个漏洞列表。
- 每小时采集一次，发现新漏洞立即推送到群机器人。
- 支持企微、钉钉、飞书群机器人通知。

---

## 💾部署说明

```bash
docker compose up
```

登录地址： http://localhost:1026
用户名/密码： admin/admin1

## 🎨截图预览（[点击查看完整截图](https://github.com/starsliao/TenSunS/tree/main/screenshot#%E6%88%AA%E5%9B%BE)）

<details><summary>💥点击展开</summary>
  
### Consul Web Manager 界面
![](https://raw.githubusercontent.com/starsliao/TenSunS/main/screenshot/consul3.PNG)
### 多云ECS同步Consul界面
![](https://raw.githubusercontent.com/starsliao/TenSunS/main/screenshot/ecs1.PNG)
### 多云ECS同步JumpServer界面
![图片](https://user-images.githubusercontent.com/3349611/180870935-56e536d2-0b71-4803-b5f8-0839a241c79a.png)
### Node Exporter Dashboard 截图
![](https://raw.githubusercontent.com/starsliao/TenSunS/main/vue-consul/public/node1.png)
![](https://raw.githubusercontent.com/starsliao/TenSunS/main/vue-consul/public/node2.png)
### Blackbox Manager 界面
![](https://raw.githubusercontent.com/starsliao/TenSunS/main/screenshot/blackbox1.PNG)
### Blackbox Exporter Dashboard 截图
![](https://raw.githubusercontent.com/starsliao/TenSunS/main/vue-consul/public/blackbox.png)
### 高危漏洞采集与通知 界面
![](https://raw.githubusercontent.com/starsliao/TenSunS/main/screenshot/bug.png)
##### 钉钉告警通知
![图片](https://user-images.githubusercontent.com/3349611/173263960-4d69fff9-82fe-42a1-ba18-4c78775cf35e.png)

</details>

---
## 🥇最佳实践
- #### [TenSunS：实践与FAQ](https://github.com/starsliao/TenSunS/tree/main/docs)
- #### [应用场景1：如何优雅的基于Consul自动同步ECS主机监控](https://github.com/starsliao/TenSunS/blob/main/docs/ECS%E4%B8%BB%E6%9C%BA%E7%9B%91%E6%8E%A7.md)
- #### [应用场景2：如何优雅的使用Consul管理Blackbox站点监控](https://github.com/starsliao/TenSunS/blob/main/docs/blackbox%E7%AB%99%E7%82%B9%E7%9B%91%E6%8E%A7.md)
- #### [应用场景3：如何把云主机自动同步到JumpServer](https://github.com/starsliao/TenSunS/blob/main/docs/%E5%A6%82%E4%BD%95%E6%8A%8A%E4%B8%BB%E6%9C%BA%E8%87%AA%E5%8A%A8%E5%90%8C%E6%AD%A5%E5%88%B0JumpServer.md)
- #### [应用场景4：使用1个mysqld_exporter监控所有的MySQL实例](https://github.com/starsliao/TenSunS/blob/main/docs/%E5%A6%82%E4%BD%95%E4%BC%98%E9%9B%85%E7%9A%84%E4%BD%BF%E7%94%A8%E4%B8%80%E4%B8%AAmysqld_exporter%E7%9B%91%E6%8E%A7%E6%89%80%E6%9C%89%E7%9A%84MySQL%E5%AE%9E%E4%BE%8B.md)
- #### [应用场景5：使用1个redis_exporter监控所有的Redis实例](https://github.com/starsliao/TenSunS/blob/main/docs/%E4%BD%BF%E7%94%A8%E4%B8%80%E4%B8%AAredis_exporter%E7%9B%91%E6%8E%A7%E6%89%80%E6%9C%89%E7%9A%84Redis%E5%AE%9E%E4%BE%8B.md)


## 💖特别鸣谢
### 赞赏与关注公众号【**云原生DevOps**】加入交流群（请备注：后羿），获取更多...

**如果看不到图片请点击该链接：[https://starsl.cn/static/img/thanks.png](https://starsl.cn/static/img/thanks.png)**
![](https://starsl.cn/static/img/thanks.png)

---

### 💰赞赏
##### 🥇榜一大哥：**@浩哥**
##### 🥈榜二大哥：**@南城阿宇** **@weibw** **@星星**
##### 🥉榜三大哥：**@新的奇迹** **@李宫俊** **@锋** **@小明SQLBOY** **@Swancavalier** **@烂泥**

---

### ✅提交代码
**[@Yvan](https://github.com/406226161) [@ZZYhho](https://github.com/ZZYhho)** [@dbdocker](https://github.com/dbdocker) [@anatsking](https://github.com/anatsking) [@ylighgh](https://github.com/ylighgh)

---

### 🎃提交bug与建议
@会飞的鱼 [@奈](https://github.com/Wp516781950) @Swancavalier [@Show_Lo](https://github.com/ShowXian) @郑不错 @init @weibw  @Martin [@dong9205](https://github.com/dong9205) @MiracleWong [@dissipator](https://github.com/dissipator) @烂泥 [@SkipperSky](https://github.com/klllmxx)

---

### 🏆开源推荐
[🌉Go-Ldap-Admin: 基于Go+Vue实现的openLDAP后台管理项目](https://github.com/eryajf/go-ldap-admin)

---

## 💖感谢伟大的[Flask](https://github.com/pallets/flask)、[VUE](https://github.com/vuejs/vue)、[vue-admin-template](https://github.com/PanJiaChen/vue-admin-template)
