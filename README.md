# 💎 PureStack ABAP Engineering Challenge: The OO Refactor

### Context
Welcome to the **PureStack Technical Validation Protocol** for SAP.
Unlike traditional recruiting, we don't look for people who just "make it work" with spaghetti code. We audit for **Modern ABAP (7.40+)**, **Object-Oriented Design**, and **Clean Code**.

**⚠️ The Standard:** This repository uses **abaplint**. If your code contains syntax errors or obsolete statements (like `MOVE` instead of `=`), the automated audit will fail.

---

### 🎯 The Objective
You are receiving a legacy requirement. A class `ZCL_PS_REFACTOR` has been defined but not implemented correctly.
Your mission is to implement the logic using **Modern ABAP** techniques.

1.  **Refactor:** Implement the method `calculate_total`.
2.  **Constraint:** Do NOT use `LOOP AT` for simple summations. Use `REDUCE` or similar functional expressions.
3.  **Clean Code:** Ensure variables are named correctly and no obsolete keywords are used.

---

**Requirement:** Do not move the `.abap` file out of the `src/` folder.

### 🚨 CRITICAL: How to work without SAP
You do **not** need an SAP Server (NetWeaver) to pass this challenge.

1. We check your logic using **Static Analysis**.
2. You can write the code in VS Code (recommended extension: *ABAP remote filesystem*) or any text editor.
3. As long as the syntax is valid according to ABAP v7.50 standards, you pass.

### 🛠️ Tech Stack Requirements
* **Language:** ABAP (Version 7.50+ syntax).
* **Tooling:** abaplint (Node.js based linter).
* **Paradigms:** ABAP Objects, Functional ABAP (`VALUE`, `REDUCE`, `COND`).

### 🧪 Evaluation Criteria (How we audit you)
We will clone your repo and run `npm run abaplint`. We look for:

* **Green Lights:** Your code must pass the GitHub Actions workflow.
* **Modern Syntax:** Usage of inline declarations (`DATA(lv_var)`).
* **Performance:** Avoiding nested loops where possible.
* **Code Cleanliness:** No dead code, no "magic numbers".

### 🚀 Getting Started
1. **Fork** this repository.
2. (Optional) Install abaplint locally to test: `npm install -g @abaplint/cli`.
3. Open `src/zcl_ps_refactor.clas.abap`.
4. **Implement the ABAP logic**.
5. Run checks locally: `abaplint` (or rely on the GitHub Action).
6. Submit via Pull Request.

### 📂 Bonus Points (Elite Level)
* Add a **Unit Test Local Class** (`CLASS ltcl_test DEFINITION FOR TESTING...`) inside the include. Even if it doesn't run on the server, showing you know how to write `cl_abap_unit_assert` scores high.

---

### 🚨 CRITICAL: Project Structure
To ensure our **Automated Auditor** works correctly, you **MUST** respect this structure.
The linter is configured to only check files inside the `src` folder.

**Requirement:** Do not move the `.abap` file out of the `src/` folder.

```text
/
├── .github/workflows/   # PureStack Audit System (DO NOT TOUCH)
├── src/
│   └── zcl_ps_refactor.clas.abap  # <--- YOUR CODE GOES HERE
├── abaplint.json        # Linter rules (DO NOT TOUCH)
└── README.md
