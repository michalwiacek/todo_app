import { useState, useEffect } from "react";
import TodoLists from "./TodoLists.jsx";
import SignIn from "./SignIn.jsx";

export default function App() {
  const [isLoggedIn, setIsLoggedIn] = useState(false);
  const [collection, setCollection] = useState([]);

  useEffect(() => {
    if (!isLoggedIn) return;

    const url = "/api/todo_lists";

    function getAuthHeaders() {
      const token = localStorage.getItem("auth_token");
      return {
        "Content-Type": "application/json",
        "Authorization": `Bearer ${token}`
      };
    }

    const fetchData = async () => {
      try {
        const response = await fetch(url, {
          headers: getAuthHeaders()
        });
        const json = await response.json();
        setCollection(json);
      } catch(error) {
        console.error(error);
      }
    };

    fetchData();
  }, [isLoggedIn]);

  const handleSignIn = (token) => {
    localStorage.setItem("auth_token", token);
    setIsLoggedIn(true);
  };

  return isLoggedIn ? (
    <TodoLists collection={collection} />
  ) : (
    <SignIn onSignIn={handleSignIn} />
  );
}
