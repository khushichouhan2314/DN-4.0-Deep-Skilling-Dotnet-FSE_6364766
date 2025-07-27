# Cohort Dashboard – Styling React Components

## Objectives

- Understand the need for styling in React components
- Learn to use **CSS Modules** for scoped styling
- Apply conditional **inline styles** for dynamic visual feedback
- Build a styled dashboard component (`CohortDetails`)

---

## Prerequisites

To run this project locally, ensure you have:
- Node.js
- NPM
- Visual Studio Code
---

## Project Setup

```bash
# 1. Clone or unzip the project
cd cohort-dashboard

# 2. Install dependencies
npm install

# 3. Start the development server
npm start
```

---

# Styling Techniques Used
### `Component/CohortDetails.module.css`
Scoped styles for the component using a CSS Module:
```css
.box {
    width: 300px;
    display: inline-block;
    margin: 10px;
    padding: 10px 20px;
    border: 1px solid black;
    border-radius: 10px;
}

dt {
    font-weight: 500;
}
```
###  Conditional Inline Styling
The `<h3>` element uses a **green** color if the cohort status is `ongoing`, and **blue** otherwise:
```jsx
const statusColor = cohort.currentStatus.toLowerCase().trim() === 'ongoing' ? 'green' : 'blue';
...
<div className={styles.box}>
    <h3 style={{ color: statusColor }}>
        {props.cohort.cohortCode} -
        <span>{props.cohort.technology}</span>
    </h3>
    ...
<div>
```

---

## Final Output Preview
- Each cohort is shown in a styled box with borders and padding
- The title (`<h3>`) turns green for ongoing cohorts and blue otherwise
-  Labels are semi-bold (`font-weight: 500`) using the `<dt>` tag style