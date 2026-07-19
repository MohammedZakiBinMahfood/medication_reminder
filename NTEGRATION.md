# INTEGRATION.md

# Integration Rules for Medication Reminder

This document defines how every Feature communicates with the rest of the application.

It is mandatory for every AI Agent to read this file before implementing any new Feature.

The goal is to keep the application cohesive and prevent isolated implementations.

---

# General Rules

## 1. Never build isolated Features

Every new Feature MUST inspect the existing codebase before generating code.

Before creating:

- Repository
- Provider
- Service
- Model
- Widget

Search for an existing implementation.

If one exists:

- reuse it
- extend it
- modify it

Do NOT duplicate functionality.

---

## 2. Modify Existing Code When Needed

Creating new files is allowed.

However,

updating existing files is REQUIRED whenever integration is needed.

Examples:

- adding listeners
- connecting providers
- refreshing screens
- registering services
- dependency injection

Do not leave TODO comments.

---

## 3. Repositories Are The Single Source of Truth

Features never communicate directly.

They communicate through repositories.

Correct

Dashboard
↓

MedicationRepository

↓

Isar

Wrong

Dashboard

↓

MedicationCrudNotifier

---

## 4. Providers Never Access Database

Providers only communicate with repositories.

Never access:

- Isar
- Notification Plugins
- Storage

inside Providers.

---

## 5. UI Never Contains Business Logic

Screens

Widgets

Components

must only display data.

Business logic belongs to:

Repositories

Services

Notifiers

---

# Feature Dependency Graph

Medication CRUD
│
├────────────► Notification Engine
│
├────────────► Today Dashboard
│
├────────────► Compliance History
│
└────────────► Statistics

Notification Engine
│
├────────────► DoseLog Repository
│
├────────────► Today Dashboard
│
└────────────► Compliance History

DoseLog Repository
│
├────────────► Dashboard
├────────────► History
└────────────► Future Analytics

---

# Medication Management

Owns

- Medication
- MedicationSchedule

Responsibilities

- CRUD
- Validation
- Activation
- Deactivation

Must notify

- Notification Engine
- Dashboard
- History

after successful changes.

---

# Notification Engine

Owns

- Scheduling
- Cancelation
- Permissions
- Boot Handling
- Snooze
- Notification Actions

Must NEVER

- access UI
- use Dashboard Providers
- use History Providers

Must ONLY

- call repositories
- update DoseLog
- schedule notifications

---

# Today Dashboard

Displays today's medications.

Must reuse

MedicationRepository

DoseLogRepository

NotificationManager

Never create local medication state.

Dashboard is a read-only projection.

Dashboard refreshes automatically when

- medication added
- medication edited
- medication deleted
- dose logged
- notification action
- app resumed
- date changed

---

# Compliance History

History is read-only.

Must read only from

DoseLogRepository.

Never modify historical records.

Must automatically update after

Taken

Skipped

Missed

Snoozed

events.

Soft deleted medications remain visible in history.

---

# Settings

Settings own only

Application Preferences.

Examples

Theme

Language

Reminder Preferences

Snooze Duration

Permission State

Never duplicate Notification settings.

Always update NotificationManager.

---

# Statistics

Statistics never own data.

They calculate values from

DoseLogRepository.

Examples

Adherence

Completion %

Current Streak

Longest Streak

Missed Rate

Average Daily Compliance

---

# Search

Search logic belongs inside repositories.

Screens only pass filters.

Never filter large collections in UI.

---

# Filtering

Filtering belongs inside repositories.

Providers only hold filter state.

---

# Notifications

Only NotificationManager may communicate with

flutter_local_notifications.

No other layer may schedule notifications.

---

# Navigation

Always use

CNavigator

Never use

Navigator

GoRouter

AutoRoute

or any third-party routing library.

---

# Components

Always use reusable project components.

Examples

CScaffold

CText

CTextField

CButton

CCard

CDialog

CAppBar

AsyncView

Never replace them with raw Flutter widgets if an equivalent component exists.

---

# Riverpod

Follow SKILLS.md exactly.

Each Feature owns

StateNotifier

CrudNotifier

ListNotifier

FiltersProvider

FormProvider

Barrel exports

Never duplicate providers.

---

# Shared Infrastructure

Reuse existing

UuidService

DateTimeService

Validators

Extensions

Result Extensions

AppConfig

Enums

Never recreate shared utilities.

---

# Localization

Every new user-facing string must be added to

app_en.arb

app_ar.arb

Never hardcode text.

---

# Dependency Injection

All dependencies must be injected through Riverpod.

Never instantiate repositories manually.

Wrong

final repo = MedicationRepositoryImpl();

Correct

ref.read(medicationRepositoryProvider);

---

# Database

Only Repository Implementations know about Isar.

Collections never know about

Domain Models

Repositories

Providers

UI

Mapping must always happen through dedicated Mapper classes.

---

# Code Generation

Whenever dart_mappable or Isar models change

always run

dart run build_runner build --delete-conflicting-outputs

before finishing.

---

# Validation

Always use

ValidationController

Never duplicate validation logic inside screens.

---

# Integration Checklist

Before considering a Feature complete, verify:

☐ Existing repositories reused.

☐ Existing providers reused.

☐ Existing services reused.

☐ Existing components reused.

☐ Existing models extended when possible.

☐ Existing screens refreshed automatically.

☐ Localization updated.

☐ Dependency Injection updated.

☐ Barrel exports updated.

☐ build_runner executed.

☐ dart analyze passes.

☐ flutter test passes.

---

# Deliverables

Every implementation must return:

## New Files

List every newly created file.

## Modified Files

List every modified existing file.

## Integration Points

Explain exactly how the new Feature integrates with

Medication Management

Notification Engine

Today Dashboard

Compliance History

Settings

Shared Infrastructure

## Verification

Confirm

- build_runner
- dart analyze
- flutter test

completed successfully.

---

Failure to follow this document means the implementation is incomplete.