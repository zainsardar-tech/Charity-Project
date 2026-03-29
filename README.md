# 🌟 Pakistan-Based Blind Welfare Charity Admin System

A fully-featured, **100% Offline-Capable**, role-based Desktop Administration System tailored specifically to empower visually impaired individuals in Pakistan through streamlined NGO management. 

> **👨‍💻 Author & Lead Engineer:** [Zain Saradr](https://zasolpk.com)  
> **🔗 LinkedIn:** [linkedin.com/in/zain-saradr](https://linkedin.com/in/zain-saradr)  
> **🐙 GitHub:** [zainsardar-tech](https://github.com/zainsardar-tech)  
> **🌐 Website:** [zasolpk.com](https://zasolpk.com)

Built professionally with **Flutter (Dart), SQLite, and the Drift Reactive Database engine**, this software operates blazingly fast without relying on any active cloud internet connections.

---

## 🎯 Organizational Goal
To empower visually impaired members with absolute focus on:
- 🎓 **Education & Digital Skills**
- 🍲 **Food Support & Dietary Needs** 
- 🤝 **Mentorship & Social Inclusion**
...while allowing NGO managers and admins perfectly tracked, auditable, and easily exportable metrics.

## ⚙️ Core Architecture & Tech Stack

This software was engineered as a professional Native Desktop Application.
- **Frontend Framework:** Flutter (Dart) 
- **Desktop Targets:** Windows (`.exe`) & Linux (`.deb` / AppImage)
- **Local Persistence:** SQLite natively bundled
- **Database ORM:** Drift (formerly Moor) acting as the reactive bridging layer
- **State Management:** Riverpod 
- **Architecture Philosophy:** Glassmorphism Material 3 UI with hyper-focused role capabilities.

## 📦 Key System Modules

1. **👥 Member Management**: Braille requirements, granular progress tracking, skill enrollment, and daily meal logs mapped accurately to each visually impaired member.
2. **🤝 Volunteer System**: Mentorship paths, assigned events, and skill session instruction mapping.
3. **🏫 Education & Skills**: School/college allocations and distinct tracked Vocational vs. Digital skill sessions.
4. **🍽 Food & Meals**: Complete breakdown of daily scheduling, dietary restrictions, and special alert flags.
5. **💸 Donation Management**: Offline tracking of direct cash flow vs online donations, mapped to recurring projects.
6. **🏢 Project Initiatives**: NGO milestones mapped to specific administrative staff.
7. **🧾 Invoices & Expenses**: Vendor billing records mapping offline financial oversight.
8. **🔔 Internal CNS (Communication & Notification System)**: True offline pop-ups instantly alerting Admins/Managers locally directly via SQLite streaming queues.
9. **🛡 Audit & Reporting System**: Immutable trail capturing precisely who modified what UI logic and natively exporting it to Excel (CSV) or PDF.

---

## 🔒 Role-Based Access Controls

The entire interface operates exclusively under a rigid `Role-Based Check`:
- 👑 **Super Admin**: Absolute oversight. Unrestricted modification, CNS global triggers, PDF audit report exporting, and all system logs tracking.
- 🧑‍💼 **Manager**: Filtered scope focusing strictly on assigned projects, immediate skill-sessions, meal tracking, and attendance updates limiters.

---

*This application prioritizes absolute data ownership, 0% cloud dependency, and seamless local performance for secure charity oversight.*
