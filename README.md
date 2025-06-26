
## 🦄概述

提供自建主机/站点/MySQL/Redis配置管理、多云资源自动发现同步Prometheus监控以及JumpServer主机同步功能， 基于Consul的Web运维平台。

>**在原有的 TenSunS 上添加了的 HTTP/3 (QUIC) 支持, 以及动态化配置**

Blackbox Exporter for HTTP/3 参考:

[![Publish Docker image to Docker Hub](https://img.shields.io/badge/Publish%20Docker%20image%20to%20Docker%20Hub-latest-g?logo=docker)](https://hub.docker.com/r/zhengxiongzhao/blackbox-exporter-http3) 

---

## 💾部署说明

```bash
  prometheus-manager-ui:
    image: zhengxiongzhao/prometheus-manager-ui:latest
    restart: always
    environment:
      UPSTREAM: http://prometheus-manager-server:2026
    ports:
      - "8081:80"
    volumes:
      - /etc/localtime:/etc/localtime:ro
    depends_on:
      - prometheus-manager-server
    networks:
      - pms
  prometheus-manager-server:
    image: zhengxiongzhao/prometheus-manager-server:latest
    restart: always
    ports:
      - "2026:2026"
    volumes:
      - /etc/localtime:/etc/localtime:ro
    environment:
      consul_token: 38838D51-91A0-440A-B387-138BC58B2943
      consul_url: http://consul:8500/v1
      admin_passwd: admin1
      log_level: INFO
    depends_on:
      - consul
    networks:
      - pms
  consul:
    image: consul:1.15.4
    restart: always
    ports:
      - "8500:8500"
    volumes:
      - /etc/localtime:/etc/localtime:ro
      - ./data/consul:/consul/data
      - ./etc/consul/config:/consul/config
    command: "agent"
    networks:
      - pms
networks:
  pms:
    name: pms
    driver: bridge
    ipam:
      driver: default
```

```bash
docker compose up
```

登录地址： http://localhost:8081
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


