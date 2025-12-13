# 🏢 PureStack SAP Engineering Challenge: The Clean ABAP Protocol

### Context
Welcome to the PureStack Technical Validation Protocol for the SAP Ecosystem.
We do not look for consultants who just "make it work". We look for engineers who build maintainable, robust, and **Modern ABAP** solutions.

**⚠️ The Standard:** We strictly forbid obsolete procedural statements (e.g., `HEADER LINE`, `FORM/PERFORM`). We expect **ABAP OO** and **New Syntax (7.40+)**.

---

### 🎯 The Objective: Refactoring "The Monolith"
You are given a requirement to handle a **Sales Order Approval Process**.
Instead of writing a chaotic Report, you must design a robust **Object-Oriented Solution**.

**The Requirement:**
1.  Read Sales Orders (headers and items) for a specific customer.
2.  Calculate the total net value.
3.  If the total > 10,000 EUR, trigger an "Approval Workflow" (Simulated).
4.  If the total <= 10,000 EUR, auto-release the order.

### 🛠️ Tech Stack Requirements
* **Language:** ABAP (NetWeaver 7.40 or higher syntax).
* **Methodology:** Object-Oriented Programming (Global or Local Classes).
* **Format:** Plain text `.abap` files OR **abapGit** XML format (Preferred).
* **Testing:** **ABAP Unit** (Local Test Classes) is mandatory.

### 🧪 Evaluation Criteria (How we audit you)
Since we run an offline audit, we review your code structure for:

1.  **Modern Syntax:** Usage of inline declarations (`DATA(var)`), value operators (`VALUE #( )`), and functional calls.
2.  **Separation of Concerns:** Do you have separate classes for Data Access (DAO), Business Logic (Model), and Output?
3.  **Clean Code:** Naming conventions, no magic numbers, and clear method signatures.
4.  **ABAP Unit:** Did you mock the database access to test the logic in isolation?

### 🚀 Getting Started

1.  **Fork** this repository.
2.  Create your solution files (e.g., `zcl_sales_approval.clas.abap`).
3.  **Constraint:** You cannot rely on standard tables (VBAK/VBAP) existing in our review system. You must define Types or Interfaces to abstract them.
4.  Write a local test class (`ltcl_test`) validating the >10k logic.
5.  Submit via Pull Request.

> **Note:** If you don't have access to an SAP System, you can write the code in any editor. We check for *syntax correctness* and *architectural design*, not run-time execution.

---

### 📂 Bonus Points (Elite Level)
* Use **Exception Classes** (`CX_...`) instead of `SY-SUBRC` checks.
* Implement the **Factory Pattern** to instantiate your classes.


* Provide the solution in **abapGit** compatible format.

> **PureStack Engineering.** Validated by Code.
