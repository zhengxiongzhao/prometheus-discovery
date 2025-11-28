
## 🦄概述

提供自建主机/站点/MySQL/Redis配置管理、多云资源自动发现同步Prometheus监控以及JumpServer主机同步功能， 基于Consul的Web运维平台。

>**在原有的 TenSunS 上添加了的 HTTP/3 (QUIC) 支持, 以及动态化配置**

Blackbox Exporter for HTTP/3 参考: [![Publish Docker image to Docker Hub](https://img.shields.io/badge/Publish%20Docker%20image%20to%20Docker%20Hub-latest-g?logo=docker)](https://hub.docker.com/r/zhengxiongzhao/blackbox-exporter-http3) 

---

## 💾部署说明

```bash
wget https://github.com/zhengxiongzhao/prometheus-discovery/tree/main/etc.zip && unzip etc.zip
wget https://github.com/zhengxiongzhao/prometheus-discovery/tree/main/docker-compose.yaml
docker compose up

管理平台
登录地址： http://localhost:8081
用户名/密码： admin/admin1

监控平台 Grafana
登录地址： http://localhost:8001
用户名/密码： admin/admin
```


## 🎨截图预览

<details><summary>💥点击展开</summary>

### ECS Manager
![](https://raw.githubusercontent.com/zhengxiongzhao/prometheus-discovery/main/screenshot/0.png)
### Blackbox Manager
![](https://raw.githubusercontent.com/zhengxiongzhao/prometheus-discovery/main/screenshot/1.png)
### Node Exporter Dashboard 
![](https://raw.githubusercontent.com/zhengxiongzhao/prometheus-discovery/main/screenshot/2.png)
### Blackbox Exporter Dashboard 
![](https://raw.githubusercontent.com/zhengxiongzhao/prometheus-discovery/main/screenshot/3.png)

</details>


