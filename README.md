<div align="center">

# 🎯 TryHackMe — Penetration Testing & CTF Portfolio

<p>
  <b>Hands-on machine exploitation write-ups, vulnerability analysis, and privilege escalation methodologies across TryHackMe security labs.</b>
</p>

[![Platform - TryHackMe](https://img.shields.io/badge/Platform-TryHackMe-red?style=for-the-badge&logo=tryhackme&logoColor=white)](https://tryhackme.com/)
[![Rooms Solved](https://img.shields.io/badge/Rooms%20Completed-1%20Solved-success?style=for-the-badge&logo=checkmarx&logoColor=white)](./README.md)
[![Flags Captured](https://img.shields.io/badge/Flags%20Captured-2%20%2F%202%20(100%25)-brightgreen?style=for-the-badge&logo=adblock&logoColor=white)](./README.md)
[![Standards](https://img.shields.io/badge/Frameworks-MITRE%20ATT%26CK%20%7C%20CVSS%20v3.1-orange?style=for-the-badge&logo=shield&logoColor=white)](https://attack.mitre.org/)

</div>

---

## 📌 Executive Summary

Welcome to my central **TryHackMe** walkthrough repository. This portfolio documents verified machine compromise methodologies, network service reconnaissance, initial foothold exploitation, and local privilege escalation vectors developed across TryHackMe practice machines and certification learning paths.

Every room walkthrough adheres to professional penetration testing reporting standards:
- **Reproducible Methodology:** Step-by-step terminal commands, custom scripts, and payload syntax.
- **Visual Evidence:** Sequenced, high-resolution screenshots capturing every exploitation milestone.
- **Enterprise Threat Alignment:** Mapped to **MITRE ATT&CK® Enterprise** tactics and techniques.
- **Quantitative Risk Evaluation:** Evaluated with **CVSS v3.1** base metrics and vector strings.
- **Defensive Remediation:** Practical hardening guidance and secure code/script patterns to mitigate identified weaknesses.

<details>
<summary><b>🔍 GitHub Repository SEO Metadata & Discovery Tags (Click to expand)</b></summary>
<br>

To ensure maximum discoverability on GitHub Search and Google, this repository targets the following taxonomy:

- **Repository Description:**
  > *In-depth TryHackMe CTF walkthroughs and offensive security write-ups covering Linux and Windows privilege escalation, web application vulnerabilities, and network service exploitation.*

- **Targeted GitHub Topics:**
  `tryhackme` • `tryhackme-walkthrough` • `thm-writeups` • `penetration-testing` • `ctf-walkthrough` • `privilege-escalation` • `cyborg-thm` • `borg-backup` • `mitre-attack` • `cvss-v3` • `ethical-hacking` • `infosec` • `security-research` • `linux-privilege-escalation` • `gtfobins`
</details>

<br>

---

## 🧭 Difficulty & Track Progression Scorecard

| Room Category / Difficulty | Active Rooms | Completed | Primary Competencies & Focus Areas |
| :--- | :---: | :---: | :--- |
| 🟢 **Easy Rooms** | — | 🟡 *Planned* | Basic port scanning, anonymous FTP/SMB, weak web passwords, basic SUID |
| 🟡 **Medium Rooms** | 1 | 🟢 **1 / 1** | Hash cracking, backup archive forensics, sudo script command injection, web shells |
| 🔴 **Hard Rooms** | — | 🟡 *Planned* | Web application CVE exploitation, pivoting, Active Directory, advanced privesc |
| 🟣 **Insane Rooms** | — | 🟡 *Planned* | Multi-host networks, custom buffer overflows, chained kernel exploits |
| 🎓 **Learning Paths** | — | 🟡 *Planned* | Jr Penetration Tester, Offensive Pentesting, Web Fundamentals |

<br>

---

## 🏆 Completed Machines & Technical Walkthroughs

| Date | Machine Name | OS | Difficulty | Key Vulnerabilities & Exploitation Path | Flags | Walkthrough Link |
| :--- | :--- | :---: | :---: | :--- | :---: | :---: |
| 2026-10-01 | **Cyborg** | 🐧 Linux | 🟡 Medium | Apache directory indexing, Squid proxy password cracking (`md5crypt`), Borg encrypted backup extraction, Sudo script command injection (`backup.sh -c`) | 2 / 2 | [Read Walkthrough](./cyborg/README.md) |

<br>

---

## 🔬 Attack Vectors & Vulnerability Matrix

Cross-reference of demonstrated offensive skills against industry vulnerability classifications:

| Vulnerability / Attack Surface | Standard Mapping | Machine Demonstrating Skill | Severity |
| :--- | :--- | :--- | :---: |
| **Sudo Command Substitution Injection** | MITRE ATT&CK `T1548.003` | [Cyborg](./cyborg/README.md) | 🔴 **Critical (9.8)** |
| **Encrypted Backup Archive Exposure (Borg)**| MITRE ATT&CK `T1005` | [Cyborg](./cyborg/README.md) | 🔴 **High (7.5)** |
| **Sensitive Configuration & Hash Exposure** | OWASP A05:2021 — Security Misconfiguration | [Cyborg](./cyborg/README.md) | 🔴 **High (7.5)** |
| **Weak Password Hashing (`md5crypt`)** | OWASP A02:2021 — Cryptographic Failures | [Cyborg](./cyborg/README.md) | 🟡 **Medium (5.3)** |

<br>

---

## 🛠️ Repository Workflow & Automation

Scaffold new room walkthroughs in a single command using the built-in PowerShell generator:

```powershell
.\new-room.ps1 -Room "Pickle Rick" -Difficulty "Easy" -TargetOS "Linux" -TargetIP "10.10.x.x"
```

*Automatically creates room directories, copies `template.md` as `README.md`, provisions `images/` and `scripts/`, pre-fills metadata, and appends the room to this tracker.*

<br>

---

## ⚖️ Disclaimer & Code of Ethics
All security evaluations, vulnerability research, and exploit demonstrations documented in this repository were conducted strictly in authorized, isolated CTF lab environments provided by **TryHackMe** for educational and certification training purposes. These techniques must never be applied against unauthorized systems or computer networks without prior explicit written consent.
