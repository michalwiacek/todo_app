export default function TodoListGrid({model}) {
  return(
    <section className="card g-col-4">
      <div className="card-body">
        <p className="card-text">
          {model.title}
        </p>
      </div>
    </section>
  );
}
