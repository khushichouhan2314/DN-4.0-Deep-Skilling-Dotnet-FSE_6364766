# Blog App

## Objectives

This project was built to:
- Understand the **need and benefits** of component lifecycle in React.
- Identify various **lifecycle hook methods**.
- Implement `componentDidMount()` to load external data.
- Handle UI rendering errors gracefully using `componentDidCatch()`.
- Render a list of blog posts fetched from an API.

--

## 🛠️ Prerequisites

Ensure you have the following installed:

- Node.js
- npm
- Visual Studio Code

---

## Installation


### **1. Create the app using create-react-app** 
```bash
npx create-react-app blogapp
cd blogapp
```
### 2. Replace/Add the following files as described below
- Post.js

---

## Implementation
- Post Model (`Post.js`)
```js
class Post {
  constructor(id, title, body) {
    this.id = id;
    this.title = title;
    this.body = body;
  }
}
```
`Posts` Component
- `constructor`: Initializes state with empty posts.
- `loadPosts()`: Fetches data from `https://jsonplaceholder.typicode.com/posts`.
- `componentDidMount()`: Triggers API call after mounting.
- `componentDidCatch()`: Catches any render-time errors.
- `render()`: Maps post data to HTML using `<h2>` and `<p>`.
Renders the `Posts` component in the root application view.

---

## Usage
```bash
npm start
```