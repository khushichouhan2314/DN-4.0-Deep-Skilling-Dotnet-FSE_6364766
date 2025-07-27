# First React App
## Objectives

- Understand what a Single Page Application (SPA) is
- Learn how to use `create-react-app` to scaffold a React project
- Set up a React environment using Node.js and npm
- Run and view a simple React app in the browser

---

## Prerequisites

Before you begin, make sure you have:

- [Node.js & npm](https://nodejs.org/en/download/) installed
- Visual Studio Code or any code editor
- A modern web browser (Chrome, Firefox, Edge)

To verify Node.js and npm are installed:

```bash
node -v
npm -v
```
---
## Getting Started
Follow these steps to create and run your first React application:

### **1. Install Create React App (CRA) globally**
```bash
npm install -g create-react-app
```

### **2. Create a new React App**
```bash
npx create-react-app myfirstreact
```
> This creates a folder called `myfirstreact` with the **React boilerplate**.

### **3. Navigate into the project folder**
```bash
cd myfirstreact
```

### **4. Modify `App.js`**
```jsx
import React from 'react';

function App() {
  return (
    <h1>Welcome to the first session of React</h1>
  );
}

export default App;
```
---
## Running the Application
Start the development server with:
```bash
npm start
```
---
## Key Concepts

- **What is React?**
    React is a JavaScript library for building user interfaces using reusable **components** and a **virtual DOM** for performance.

- **What is SPA?**
    SPA stands for **Single Page Application**, where navigation doesn't reload the page, offering a smoother user experience.

- **What is Virtual DOM?**
    A **Virtual DOM** is a lightweight copy of the real DOM that React uses to efficiently update UI without manipulating the browser DOM directly.