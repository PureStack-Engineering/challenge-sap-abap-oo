# 💎 PureStack ABAP Engineering Challenge: The OO Refactor

**PureStack.es - Engineering Validation Protocol.**
> *"We don't look for people who just maintain legacy code. We audit for Modern ABAP (7.50+)."*

---

### 📋 Context & Mission
Welcome to the PureStack Technical Validation Protocol for the SAP ecosystem.
Unlike traditional recruiting, we don't ask for transaction codes. We audit your ability to write **Object-Oriented Design**, **Clean Code**, and **Modern ABAP** syntax.

**The Mission:** You are receiving a "Legacy" class (`ZCL_PS_REFACTOR`) that calculates loan interest rates. The logic works, but it's written in archaic ABAP (Nested IFs, no separation of concerns).
**The Goal:** Refactor the method `calculate_loan` to use Modern ABAP syntax without breaking the business logic.

### 🚦 Certification Levels (Choose your Difficulty)
State your target level in your Pull Request.

#### 🥉 Level 3: Essential / Mid-Level
* **Focus:** Modern Syntax (7.40+) & Readability.
* **Requirement:** Refactor the existing logic to be cleaner.
* **Tasks:**
    1.  **Inline Declarations:** Replace old `DATA: ...` statements with inline data (`DATA(lv_var)`).
    2.  **Constants:** Replace "Magic Numbers" (e.g., `100000`, `10`, `5.0`) with proper private Constants (`co_threshold_high`, `co_rate_vip`).
    3.  **Cleanup:** Remove the nested `IF/ELSE` hell where possible.
* **Deliverable:** A clean class where the logic is easy to read.

#### 🥈 Level 2: Pro / Senior
* **Focus:** Functional Expressions (Expression Oriented Programming).
* **Requirement:** Everything in Level 3 + **SWITCH & COND**.
* **Extra Tasks:**
    1.  **Switch:** Replace the `IF iv_customer = 'VIP'...` logic with a `SWITCH #( ... )` constructor.
    2.  **Cond:** Replace the numeric comparisons for logic with `COND #( ... )`.
    3.  **Refactoring:** The method should ideally be reduced to 1-3 statements using functional chaining, removing all intermediate variables if possible.
* **Deliverable:** Concise, expressive code that demonstrates mastery of ABAP 7.50+.

#### 🥇 Level 1: Elite / Architect
* **Focus:** ABAP Unit & TDD.
* **Requirement:** Everything above + **Unit Testing**.
* **Extra Tasks:**
    1.  **Test Class:** Open `src/zcl_ps_refactor.clas.testclasses.abap`.
    2.  **Coverage:** Implement a Test Class (`ltcl_test`) that instantiates your class and verifies the output for:
        * A VIP Customer.
        * A Standard Customer with High Amount.
        * A Standard Customer with Low Amount.
    3.  **Assertions:** Use `cl_abap_unit_assert=>assert_equals` to validate results.
* **Deliverable:** A class that is not only functional but fully testable and verified by code.

---

### 🛠️ Tech Stack & Constraints
* **Language:** ABAP (Version 7.50+ syntax).
* **Tooling:** `abaplint` (Static Analysis) runs on GitHub Actions.
* **Environment:** No SAP Server (NetWeaver) required. The code is checked statically.
* **Logic:** The inputs are Strings and Floats. Keep the signature of `calculate_loan` intact.

---

### 🚀 Execution Instructions

1.  **Fork** this repository.
2.  (Optional) Install abaplint locally: `npm install -g @abaplint/cli`.
3.  **Refactor Logic:** Edit `src/zcl_ps_refactor.clas.abap`.
4.  **Add Tests (Level 1):** Edit `src/zcl_ps_refactor.clas.testclasses.abap`.
5.  Run checks:
    ```bash
    abaplint
    ```
6.  Submit via **Pull Request**.

### 🧪 Evaluation Criteria (PureStack Audit)

| Criteria | Weight | Audit Focus |
| :--- | :--- | :--- |
| **Modern Syntax** | 35% | Usage of `SWITCH`, `COND`, `VALUE` vs `IF/ELSE`. |
| **Clean Code** | 30% | Usage of Constants vs Magic Numbers. |
| **Testability** | 20% | Presence of working Unit Tests (Level 1). |
| **Formatting** | 15% | Proper indentation and Pretty Printer style. |

---

### 🚨 Project Structure (Strict)
Do NOT move or rename the files.

```text
/
├── .github/workflows/                 # PureStack Audit System
├── src/
│   ├── zcl_ps_refactor.clas.abap      # <--- YOUR LOGIC HERE
│   ├── zcl_ps_refactor.clas.xml       # Metadata (Do not touch)
│   └── zcl_ps_refactor.clas.testclasses.abap # <--- YOUR TESTS HERE
├── abaplint.json                      # Linter Rules
└── README.md
