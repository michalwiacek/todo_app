import { useState, useEffect } from "react";
import TodoLists from "./TodoLists.jsx";

export default function App() {
  const [collection, setCollection] = useState([]);

  useEffect(() => {
    const url = "/api/todo_lists";

    const fetchData = async () => {
      try {
        const response = await fetch(url);
        const json = await response.json();
        setCollection(json);
      } catch(error) {
        console.error(error);
      }
    };

    fetchData();
  }, []);

  return(
    <TodoLists collection={collection} />
  );
}
