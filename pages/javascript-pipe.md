# Pipe

A lazy implementation of the pipe function to chain sync and async functionality on dependent values

> **Note**: The logic here is very simplistic and has no logical barriers or check, so you can extend it to your requirements as needed.

> **Note**: The execution only starts when `.value()` is called

If you are looking for a more reactive and observable apporach `wonka` and `xstream` are highly recommended, you will need understanding of reactive streams to work with them though.

```js
const namespace = Symbol.for("REAPER_PIPE");

const pipe = (initData, chain = []) => {
  let _data = initData;

  if (_data && _data.__namespace === namespace) {
    chain.push(() => _data.value());
  }

  if (typeof initData === "function") {
    _data = initData();
  }

  return {
    __namespace: namespace,
    _(fn) {
      chain.push(fn);
      return this;
    },
    async value() {
      let initValue = _data;
      if (_data instanceof Promise) {
        initValue = await _data;
      }
      return chain.reduce((acc, item) => {
        return acc.then((prev) => {
          return item(prev);
        });
      }, Promise.resolve(initValue));
    },
  };
};
```

## Usage

```js
const mul2 = (val) => val * 2;
const mul3 = (val) => val * 3;

const p1 = pipe()
  ._(() => 1)
  ._(mul2);
const result = await p1.value(); // 2

// DONT: you can extend a chain, though not recommended
const p2 = p1._(mul3);
const result2 = await p2.value(); // 6

// Instead: wrap the pipe in another one.
const p1 = pipe()
  ._(() => 1)
  ._(mul2);
const result = await p1.value();

// ↓↓↓↓ Wrapped in pipe ↓↓↓↓↓
const p2 = pipe(p1)._(mul3);
const result2 = await p2.value();
```
