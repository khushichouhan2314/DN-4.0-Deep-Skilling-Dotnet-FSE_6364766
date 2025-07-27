#  StudentApp – Student Management Portal
## Objectives

- Understand React class components
- Learn constructor and `render()` function usage
- Create and reuse components in a React app

---

## Prerequisites

- Node.js & npm
- Visual Studio Code

---

## Getting Started

### **1. Create the app**

```bash
npx create-react-app studentapp
cd studentapp
```
### **2. Create component structure**
Inside `src/Components`, create three files:
- `Home.js`
- `About.js`
- `Contact.js`

### **3. Sample Component Code**
*Example*: `Home.js`
```jsx
import React, { Component } from 'react';

class Home extends Component {
    render() {
        return (
        <div>
            <h2>Welcome to the Home page of the Student Management Portal</h2>
        </div>
        );
    }
}

export default Home;
```
> Repeat similarly for `About.js` and `Contact.js` with respective messages.

### **4. Modify App.js to include all components**
```jsx
import React from 'react';
import './App.css';
import Home from './Components/Home';
import About from './Components/About';
import Contact from './Components/Contact';

function App() {
  return (
    <div className="container">
      <h1>Student Management Portal</h1>
      <Home />
      <About />
      <Contact />
    </div>
  );
}

export default App;
```
---
## Run the Application
```bash
npm start
```