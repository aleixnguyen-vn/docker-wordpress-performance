# Dockerized WordPress Stack - 5,000 Concurrent Users on 1GB RAM VPS

![Benchmark](https://img.shields.io/badge/Benchmark-5000_users_187ms-blue?style=flat&logo=loader.io)
![Redis Hit Rate](https://img.shields.io/badge/Redis_Hit_Rate-99.93%25-brightgreen?style=flat&logo=redis&logoColor=white)
![Lighthouse](https://img.shields.io/badge/Lighthouse-93/100-yellow?style=flat&logo=googlechrome)
![Docker](https://img.shields.io/badge/Docker-Compose-2496ED?style=flat&logo=docker)

> [!Note]
> This stack (v2.0) has been superseded by the production infrastructure in
> [simracing-community-platform-stack](https://github.com/aleixnguyen-vn/simracing-community-platform-stack).
> Preserved as a benchmark reference.

Performance benchmark for a Dockerized WordPress stack on a $6 Vultr VPS (1 vCPU / 1GB RAM).
Objective: validate the upper load limit of a single-node stack before committing to production architecture.

---

## Stack

| Component | Detail |
|---|---|
| VPS | Vultr 1 vCPU / 1GB RAM / 25GB NVMe SSD |
| OS | Ubuntu 22.04 LTS |
| Web Server | NGINX + Caddy (reverse proxy, SSL, HTTP/3) |
| CMS | WordPress + PHP 8.2-FPM |
| Database | MariaDB 10.5 |
| Cache | Redis Object Cache |
| CDN | Cloudflare (free plan) |

---

## Benchmark Results

**Tool:** Loader.io
**Scenario:** 5,000 concurrent clients over 60 seconds, all requests to homepage (Redis-cached)

| Metric | Value |
|---|---|
| Avg Response Time | 187ms |
| Max Latency | 391ms |
| Redis Hit Rate | 99.93% (241,595 hits / 179 misses) |
| Success Rate | 100% |
| Errors / Timeouts | 0 |
| Peak RAM Usage | ~431MB |
| CPU | 2-6% |

Cache warmed purely by live traffic with no manual preload.

---

## Screenshots

**Loader.io - warm cache, 5,000 users**
![Loader.io 5000 users 187ms](screenshots/loaderio-5000users-valid-187ms.png)

**Loader.io - cold start**
![Cold start 5000 users](screenshots/loader_cold_start_5000.png)

**Lighthouse score - 93/100**
![Lighthouse](screenshots/google_lighthouse.png)

**Redis hit rate**
![Redis CLI](screenshots/redis_cli_info.png)

**Docker stats + htop during load test**
![Docker Stats](screenshots/docker_stats_5000.png)
![htop](screenshots/htop_during_bench.png)

**Chrome DevTools - TTFB, cache headers, HTTP/3**
![Network Tab](screenshots/chrome_network_tab.png)

**Project layout**
![Folder Structure](screenshots/folder_stucture.png)

**Benchmark environment - Vultr 1GB VPS**
![Vultr](screenshots/vultr_1gb_ram_frankfurt.png)
