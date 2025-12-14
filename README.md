# 💎 PureStack ABAP Engineering Challenge: The OO Refactor

**PureStack.es - Engineering Validation Protocol.**
> *"We don't look for people who just maintain legacy code. We audit for Modern ABAP (7.50+)."*

---

### 📋 Context & Mission
Welcome to the PureStack Technical Validation Protocol for SAP ecosystem.
Unlike traditional recruiting, we don't ask for transaction codes. We audit your ability to write **Object-Oriented Design**, **Clean Code**, and **Modern ABAP** syntax without relying on the GUI.

**The Mission:** You are receiving a "Legacy" requirement. A class `ZCL_PS_REFACTOR` has been defined but requires implementation.
**The Constraint:** You do **not** need an SAP Server (NetWeaver) to pass this challenge. We validate your logic using **Static Analysis (abaplint)**.

### 🚦 Certification Levels (Choose your Difficulty)
Your seniority is defined by how much you leverage Modern ABAP features versus procedural statements. State your target level in your Pull Request.

#### 🥉 Level 3: Essential / Mid-Level
* **Focus:** Modern Syntax (7.40+) & Correctness.
* **Requirement:** Implement `calculate_total` passing the linter checks.
* **Tasks:**
    1.  **Refactor:** Implement the business logic using **Inline Declarations** (`DATA(lv_var)`).
    2.  **Clean Up:** Ensure no obsolete statements are used (e.g., use `=` instead of `MOVE`).
    3.  **Logic:** Calculate the total value of items safely.
* **Deliverable:** A syntactically correct class that passes the `abaplint` check (Green Light).

#### 🥈 Level 2: Pro / Senior
* **Focus:** Functional ABAP & Expression Oriented Programming.
* **Requirement:** Everything in Level 3 + **Functional Expressions**.
* **Extra Tasks:**
    1.  **No Loops:** Do NOT use `LOOP AT` for simple summations or lookups. Use **`REDUCE`**, **`FILTER`**, or **`VALUE`** operators.
    2.  **Exception Handling:** Implement a proper `TRY...CATCH` block for potential overflows or data inconsistencies.
    3.  **Readability:** Use `CORRESPONDING` or `COND` operators where applicable to reduce code lines.
* **Deliverable:** Concise, expressive code that demonstrates mastery of ABAP 7.50+.

#### 🥇 Level 1: Elite / Architect
* **Focus:** ABAP Unit & Testability.
* **Requirement:** Everything above + **Local Unit Tests (TDD)**.
* **Extra Tasks:**
    1.  **ABAP Unit:** Define a Local Test Class (`CLASS ltcl_test DEFINITION FOR TESTING...`) inside the include.
    2.  **Test Implementation:** Write a test method that mocks the input data and calls your `calculate_total` method, asserting the result using `cl_abap_unit_assert`.
        * *Note:* Even if the test cannot run strictly without a NetWeaver server, writing the **valid test code** proves you understand TDD in SAP.
    3.  **KISS Principle:** Ensure the complexity is low. Over-engineering will be penalized.
* **Deliverable:** A class that is not only functional but fully testable and self-documenting.

---

### 🛠️ Tech Stack & Constraints
* **Language:** ABAP (Version 7.50+ syntax).
* **Tooling:** abaplint (Node.js based linter) runs on GitHub Actions.
* **Paradigms:** ABAP Objects, Functional ABAP (`VALUE`, `REDUCE`, `COND`).
* **Environment:** No SAP Server required. Code is checked statically.

---

### 🚀 Execution Instructions

1.  **Fork** this repository.
2.  (Optional) Install abaplint locally to test: `npm install -g @abaplint/cli`.
3.  Open `src/zcl_ps_refactor.clas.abap`.
4.  **Implement the ABAP logic** directly in the file.
5.  Run checks locally: `abaplint` (or rely on the GitHub Action).
6.  Submit via **Pull Request** stating your target Level.

### 🧪 Evaluation Criteria (PureStack Audit)

| Criteria | Weight | Audit Focus |
| :--- | :--- | :--- |
| **Modern Syntax** | 35% | Usage of `DATA()`, `REDUCE`, `VALUE` vs legacy statements. |
| **Clean Code** | 30% | Variable naming, method length, and lack of obsolete keywords. |
| **Performance** | 20% | Avoiding nested loops or unnecessary table reads. |
| **Testability** | 15% | Presence of Local Unit Test classes (Level 1). |

---

### 🚨 Project Structure (Strict)
The linter is configured to only check files inside the `src` folder.

**Requirement:** Do NOT move or rename the `.abap` file.

```text
/
├── .github/workflows/   # PureStack Audit System (DO NOT TOUCH)
├── src/
│   └── zcl_ps_refactor.clas.abap  # <--- YOUR CODE GOES HERE
├── abaplint.json        # Linter rules (Standard Configuration)
└── README.md
