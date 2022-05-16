### URQL | Fetch Options Exchange

Simple fetch options mapper for stuff like simple JWT auth and operation header modifications when working with urql.

```js
export const fetchOptionsExchange =
  (fn) =>
  ({ forward }) =>
  (ops$) => {
    return pipe(
      ops$,
      mergeMap((operation) => {
        const result = fn(operation.context.fetchOptions);
        return pipe(
          typeof result.then === "function"
            ? fromPromise(result)
            : fromValue(result),
          map((fetchOptions) => {
            return makeOperation(operation.kind, operation, {
              ...operation.context,
              fetchOptions,
            });
          })
        );
      }),
      forward,
      map((op) => {
        if (op.error) {
          console.error({ error: op.error });
        }
        return op;
      })
    );
  };
```

#### Usage

```js
export const client = createClient({
  url: config.API_URL,
  requestPolicy: "cache-and-network",
  exchanges: [
    dedupExchange,
    fetchOptionsExchange(async (fetchOptions) => {
      const token = await getToken();
      const userId = await getUser();
      const headers = {};

      if (token) {
        headers.Authorization = token ? `Bearer ${token}` : "";
      }
      if (userId) {
        headers["x-hasura-user-id"] = userId ? userId : "";
      }

      return Promise.resolve({
        ...fetchOptions,
        headers: headers,
      });
    }),
    fetchExchange,
  ],
});
```
