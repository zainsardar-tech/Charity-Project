# 👤 Official User Manual

Welcome to the **Pakistan-Based Blind Welfare Administration System**. This application is engineered exclusively for local, private NGO tracking and data auditing.

## 🔐 1. Role-Based Login

Upon launching the application executable, you must authenticate based on your designated scope mapping:
- **Super Admins**: Utilize the Super Admin credentials (e.g., `admin123`) to access full system control.
- **Managers**: Use the Manager credentials (e.g., `manager123`) which automatically filters out high-level Audits & specific CNS capabilities.

---

## 🧭 2. Core Workflows

### The CNS (Communication & Notification System)
This module eliminates the need for SMS or an internet connection.
- **Reading Alerts**: The global `🔔 Bell Icon` at the top right listens instantly to the SQLite streams. When an alert arrives, a massive Desktop Overlay popup will trigger.
- **Broadcasting Alerts (Admins Only)**: Navigate to the `System Notifications` sidebar tab. Enter the Priority (Urgent, Medium, Low) and Recipient mapping. The Database instantly fires it to active managers across the UI. You can also view the `Scheduled` recurring popups.

### Member Management & Verification
1. Open the `Members` Panel.
2. Click **Add Member**.
3. **Disability Profiling**: Explicitly flag whether they suffer from `Total Blindness` or `Low Vision`.
4. **Braille Need Check**: You *must* toggle the "Braille Allocation" module properly, otherwise their skill resources might not properly queue.
5. **Skill Assignments**: Log exactly what offline vocational or digital tracking they are enrolling in.
6. Check **"Progress Reports"** via the member profile sheet to natively audit their history.

### Volunteer & Task Tracking
Assign specific Tasks directly linked to active Skill Sessions. The `Attendance & Access Control` dashboard will let you explicitly map Daily checks cross-referencing Both Volunteers and their designated blind visually impaired members.

### Exporting & Reporting
If an absolute paper-trail or deep-dive analysis is requested:
1. Navigate to the `Audit & Reports` tab (Admins Only).
2. Choose either **Export PDF** (for standardized, printable overviews) or **Export Excel/CSV** for raw bulk data analysis.
3. This creates a fully offline snapshot of all interactions, Meal Logs, and Donation Histories for physical record keeping.
