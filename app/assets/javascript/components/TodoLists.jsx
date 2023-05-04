import TodoListGrid from "./TodoListGrid.jsx";

export default function TodoLists({collection}) {
  return(
    <article className="grid text-center">
      {collection && collection.map(el =>
        <TodoListGrid key={el.id} model={el} />
      )}
    </article>
  );
}
