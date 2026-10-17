<div align="center">
  <a href="../README.md">⬅️ <b>Back to TryHackMe Tracker</b></a>
</div>

<br>

<div align="center">
  <h1>🤖 [Room Name] Walkthrough 🤖</h1>
  <p><b>Platform:</b> TryHackMe | <b>Difficulty:</b> [Easy / Medium / Hard / Insane] | <b>Target IP:</b> [Target IP] | <b>Target OS:</b> [Linux / Windows]</p>
  <p><i>Date Completed: YYYY-MM-DD</i></p>

[![Platform - TryHackMe](https://img.shields.io/badge/Platform-TryHackMe-red?style=flat-square&logo=tryhackme)](https://tryhackme.com/)
[![Difficulty](https://img.shields.io/badge/Difficulty-[Difficulty]-[Color]?style=flat-square)](./README.md)
[![Status - Solved](https://img.shields.io/badge/Status-Solved-success?style=flat-square&logo=checkmarx)](./README.md)
[![MITRE ATT&CK](https://img.shields.io/badge/MITRE%20ATT%26CK-Mapped-orange?style=flat-square)](https://attack.mitre.org/)
</div>

---

## 🎯 Target & Mission Objective
> **[1-2 sentence executive summary explaining the target machine, initial vulnerability exploited, and ultimate privilege escalation path to root/administrator.]**

- **Target IP:** `[Target IP]`
- **Target Operating System:** [Linux / Windows]
- **Key Services Audited:** [e.g. Apache httpd, OpenSSH, SMB, MySQL]

<div align="center">
  <img src="./images/01-room-overview.png" alt="[Descriptive alt text for room interface overview]" width="700px">
  <br><i>Figure 0: TryHackMe room overview and target details.</i>
</div>

<br>

## 🛠️ Tools & Technologies Used
| Tool | Purpose in Assessment |
| :--- | :--- |
| **Nmap** | Initial port scanning, OS detection, and service banner enumeration. |
| **Gobuster / Feroxbuster** | Web directory and file brute-forcing. |
| **[Credential Tool]** | [e.g. John the Ripper / Hashcat / Hydra for password cracking] |
| **[Exploit / Privesc Tool]** | [e.g. Metasploit / Sudo / GTFOBins for privilege escalation] |

<br>

---

## 🗺️ MITRE ATT&CK® Enterprise Mapping
| Tactic | Technique ID | Technique Name | Description in Challenge |
| :--- | :--- | :--- | :--- |
| **Reconnaissance** | `T1595.002` | Active Scanning: Vulnerability Scanning | Service banner grabbing and directory enumeration |
| **Discovery** | `T1083` | File and Directory Discovery | Discovering exposed web endpoints and configuration files |
| **Initial Access** | `T1190` / `T1078` | [Exploit Public-Facing App / Valid Accounts] | [Initial foothold acquisition vector] |
| **Privilege Escalation**| `T1548.003` | Abuse Elevation Control: Sudo and Sudoers | [Local privilege escalation vector] |
| **Collection** | `T1005` | Data from Local System | Retrieving user and root challenge flags |

<br>

---

## 🔍 1. Reconnaissance & Enumeration

### 🌐 Network Scanning
We begin with an Nmap service version and script scan (`-sV -sC`) against the target host:

```bash
nmap -sV -sC [TARGET_IP]
```

<div align="center">
  <img src="./images/02-nmap-scan.png" alt="[Descriptive alt text for Nmap scan results]" width="700px">
  <br><i>Figure 1: Initial port scan and service version results.</i>
</div>

### 📂 Directory & Content Fuzzing
Probe the web application for hidden files, administrative portals, or backup archives:

```bash
gobuster dir -u http://[TARGET_IP]/ -w /usr/share/wordlists/dirb/common.txt -x php,txt,html,bak,old,zip
```

<div align="center">
  <img src="./images/03-directory-fuzzing.png" alt="[Descriptive alt text for directory fuzzing results]" width="700px">
  <br><i>Figure 2: Discovery of accessible directories and sensitive endpoints.</i>
</div>

<br>

---

## 🚪 2. Exploitation & Initial Foothold

### 🔐 Vulnerability Verification & Exploit Execution
[Detail payload development, credential cracking, file upload bypass, or service exploit.]

```bash
[exploit or authentication command]
```

<div align="center">
  <img src="./images/04-foothold.png" alt="[Descriptive alt text for initial shell access]" width="700px">
  <br><i>Figure 3: Establishing initial shell access as an unprivileged user.</i>
</div>

Reading the user flag:
```bash
cat /home/[user]/user.txt
```

<br>

---

## ⚡ 3. Local Privilege Escalation

### ⚙️ Privilege Auditing & Elevation Vector
[Document internal enumeration (`sudo -l`, SUID search, capabilities, cron jobs, or kernel exploits).]

```bash
sudo -l
```

<div align="center">
  <img src="./images/05-privilege-escalation.png" alt="[Descriptive alt text for privilege escalation]" width="700px">
  <br><i>Figure 4: Exploiting privilege delegation to compromise root.</i>
</div>

Spawning a root shell and reading the root flag:
```bash
[root command]
whoami
cat /root/root.txt
```

<br>

---

## 🏁 4. Captured Flags

| Flag Name | Value | Discovery Location |
| :--- | :--- | :--- |
| **User Flag** | `flag{[USER_FLAG_HERE]}` | `/home/[user]/user.txt` |
| **Root Flag** | `flag{[ROOT_FLAG_HERE]}` | `/root/root.txt` |

<br>

---

## 🛡️ 5. Vulnerability Risk Ratings & Defensive Hardening

### 📊 CVSS v3.1 Findings Matrix
| Finding | Severity | CVSS v3.1 Score | Vector String |
| :--- | :---: | :---: | :--- |
| **[Privilege Escalation Flaw]** | 🔴 **Critical** | **[Score]** | `CVSS:3.1/AV:L/AC:L/PR:L/UI:N/S:C/C:H/I:H/A:H` |
| **[Initial Foothold Weakness]** | 🔴 **High** | **[Score]** | `CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:N/A:N` |

<br>

<details>
<summary><b>Click to expand root cause analysis & secure implementation guide</b></summary>
<br>

### 📌 1. [Vulnerability Title 1]
- **Root Cause:** [Detailed explanation of why the vulnerability was present.]
- **Remediation:** [Practical hardening recommendations and configuration snippets.]
  ```bash
  # Example defensive configuration or code pattern
  ```

### 📌 2. [Vulnerability Title 2]
- **Root Cause:** [Detailed explanation of why the vulnerability was present.]
- **Remediation:** [Practical hardening recommendations.]
</details>

<br>

---

## 🧠 6. Key Learnings & Takeaways
- **[Lesson 1]:** Primary reconnaissance or enumeration breakthrough.
- **[Lesson 2]:** Critical privilege escalation takeaway or GTFOBins insight.
- **[Lesson 3]:** Practical advice for exam scenarios or red-team engagements.

---
<div align="center">
  <i>Walkthrough completed on YYYY-MM-DD. Documented for TryHackMe Portfolio.</i>
</div>
