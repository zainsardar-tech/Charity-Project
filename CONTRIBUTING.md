# Contributing to the Administrator System

First off, thanks for taking the time to contribute to the **Pakistan-Based Blind Welfare Charity Admin System**! 🎉

Because this software is built explicitly for managing sensitive offline records regarding visually impaired charity members, we expect strict adherence to our architecture mappings and our custom Riverpod/Drift data flows.

## 🛠 Setting up your Machine
Please see the [`INSTALL.md`](INSTALL.md) file to locally configure the Flutter Offline-Target Desktop toolchain on your respective Linux or Windows workstation.

## Branching Strategy
We follow a very standard `GitHub Flow`:
1. **Fork** the repository and clone your fork locally.
2. checkout a new `feature/` or `bugfix/` branch off `main`.
3. Keep your PR scope incredibly narrow and explicitly mention what DB Tables or offline Streams you are touching.
4. Push your commits and open a standard Pull Request (PR) directly against the `main` repo.

## 🗄 Drift Database Rules
If your contribution requires altering a database table or adding entirely new tracking semantics:
1. First, modify the abstract classes explicitly located in `lib/database/tables.dart`.
2. Do **NOT** manually edit `lib/database/database.g.dart` output files under any circumstances! They are generated mechanically by Drift.
3. You must execute `dart run build_runner build` locally so Drift natively rebuilds the specific SQL mapping constraints before you push your commits.

## Bugs & Vulnerabilities
If you notice a problem with the SQLite native interactions, or the Internal Alert popups stop spawning globally off the stream channels, please open an Issue with reproducible steps prioritizing logs exported cleanly from the `Audit & Reports` offline modules.
